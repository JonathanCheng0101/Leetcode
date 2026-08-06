WITH t AS(
    SELECT customer_id,
        COUNT(DISTINCT product_key) AS cnt
    FROM Customer
    GROUP BY customer_id
), a AS(
    SELECT COUNT(DISTINCT product_key) AS total_cnt
    FROM Product
)
SELECT t.customer_id
FROM t
CROSS JOIN a
WHERE t.cnt = a.total_cnt;