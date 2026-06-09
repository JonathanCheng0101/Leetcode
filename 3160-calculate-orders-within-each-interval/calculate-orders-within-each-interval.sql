# Write your MySQL query statement below
WITH t AS(
    SELECT *,
        FLOOR((minute-1)/6)+ 1 AS grp
    FROM Orders
)
SELECT grp AS interval_no,
       SUM(order_count) AS total_orders
FROM t
GROUP BY grp
ORDER BY interval_no ASC