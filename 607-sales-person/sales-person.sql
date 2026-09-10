WITH t AS(
    SELECT o.sales_id
    FROM Orders o
    WHERE EXISTS(
        SELECT 1
        FROM Company c
        WHERE c.name = 'RED' AND c.com_id = o.com_id
    )
)
SELECT s.name
FROM SalesPerson s
WHERE NOT EXISTS(
    SELECT 1
    FROM t
    WHERE s.sales_id = t.sales_id
)