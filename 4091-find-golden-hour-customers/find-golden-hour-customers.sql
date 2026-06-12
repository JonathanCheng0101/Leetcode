# Write your MySQL query statement below
SELECT customer_id,
       COUNT(customer_id) AS total_orders,
       ROUND(100 * SUM(CASE WHEN (DATE_FORMAT(order_timestamp, "%H:%i:%s") BETWEEN '11:00:00' AND '14:00:00') OR (DATE_FORMAT(order_timestamp, "%H:%i:%s") BETWEEN '18:00:00' AND '21:00:00') THEN 1 ELSE 0 END) / COUNT(customer_id))AS peak_hour_percentage,
       ROUND(SUM(order_rating) / COUNT(order_rating), 2) AS average_rating
FROM restaurant_orders
GROUP BY customer_id
HAVING COUNT(customer_id) >= 3
       AND
       SUM(CASE WHEN (DATE_FORMAT(order_timestamp, "%H:%i:%s") BETWEEN '11:00:00' AND '14:00:00') OR (DATE_FORMAT(order_timestamp, "%H:%i:%s") BETWEEN '18:00:00' AND '21:00:00') THEN 1 ELSE 0 END) / COUNT(customer_id) >= 0.6
       AND 
       SUM(order_rating) / COUNT(order_rating) >= 4
       AND
       COUNT(order_rating) / COUNT(*) >= 0.5 
ORDER BY average_rating DESC, customer_id DESC;