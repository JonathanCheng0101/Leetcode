# Write your MySQL query statement below
WITH t AS(
    SELECT employee_id,
        SUM(duration_hours) AS duration_hours,
        YEARWEEK(meeting_date, 1) AS week_chk
    From meetings
    GROUP BY employee_id, YEARWEEK(meeting_date, 1)
), a AS(
    SELECT employee_id, COUNT(*) AS meeting_heavy_weeks
    FROM t
    WHERE duration_hours > 20
    GROUP BY employee_id 
    HAVING COUNT(*) >=2
)
SELECT a.employee_id, e.employee_name, e.department, a.meeting_heavy_weeks
FROM employees e
JOIN a
ON e.employee_id = a.employee_id
ORDER BY a.meeting_heavy_weeks DESC, e.employee_name ASC;
       