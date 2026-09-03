WITH t AS(
    SELECT e1.employee_id,
           e1.name
    FROM Employees e1
    WHERE EXISTS(
        SELECT 1
        FROM Employees e2
        WHERE e1.employee_id = e2.reports_to
    )
)
SELECT t.employee_id,
       t.name,
       COUNT(e.reports_to) AS reports_count,
       ROUND(AVG(e.age)) AS average_age
FROM t
JOIN Employees e
ON t.employee_id = e.reports_to
GROUP BY t.employee_id, t.name
ORDER BY t.employee_id ASC; 