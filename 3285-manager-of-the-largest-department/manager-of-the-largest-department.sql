# Write your MySQL query statement below
WITH t AS(
    SELECT *,
        COUNT(dep_id)OVER(PARTITION BY dep_id) AS cnt
    FROM Employees
), a AS(
    SELECT *,
       RANK()OVER(ORDER BY cnt DESC) AS rn
    FROM t
)
SELECT emp_name AS manager_name, dep_id
FROM a
WHERE rn = 1 AND position = 'Manager'
Order BY dep_id ASC;
