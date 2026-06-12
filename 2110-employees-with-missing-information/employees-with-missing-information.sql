WITH t AS(
    SELECT employee_id 
    FROM Employees
    UNION ALL
    SELECT employee_id 
    FROM Salaries
)
SELECT t.employee_id
FROM t
LEFT JOIN Employees e
ON t.employee_id = e.employee_id 
LEFT JOIN Salaries s
ON t.employee_id = s.employee_id 
WHERE e.name IS NULL OR s.salary IS NULL
ORDER BY t.employee_id ASC