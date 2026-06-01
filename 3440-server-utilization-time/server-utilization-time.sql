# Write your MySQL query statement below
#unix_timestamp
WITH t AS(
    SELECT session_status,
            SUM(UNIX_TIMESTAMP(status_time)) AS total_time
    FROM Servers
    GROUP BY session_status
), a AS(
    SELECT FLOOR((LEAD(total_time)OVER(ORDER BY total_time) - total_time)/86400) AS total_uptime_days 
FROM t
)

SELECT total_uptime_days
FROM a
WHERE total_uptime_days IS NOT NULL;