# Write your MySQL query statement below
WITH t AS(
    SELECT p.invoice_id,SUM(p.quantity * pro.price) AS amount
    FROM Purchases p
    JOIN Products pro
    ON p.product_id = pro.product_id
    GROUP BY p.invoice_id
), a AS(
     SELECT *,
       RANK()OVER(ORDER BY amount DESC, invoice_id ASC) AS rn
FROM t
), b AS(
    SELECT invoice_id
    FROM a
    WHERE rn = 1
)
SELECT p.product_id, p.quantity, p.quantity*pro.price AS price
FROM Purchases p
JOIN Products pro
ON p.product_id = pro.product_id
JOIN b
ON b.invoice_id = p.invoice_id



