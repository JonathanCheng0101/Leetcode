# machine_id, process_time
WITH t AS(
    SELECT a1.machine_id,
       a1.process_id,
       a1.`timestamp`AS start_time,
       a2.`timestamp`AS end_time,
       a2.`timestamp` - a1.`timestamp` AS total
    FROM Activity a1
    JOIN Activity a2
    ON a1.machine_id = a2.machine_id AND a1.process_id = a2.process_id
    WHERE a1.activity_type = 'start' AND a2.activity_type = 'end'
)
SELECT machine_id, ROUND(AVG(total), 3) AS processing_time
FROM t
GROUP BY machine_id

