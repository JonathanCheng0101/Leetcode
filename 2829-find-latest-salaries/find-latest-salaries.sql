WITH t AS(
    SELECT *,
        RANK()OVER(PARTITION BY emp_id ORDER BY salary DESC) AS rn
    FROM Salary
)
SELECT emp_id, firstname, lastname, salary, department_id
FROM t
WHERE rn = 1
ORDER BY emp_id ASC;