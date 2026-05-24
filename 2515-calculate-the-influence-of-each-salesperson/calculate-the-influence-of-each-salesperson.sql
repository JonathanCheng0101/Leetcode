# Write your MySQL query statement below
WITH t AS(
    SELECT s.salesperson_id,
       s.name,
       c.customer_id
    FROM Salesperson s
    LEFT JOIN Customer c
    ON s.salesperson_id = c.salesperson_id
)
SELECT t.salesperson_id,
       t.name,
       IFNULL(SUM(s.price), 0) AS total
FROM t
LEFT JOIN Sales s
ON t.customer_id = s.customer_id
GROUP BY t.salesperson_id


