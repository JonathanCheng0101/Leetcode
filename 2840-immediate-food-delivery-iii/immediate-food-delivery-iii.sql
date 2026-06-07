# Write your MySQL query statement below
SELECT order_date,
       ROUND(SUM(CASE WHEN customer_pref_delivery_date = order_date THEN 1 ELSE 0 END) * 100 /COUNT(order_date), 2)AS immediate_percentage
FROM Delivery
GROUP BY order_date
ORDER BY order_date ASC;