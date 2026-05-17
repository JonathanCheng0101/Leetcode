# Write your MySQL query statement below
# first order
WITH t AS(
    SELECT customer_id, MIN(order_date) AS first_order
    FROM Delivery
    GROUP BY customer_id
)

SELECT ROUND(SUM(CASE WHEN d.order_date = d.customer_pref_delivery_date THEN 1 ELSE 0 END) *100/COUNT(*),2) AS immediate_percentage
FROM Delivery d
JOIN t
ON t.customer_id = d.customer_id
WHERE d.order_date = t.first_order;

