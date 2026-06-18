# Write your MySQL query statement below
WITH t AS(
    SELECT customer_id, YEAR(order_date) AS yr, price
    FROM Orders
), a AS(
    SELECT customer_id, yr, SUM(price) AS price
    FROM t
    GROUP BY customer_id, yr
), b AS(
    SELECT *,
       LAG(yr)OVER(PARTITION BY customer_id ORDER BY yr ASC) AS last_yr,
       LAG(price)OVER(PARTITION BY customer_id ORDER BY yr ASC) AS last_price
    FROM a
), c AS(
    SELECT *,
       CASE WHEN yr - last_yr = 1 AND price > last_price THEN 1 ELSE 0 END AS chk
    FROM b
)
SELECT customer_id
FROM c
GROUP BY customer_id
HAVING COUNT(customer_id) - 1 = SUM(chk)
 

