# Write your MySQL query statement below
WITH t AS(
    SELECT person_name,
           turn,
           SUM(weight) OVER(ORDER BY turn ASC) AS total_weight
    FROM Queue
)
SELECT person_name
FROM t
WHERE total_weight <= 1000
ORDER BY total_weight DESC
LIMIT 1;

