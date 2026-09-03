# Write your MySQL query statement below
WITH t AS(
    SELECT *,
        CASE WHEN activity_type = 'start' THEN -`timestamp` ELSE  `timestamp` END AS time_accu,
        CASE WHEN activity_type = 'start' THEN 1 ELSE 0 END AS time_chk
    FROM Activity
)
SELECT machine_id, ROUND(SUM(time_accu)/ SUM(time_chk), 3) AS processing_time 
FROM t
GROUP BY machine_id;
