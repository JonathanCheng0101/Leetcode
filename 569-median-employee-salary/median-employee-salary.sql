# Write your MySQL query statement below
WITH t AS(
    SELECT *,
       ROW_NUMBER() OVER(PARTITION BY company ORDER BY salary ASC) AS rn,
       COUNT(salary) OVER(PARTITION BY company) AS cnt
    FROM Employee
    ORDER BY company, rn
)
SELECT id, company, salary       
FROM t
WHERE rn BETWEEN (cnt + 1) DIV 2 AND (cnt + 2) DIV 2
ORDER BY salary ASC, id ASC;