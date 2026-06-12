# Write your MySQL query statement below
WITH t AS(
    SELECT user_id, activity_type, SUM(time_spent) AS time_spent
    FROM Activities
    GROUP BY user_id, activity_type
), b AS(
    SELECT user_id,
       SUM(CASE WHEN activity_type = 'send' THEN IFNULL(time_spent, 0) END) AS send_perc,
       SUM(CASE WHEN activity_type = 'open' THEN IFNULL(time_spent, 0) END) AS open_perc
    FROM t
    GROUP BY user_id
)
    
SELECT age_bucket,
        ROUND(100 * IFNULL(SUM(send_perc), 0)/(IFNULL(SUM(send_perc), 0) + IFNULL(SUM(open_perc), 0)), 2) AS send_perc,
        ROUND(100 * IFNULL(SUM(open_perc), 0)/(IFNULL(SUM(send_perc), 0) + IFNULL(SUM(open_perc), 0)), 2) AS open_perc
FROM Age a
JOIN b
ON a.user_id = b.user_id
GROUP BY a.age_bucket