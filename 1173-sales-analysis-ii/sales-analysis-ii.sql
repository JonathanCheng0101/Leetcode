# Write your MySQL query statement below
SELECT DISTINCT buyer_id
FROM Sales s
WHERE  buyer_id NOT IN(
    SELECT s.buyer_id
    FROM Sales s
    LEFT JOIN Product p
    ON s.product_id = p.product_id
    WHERE product_name = 'iPhone'
) AND buyer_id IN(
    SELECT s.buyer_id
    FROM Sales s
    LEFT JOIN Product p
    ON s.product_id = p.product_id
    WHERE product_name = 'S8'
);