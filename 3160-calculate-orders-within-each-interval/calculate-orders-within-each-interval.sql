# Write your MySQL query statement below
WITH t AS(
    SELECT *,
        FLOOR((minute-1)/6)+1 AS interval_no
    FROM Orders
)
SELECT interval_no,
       SUM(order_count) AS total_orders
FROM t
GROUP BY interval_no
ORDER BY interval_no ASC;