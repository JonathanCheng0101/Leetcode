# Write your MySQL query statement below
WITH t AS(SELECT customer_id,
                 order_date,
                 customer_pref_delivery_date,
                 MIN(order_date) OVER(PARTITION BY customer_id) AS first_order
            FROM Delivery
)
SELECT ROUND(SUM(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END) * 100/COUNT(*),2) AS immediate_percentage
FROM t
WHERE order_date = first_order

