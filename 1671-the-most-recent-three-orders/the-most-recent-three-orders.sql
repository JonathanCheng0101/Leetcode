# Write your MySQL query statement below
WITH t AS(
    SELECT *,
        ROW_NUMBER()OVER(PARTITION BY customer_id ORDER BY order_date DESC) AS rn
    FROM Orders
)
SELECT c.name AS customer_name,
       c.customer_id,
       t.order_id,
       t.order_date
FROM t
JOIN Customers c
ON t.customer_id = c.customer_id
WHERE rn = 1 OR rn = 2 OR rn = 3
ORDER BY customer_name ASC, c.customer_id ASC, t.order_date DESC;