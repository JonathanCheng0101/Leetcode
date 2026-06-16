# Write your MySQL query statement below
WITH t AS(
    SELECT *,
        ROW_NUMBER()OVER() AS rn
    FROM EmployeeShifts
), a AS(
    SELECT t1.employee_id,
       t1.start_time AS t1_start,
       t1.end_time AS t1_end,
       t2.start_time AS t2_start,
       t2.end_time AS t2_end
    FROM t t1
    JOIN t t2
    ON t1.employee_id = t2.employee_id
    WHERE t1.rn != t2.rn
    GROUP BY employee_id, LEAST(t1_start, t2_start), LEAST(t1_end, t2_end), GREATEST(t1_start, t2_start), GREATEST(t1_end, t2_end)
)
SELECT employee_id, COUNT(*) AS overlapping_shifts
FROM a
WHERE t1_end > t2_start AND t1_start < t2_end
GROUP BY employee_id
ORDER BY employee_id ASC
