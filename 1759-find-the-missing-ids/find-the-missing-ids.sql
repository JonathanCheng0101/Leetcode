# Write your MySQL query statement below
WITH RECURSIVE num AS(
    SELECT 1 AS ids

    UNION ALL

    SELECT ids + 1
    FROM num
    WHERE ids < (SELECT MAX(customer_id) FROM Customers)
)

SELECT num.ids
FROM num
LEFT JOIN Customers c
ON num.ids = c.customer_id
WHERE c.customer_id IS NULL