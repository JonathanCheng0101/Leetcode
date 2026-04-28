# Write your MySQL query statement below
SELECT seller_id
FROM (
    SELECT seller_id,
       DENSE_RANK() OVER (ORDER BY SUM(price) DESC) AS rnk
    FROM Sales
    GROUP BY seller_id
    ) t
WHERE rnk = 1;