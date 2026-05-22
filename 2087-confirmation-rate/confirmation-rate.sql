WITH t AS(
    SELECT user_id,
           SUM(CASE WHEN action = 'confirmed' THEN 1 ELSE 0 END) /COUNT(time_stamp)  AS confirmation_rate
    FROM Confirmations
    GROUP BY user_id
)
SELECT s.user_id, 
       ROUND(IFNULL(t.confirmation_rate, 0),2)  AS confirmation_rate
FROM Signups s
LEFT JOIN t
ON s.user_id = t.user_id;

 
