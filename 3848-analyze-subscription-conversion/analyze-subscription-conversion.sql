# Write your MySQL query statement below
WITH t AS(
    SELECT user_id, 
        activity_type,
        CASE WHEN activity_type = 'free_trial' THEN SUM(activity_duration)/ COUNT(activity_duration) END AS trial_avg_duration,
        CASE WHEN activity_type = 'paid' THEN SUM(activity_duration)/ COUNT(activity_duration) END AS paid_avg_duration

    FROM UserActivity
    GROUP BY user_id, activity_type
    HAVING activity_type = 'free_trial' OR activity_type = 'paid'
)
SELECT user_id, 
       ROUND(MAX(trial_avg_duration), 2) AS trial_avg_duration, 
       ROUND(MAX(paid_avg_duration) , 2) AS paid_avg_duration
FROM t
GROUP BY user_id
HAVING MAX(trial_avg_duration) IS NOT NULL AND MAX(paid_avg_duration) IS NOT NULL
ORDER BY user_id ASC;


