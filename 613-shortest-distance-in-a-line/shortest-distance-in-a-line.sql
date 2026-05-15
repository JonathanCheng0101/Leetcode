# Write your MySQL query statement below
WITH t AS (
    SELECT ABS(LEAD(x) OVER (ORDER BY x DESC) - x) AS diff
    FROM `Point`
)
SELECT MIN(diff) AS shortest
FROM t