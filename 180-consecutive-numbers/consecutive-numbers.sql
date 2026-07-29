# Write your MySQL query statement below
WITH t AS(
    SELECT num,
        CASE WHEN (LEAD(num)OVER(ORDER BY id ASC) = num) AND (LAG(num)OVER(ORDER BY id ASC) = num) THEN 1 END AS chk
    FROM Logs
)
SELECT DISTINCT num AS ConsecutiveNums
FROM t
WHERE chk = 1