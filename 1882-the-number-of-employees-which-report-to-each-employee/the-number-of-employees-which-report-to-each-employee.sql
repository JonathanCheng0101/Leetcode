WITH t AS(
    SELECT e2.employee_id AS manager_id,
          e2.name AS name,
        e1.employee_id AS employee,
        e1.age AS employee_age
    FROM Employees e1
    JOIN Employees e2
    ON e1.reports_to = e2.employee_id
)
SELECT manager_id AS employee_id,
       name,
       COUNT(employee) AS reports_count,
       ROUND(AVG(employee_age)) AS average_age
FROM t
GROUP BY manager_id
ORDER BY employee_id ASC;