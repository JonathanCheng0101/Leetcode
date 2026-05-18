# Write your MySQL query statement below
# not in 補not exist
SELECT c.customer_id,
       c.customer_name
FROM Customers c
JOIN Orders o
ON o.customer_id = c.customer_id
WHERE o.customer_id NOT IN(
    SELECT DISTINCT customer_id
    FROM Orders
    WHERE product_name = 'C'
)
GROUP BY o.customer_id
HAVING COUNT(DISTINCT CASE WHEN o.product_name IN ('A','B') THEN o.product_name END)= 2
