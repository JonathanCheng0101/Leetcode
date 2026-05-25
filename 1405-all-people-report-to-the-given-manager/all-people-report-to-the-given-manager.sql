# Write your MySQL query statement below
WITH t AS(
    SELECT employee_id,
           manager_id
    FROM Employees 
    WHERE manager_id = 1 AND employee_id != 1
),
a AS(
    SELECT employee_id
    FROM Employees
    WHERE manager_id IN (SELECT employee_id FROM t)
),
b AS(
    SELECT employee_id
    FROM Employees
    WHERE manager_id IN (SELECT employee_id FROM a)
)
SELECT employee_id
FROM t
UNION
SELECT employee_id
FROM a
UNION
SELECT employee_id
FROM b
