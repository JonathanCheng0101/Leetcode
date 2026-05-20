# Write your MySQL query statement below
WITH t AS(
    SELECT p.project_id,
           e.employee_id,
           DENSE_RANK() OVER(PARTITION BY p.project_id ORDER BY e.experience_years DESC) AS rn
    FROM Project p
    JOIN Employee e
    ON p.employee_id = e.employee_id
)
SELECT project_id, employee_id
FROM t
WHERE rn = 1;