WITH t AS(
    SELECT emp_id, event_day, out_time - in_time AS duration
    FROM Employees
)
SELECT event_day AS `day`,
       emp_id,
       SUM(duration) AS total_time
FROM t
GROUP BY emp_id, event_day;
