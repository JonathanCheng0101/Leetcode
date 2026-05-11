# Write your MySQL query statement below
WITH t AS(
    SELECT *,
    DENSE_RANK() OVER(ORDER BY salary DESC) AS rn
    FROM Employee
    )

SELECT (SELECT MAX(salary) 
        FROM t
        WHERE rn = 2) AS SecondHighestSalary

