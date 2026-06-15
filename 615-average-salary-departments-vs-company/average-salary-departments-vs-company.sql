# Write your MySQL query statement below
WITH t AS(
    SELECT id,
        employee_id,
        amount,
        DATE_FORMAT(pay_date, "%Y-%m") AS pay_month
    FROM Salary
), a AS(
    SELECT pay_month,
       AVG(amount) AS company_avg
    FROM t
    GROUP BY pay_month
)
, b AS(
    SELECT t.pay_month,
       e.department_id,
       AVG(t.amount) AS employee_avg
    FROM t
    JOIN Employee e
    ON t.employee_id = e.employee_id
    GROUP BY t.pay_month, e.department_id
)
SELECT b.pay_month,
       b.department_id,
       CASE WHEN b.employee_avg > a.company_avg THEN 'higher'
            WHEN b.employee_avg = a.company_avg THEN 'same'
            WHEN b.employee_avg < a.company_avg THEN 'lower' END AS comparison
FROM b
JOIN a
ON b.pay_month = a.pay_month


       


