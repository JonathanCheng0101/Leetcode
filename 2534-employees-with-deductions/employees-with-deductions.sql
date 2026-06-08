# Write your MySQL query statement below
WITH t AS(
    SELECT employee_id,
        SUM(CEIL(TIMESTAMPDIFF(second, in_time, out_time)/60)) AS total_time
    FROM Logs
    GROUP BY employee_id
)
SELECT e.employee_id
FROM Employees e
LEFT JOIN t
ON e.employee_id = t.employee_id
WHERE e.needed_hours * 60 > IFNULL(total_time, 0);