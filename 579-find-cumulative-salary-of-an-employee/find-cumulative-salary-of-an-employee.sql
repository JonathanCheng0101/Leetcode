# Write your MySQL query statement below
WITH t AS(
    SELECT e1.id, e1.`month`, e1.salary AS salary_1, e2.salary AS salary_2, e3.salary AS salary_3
FROM Employee e1
LEFT JOIN Employee e2
ON e1.id = e2.id AND e1.`month` - 1 = e2.`month` 
LEFT JOIN Employee e3
ON e1.id = e3.id AND e1.`month` - 2 = e3.`month` 
ORDER BY e1.id, e1.`month`
), a AS(
    SELECT id, `month`, IFNULL(salary_1, 0)+ IFNULL(salary_2, 0)+ IFNULL(salary_3, 0) AS Salary, MAX(`month`)OVER(PARTITION BY id) AS max_month
FROM t
ORDER BY id, `month`

)
SELECT id, `month`, Salary
FROM a
WHERE `month` <> max_month
ORDER BY id ASC, `month` DESC;
