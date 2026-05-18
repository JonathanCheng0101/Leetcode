# Write your MySQL query statement below
WITH t AS(
    SELECT *,
           ROW_NUMBER() OVER (
                     PARTITION BY product_id 
                     ORDER BY change_date DESC) AS rn
    FROM Products
    WHERE change_date <= '2019-08-16'
),
a AS(
    SELECT DISTINCT product_id
    FROM Products
)
SELECT a.product_id,
       IFNULL(t.new_price,10) AS price
FROM a
LEFT JOIN t
ON a.product_id = t.product_id AND t.rn = 1
