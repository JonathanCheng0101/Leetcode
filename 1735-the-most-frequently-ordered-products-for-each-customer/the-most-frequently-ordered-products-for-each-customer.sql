# Write your MySQL query statement below
WITH t AS(
    SELECT customer_id,
           product_id,
           COUNT(*) AS cnt
    FROM Orders
    GROUP BY customer_id, product_id
), a AS(
    SELECT *,
       RANK()OVER(PARTITION BY customer_id ORDER BY cnt DESC) AS rn
FROM t 
)
SELECT a.customer_id,
       a.product_id,
       p.product_name
FROM a
JOIN Products p
ON p.product_id = a.product_id
WHERE rn = 1