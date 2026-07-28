SELECT FLOOR((minute  - 1)/6) + 1 AS interval_no,
       SUM(order_count) AS total_orders
FROM Orders
GROUP BY FLOOR((minute  - 1)/6) + 1 
ORDER BY interval_no ASC;
       