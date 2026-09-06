# Write your MySQL query statement below
WITH t AS(
    SELECT *,
        SUM(weight)OVER(ORDER BY turn ASC) AS sum_weight
    FROM Queue
)
SELECT person_name
FROM t
WHERE sum_weight <= 1000
ORDER BY sum_weight DESC
LIMIT 1;