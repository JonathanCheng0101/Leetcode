# Write your MySQL query statement below
WITH t AS(
    SELECT product_id,
           MIN(year) AS earliest_year
    FROM Sales
    GROUP BY product_id
)
SELECT s.product_id,
       s.`year`AS first_year,
       s.quantity,
       s.price
FROM Sales s
JOIN t
ON s.product_id = t.product_id
WHERE s.`year` = t.earliest_year;