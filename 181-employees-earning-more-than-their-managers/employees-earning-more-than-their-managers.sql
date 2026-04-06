# Write your MySQL query statement below
SELECT e.name AS Employee
FROM Employee e
JOIN Employee m
on e.managerID = m.id
WHERE e.salary > m.salary;


#ON 是告訴資料庫兩張表要怎麼配對。
#JOIN 只是說「我要合併」，但資料庫不知道哪一行要對哪一行，所以用 ON 給出規則：
#sqlJOIN Employee m
#ON e.managerId = m.id