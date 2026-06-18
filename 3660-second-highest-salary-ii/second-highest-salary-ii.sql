# Write your MySQL query statement below
WITH t AS(
    SELECT *,
        DENSE_RANK()OVER(PARTITION BY dept ORDER BY salary DESC) AS rn
    FROM employees
)
SELECT emp_id,
       dept
FROM t
WHERE rn = 2
ORDER BY emp_id ASC;