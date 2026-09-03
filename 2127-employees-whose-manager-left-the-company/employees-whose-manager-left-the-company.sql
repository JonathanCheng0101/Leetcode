SELECT e1.employee_id
FROM Employees e1
WHERE NOT EXISTS(
    SELECT 1
    FROM Employees e2
    WHERE e1.manager_id = e2.employee_id OR e1.manager_id IS NULL
) AND e1.salary < 30000
ORDER BY e1.employee_id;