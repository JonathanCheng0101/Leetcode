SELECT event_day AS `day`,
       emp_id,
       SUM(out_time) - SUM(in_time) As total_time
FROM Employees
GROUP BY event_day, emp_id