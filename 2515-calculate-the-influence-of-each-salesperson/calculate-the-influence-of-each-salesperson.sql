# Write your MySQL query statement below
WITH t AS(
    SELECT c.salesperson_id,
           SUM(s.price) AS total
    FROM Customer c
    JOIN Sales s
    ON c.customer_id = s.customer_id
    GROUP BY c.salesperson_id
)
SELECT s.salesperson_id,
       s.name,
       IFNULL(t.total, 0) AS total
FROM Salesperson s
LEFT JOIN t
ON s.salesperson_id = t.salesperson_id