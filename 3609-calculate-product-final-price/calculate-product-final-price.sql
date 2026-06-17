# Write your MySQL query statement below
SELECT p.product_id, p.price * (1 -  IFNULL(d.discount, 0)/100) AS final_price, p.category
FROM Products p
LEFT JOIN Discounts d
ON p.category = d.category
ORDER BY p.product_id ASC;