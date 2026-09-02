# Write your MySQL query statement below
WITH t AS(
    SELECT customer_number,
        COUNT(*) AS cnt
    FROM Orders
    GROUP BY customer_number
    )

SELECT customer_number
FROM t
ORDER BY cnt DESC
LIMIT 1;
