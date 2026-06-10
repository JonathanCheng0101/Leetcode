WITH t AS(
    SELECT *,
        COUNT(employee_id)OVER(PARTITION BY employee_id) AS cnt
    FROM Employee
)
SELECT employee_id, department_id
FROM t
WHERE cnt = 1 OR (cnt > 1 AND primary_flag = 'Y');