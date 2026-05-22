WITH t AS(
    SELECT *,
           MAX(salary)OVER(PARTITION BY company_id) as max_salary
    FROM Salaries
), a AS(
    SELECT *,
           CASE WHEN salary < 1000 THEN 0
                WHEN salary BETWEEN 1000 AND 10000 THEN 0.24
                WHEN salary > 10000 THEN 0.49 END AS tax
    FROM t
    WHERE salary = max_salary
)
SELECT s.company_id,
       s.employee_id,
       s.employee_name,
       ROUND(s.salary * (1- a.tax),0) AS salary
FROM Salaries s
JOIN a
ON s.company_id = a.company_id;
