WITH t AS(
    SELECT o.sales_id
    FROM Orders o
    WHERE EXISTS(
        SELECT 1
        FROM Company c
        WHERE o.com_id = c.com_id AND c.name = 'RED'
    )
)
SELECT s.name
FROM SalesPerson s
WHERE NOT EXISTS(
    SELECT 1
    FROM t
    WHERE s.sales_id = t.sales_id
)