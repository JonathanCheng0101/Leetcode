# Write your MySQL query statement below
WITH t AS(
    SELECT *,
       RANK()OVER(PARTITION BY department_id ORDER BY mark DESC) AS rn
    FROM Students
)
SELECT student_id,
       department_id,
       IFNULL(ROUND(100 * (rn - 1)/(COUNT(student_id)OVER(PARTITION BY department_id) - 1),2),0) AS percentage
FROM t
