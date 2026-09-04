# Write your MySQL query statement below
WITH t AS(
        SELECT machine_id, process_id, SUM(CASE WHEN activity_type = 'end' THEN `timestamp` ELSE -`timestamp` END) AS total
    FROM Activity
    GROUP BY machine_id, process_id
)
SELECT machine_id, ROUND(SUM(total)/ COUNT(*), 3) AS processing_time
FROM t
GROUP BY machine_id;