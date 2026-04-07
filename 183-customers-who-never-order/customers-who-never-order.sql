# Write your MySQL query statement below
SELECT c.name Customers
FROM Customers c
LEFT JOIN Orders o
ON o.customerID = c.id
WHERE o.id is NULL