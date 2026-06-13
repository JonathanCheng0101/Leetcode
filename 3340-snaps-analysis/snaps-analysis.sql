# Write your MySQL query statement below
WITH t AS(
    SELECT Age.age_bucket, a.user_id, a.activity_type, a.time_spent
    FROM Activities a
    JOIN Age 
    ON a.user_id = Age.user_id
)
SELECT age_bucket,
       ROUND(100 * SUM(CASE WHEN activity_type = 'send' THEN time_spent ELSE 0 END)/ SUM(time_spent), 2) AS send_perc,
       ROUND(100 * SUM(CASE WHEN activity_type = 'open' THEN time_spent ELSE 0 END)/ SUM(time_spent), 2) AS open_perc
FROM t
GROUP BY age_bucket
