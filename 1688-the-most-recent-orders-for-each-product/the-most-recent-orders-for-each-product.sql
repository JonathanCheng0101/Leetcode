# Write your MySQL query statement below
WITH t AS(
    SELECT order_id, 
       order_date,
       product_id,
       DENSE_RANK() OVER (PARTITION BY product_id ORDER BY order_date DESC) AS rn
    FROM Orders
)
SELECT p.product_name, 
       t.product_id,
       t.order_id,
       t.order_date
FROM t
JOIN Products p
ON t.product_id = p.product_id
WHERE rn = 1
ORDER BY p.product_name ASC, t.product_id ASC, t.order_id ASC;
