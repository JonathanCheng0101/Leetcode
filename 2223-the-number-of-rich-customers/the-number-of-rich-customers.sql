# Write your MySQL query statement below

WITH t AS(
    SELECT DISTINCT customer_id
    FROM Store
    GROUP BY customer_id
    HAVING MAX(amount) > 500
)
SELECT COUNT(customer_id) AS rich_count
FROM t
