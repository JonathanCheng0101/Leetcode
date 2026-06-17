WITH t AS(
    SELECT *,
        RANK()OVER(PARTITION BY department ORDER BY salary DESC) AS rn
    FROM Salaries
), a AS(
    SELECT department, salary
    FROM t
    WHERE rn = 1
)
SELECT ABS(a1.salary- a2.salary) AS salary_difference
FROM a a1
JOIN a a2
ON a1.department = 'Marketing' AND a2.department = 'Engineering'