WITH t AS(
    SELECT *, COUNT(department_id)OVER(PARTITION BY employee_id) AS depart_cnt
    FROM Employee
)
SELECT employee_id, department_id
FROM t
WHERE depart_cnt = 1 OR primary_flag = 'Y';