WITH t AS(
    SELECT *,
        DENSE_RANK()OVER(ORDER BY salary DESC) AS rn
    FROM Employee
)
SELECT MAX(CASE WHEN rn = 2 THEN salary END) AS SecondHighestSalary
FROM t
