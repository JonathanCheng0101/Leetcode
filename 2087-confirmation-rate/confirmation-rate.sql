WITH t AS(
    SELECT user_id,
           ROUND(SUM(CASE WHEN action = 'confirmed' THEN 1 ELSE 0 END)/COUNT(*), 2) AS personal_avg
    FROM Confirmations
    GROUP BY user_id
)
SELECT s.user_id,
       IFNULL(t.personal_avg, 0) AS confirmation_rate
FROM Signups s
LEFT JOIN t
ON s.user_id = t.user_id