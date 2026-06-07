# Write your MySQL query statement below
WITH t AS(
    SELECT employee_id,
        SUM(CEIL(TIMESTAMPDIFF(SECOND, in_time, out_time)/60))/60 AS duration
    FROM Logs
    GROUP BY employee_id
)
SELECT e.employee_id        
FROM Employees e
LEFT JOIN t
ON t.employee_id = e.employee_id
WHERE needed_hours > IFNULL(t.duration, 0)
