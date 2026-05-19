WITH t AS(
    SELECT COUNT(DISTINCT product_key) AS total_cnt
    FROM Product
)
SELECT customer_id
FROM Customer c
JOIN t
GROUP BY c.customer_id
HAVING COUNT(DISTINCT c.product_key) = MAX(t.total_cnt);