# Write your MySQL query statement below
WITH t AS(
    SELECT *,
          CASE WHEN MIN(order_type)OVER(PARTITION BY customer_id) = '0' THEN 'Yes' ELSE 'NO' END AS type_chk
    FROM Orders
)
SELECT order_id,
       customer_id, 
        order_type
FROM t 
WHERE order_type = 0 OR (order_type = 1 AND type_chk = 'No')