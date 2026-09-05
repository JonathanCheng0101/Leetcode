WITH t AS(
    SELECT name AS Employee,
        salary AS Salary,
        departmentId,
        DENSE_RANK()OVER(PARTITION BY departmentId ORDER BY salary DESC) AS rn
    FROM Employee
)
SELECT d.name AS Department,
       t.Employee,
       t.Salary
FROM t
JOIN Department d
ON t.departmentId = d.id
WHERE rn = 1;