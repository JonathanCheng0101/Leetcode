# Write your MySQL query statement below
WITH order_cnt AS( 
    SELECT customer_id, COUNT(customer_id) AS total_orders
    FROM restaurant_orders
    GROUP BY customer_id
    HAVING COUNT(customer_id) >= 3
), 
t AS(
    SELECT customer_id,
    SUM(CASE WHEN (DATE_FORMAT(order_timestamp, '%H:%i:%s') BETWEEN '11:00:00' AND '14:00:00') OR (DATE_FORMAT(order_timestamp, '%H:%i:%s') BETWEEN '18:00:00' AND '21:00:00') THEN 1 ELSE 0 END) / COUNT(customer_id) AS order_rate
    FROM restaurant_orders
    GROUP BY customer_id
),
 order_rate AS(
    SELECT customer_id, ROUND(100 * order_rate) AS peak_hour_percentage 
    FROM t
    WHERE order_rate>= 0.6
), 
rated AS(
    SELECT customer_id,
        COUNT(order_rating)/COUNT(*) AS rate
    FROM restaurant_orders
    GROUP BY customer_id
),
 b AS(
    SELECT customer_id
    FROM rated
    WHERE rate >= 0.5
),

a AS(
    SELECT customer_id,
        ROUND(SUM(order_rating)/COUNT(order_rating), 2) AS rate
    FROM restaurant_orders
    GROUP BY customer_id
)
SELECT a.customer_id,
       o.total_orders,
       orate.peak_hour_percentage,
       a.rate AS average_rating
FROM a
JOIN order_cnt o
ON o.customer_id = a.customer_id
JOIN order_rate orate
ON orate.customer_id = a.customer_id
JOIN b
ON b.customer_id = a.customer_id
WHERE a.rate >= 4
ORDER BY a.rate DESC, a.customer_id DESC



