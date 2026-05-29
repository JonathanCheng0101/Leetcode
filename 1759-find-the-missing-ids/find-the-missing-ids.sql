WITH RECURSIVE t AS(
    SELECT 1 AS number

    UNION ALL

    SELECT number + 1
    FROM t
    WHERE number < (SELECT MAX(customer_id)FROM Customers)
)
SELECT t.number AS ids
FROM t
LEFT JOIN Customers c
ON t.number = c.customer_id
WHERE c.customer_id IS NULL