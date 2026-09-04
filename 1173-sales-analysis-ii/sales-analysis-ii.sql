# Write your MySQL query statement below
WITH t AS(
    SELECT buyer_id
    FROM Sales s
    JOIN Product p
    ON s.product_id = p.product_id
    WHERE p.product_name = 'S8'
), a AS(
    SELECT buyer_id
    FROM Sales s
    JOIN Product p
    ON s.product_id = p.product_id
    WHERE p.product_name = 'iPhone'
)
SELECT DISTINCT t.buyer_id
FROM t
WHERE NOT EXISTS(
    SELECT 1
    FROM a
    WHERE t.buyer_id = a.buyer_id
)