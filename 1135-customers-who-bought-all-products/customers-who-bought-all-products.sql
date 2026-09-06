WITH t AS(
    SELECT COUNT(DISTINCT product_key) AS cnt
    FROM Product
), a AS(
    SELECT customer_id,
            product_key
    FROM Customer
    WHERE product_key IN (
        SELECT product_key
        FROM Product
    )
)
, b AS(
    SELECT a.customer_id,
       COUNT(DISTINCT a.product_key) AS chk,
       t.cnt
    FROM a
    CROSS JOIN t
    GROUP BY a.customer_id
)
SELECT customer_id
FROM b
WHERE cnt = chk;
