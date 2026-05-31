# Write your MySQL query statement below
WITH t AS(
    SELECT *,
           COUNT(salary)OVER(PARTITION BY salary) AS cnt
    FROM Employees
)
SELECT employee_id,
       name, 
       salary,
       DENSE_RANK()OVER(ORDER BY salary ASC) AS team_id
FROM t
WHERE cnt > 1
ORDER BY team_id ASC, employee_id ASC;
