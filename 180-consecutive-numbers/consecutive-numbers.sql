WITH t AS(
    SELECT num,
        CASE WHEN LAG(num)OVER(ORDER BY id ASC) = num AND LEAD(num)OVER(ORDER BY id ASC) = num THEN 1 ELSE 0 END AS chk
    FROM Logs
)
SELECT DISTINCT num AS ConsecutiveNums
FROM t
WHERE chk = 1;