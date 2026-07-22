#  machine_id | processing_time
WITH t AS(
        SELECT machine_id, process_id, CASE WHEN activity_type = 'start' THEN `timestamp` ELSE 0 END AS start_time,
        CASE WHEN activity_type = 'end' THEN `timestamp` ELSE 0 END AS end_time
        FROM Activity
        )
, a AS(
    SELECT machine_id, process_id, MAX(end_time) - MAX(start_time) AS time_used 
    FROM t
    GROUP BY machine_id, process_id
)
SELECT machine_id, ROUND(AVG(time_used), 3) AS processing_time
FROM a
GROUP BY machine_id
