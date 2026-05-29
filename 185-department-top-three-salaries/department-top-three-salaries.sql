# Write your MySQL query statement below
WITH t AS(
    SELECT d.name AS Department,
            e.name AS Employee,
            e.salary AS Salary,
            DENSE_RANK()OVER(PARTITION BY departmentId ORDER BY salary DESC) as rn
    FROM Employee e
    JOIN Department d
    ON e.departmentId = d.id
)
SELECT Department,
       Employee,
       Salary
FROM t
WHERE rn <= 3

