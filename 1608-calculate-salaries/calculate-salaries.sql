# Write your MySQL query statement below
WITH t AS(
    SELECT *,
        MAX(salary)OVER(PARTITION BY company_id) AS max_salary
    FROM Salaries
)
SELECT company_id,
       employee_id,
       employee_name,
       CASE WHEN max_salary < 1000 THEN salary
            WHEN max_salary> 10000 THEN ROUND(0.51 * salary)
            ELSE ROUND(0.76* salary) END AS salary
FROM t
