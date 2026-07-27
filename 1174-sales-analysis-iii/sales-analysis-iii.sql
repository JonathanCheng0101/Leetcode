WITH t AS(
    SELECT DISTINCT product_id
    FROM Sales
    WHERE sale_date BETWEEN '2019-01-01' AND '2019-03-31'
), a AS(
    SELECT DISTINCT product_id
    FROM Sales
    WHERE sale_date NOT BETWEEN '2019-01-01' AND '2019-03-31'
), b  AS(
    SELECT t.product_id
FROM t
WHERE NOT EXISTS(
    SELECT 1
    FROM a
    WHERE t.product_id = a.product_id
)
)
SELECT b.product_id, p.product_name
FROM b
JOIN Product p
ON b.product_id = p.product_id;
