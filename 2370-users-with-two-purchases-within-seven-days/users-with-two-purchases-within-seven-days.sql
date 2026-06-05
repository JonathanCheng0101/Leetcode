# Write your MySQL query statement below
WITH t AS(
    SELECT user_id,
        purchase_date,
        CASE WHEN DATEDIFF(LEAD(purchase_date)OVER(PARTITION BY user_id ORDER BY purchase_date ASC), purchase_date) <= 7 THEN 1 ELSE 0 END AS chk
    FROM Purchases
)
SELECT DISTINCT user_id
FROM t
WHERE chk = 1
ORDER BY user_id ASC;