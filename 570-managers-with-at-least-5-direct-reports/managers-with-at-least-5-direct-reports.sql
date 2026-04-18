# Write your MySQL query statement below
SELECT e1.name
FROM Employee e2
JOIN Employee e1
ON e2.managerId = e1.id
GROUP BY e2.managerId
HAVING COUNT(e2.managerId) >= 5; 
