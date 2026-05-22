# Write your MySQL query statement below
WITH t AS(
    SELECt *,
           SUM(weight)OVER(ORDER BY turn ASC) AS total
    FROM Queue
)
SELECT person_name
FROM t
WHERE total <= 1000
ORDER BY total DESC
LIMIT 1;