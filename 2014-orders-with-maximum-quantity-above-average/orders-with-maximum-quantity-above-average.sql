# Write your MySQL query statement below
WITH t AS(
    SELECT order_id,
       AVG(quantity) AS quant_avg,
       MAX(quantity) AS order_max
    FROM OrdersDetails
    GROUP BY order_id
), a AS(
    SELECT MAX(quant_avg) AS max_avg
    FROM t
)
SELECT t.order_id
FROM t 
JOIN a 
WHERE t.order_max > a.max_avg