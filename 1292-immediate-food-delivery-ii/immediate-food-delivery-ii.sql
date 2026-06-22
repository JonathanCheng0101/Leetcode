WITH t AS(
    SELECT *,
        ROW_NUMBER()OVER(PARTITION BY customer_id ORDER BY order_date ASC) AS rn
    FROM Delivery
)
SELECT ROUND(100 * SUM(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END)/ COUNT(*), 2) AS immediate_percentage 
FROM t
WHERE rn = 1
