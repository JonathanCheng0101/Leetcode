# Write your MySQL query statement below
SELECT *
FROM Products
WHERE name REGEXP '([^0-9]|^)[0-9][0-9][0-9]([^0-9]|$)'
ORDER BY product_id ASC;