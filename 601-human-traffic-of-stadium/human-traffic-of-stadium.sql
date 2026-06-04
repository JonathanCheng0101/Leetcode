# Write your MySQL query statement below
WITH t AS(
    SELECT *,
        id - ROW_NUMBER()OVER(ORDER BY id ASC) AS diff
    FROM Stadium
    WHERE people >= 100
), a AS(
    SELECT diff, COUNT(diff) AS cnt
    FROM t
    GROUP BY diff
    HAVING COUNT(diff)>= 3
)
SELECT id, visit_date, people
FROM t
JOIN a
ON t.diff = a.diff
