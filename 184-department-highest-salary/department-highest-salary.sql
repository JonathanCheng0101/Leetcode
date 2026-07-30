WITH t AS(
    SELECT *,
        RANK()OVER(PARTITION BY departmentId ORDER BY salary DESC) AS rn
    FROM Employee
)
SELECT d.name AS Department,
       t.name AS Employee,
       salary AS Salary
FROM t
JOIN Department d
ON t.departmentId = d.id
WHERE rn = 1;