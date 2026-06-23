# Write your MySQL query statement below
WITH t AS(
    SELECT *,
           MIN(session_start)OVER(PARTITION BY user_id) AS first_session
    FROM Sessions
), a AS(
    SELECT user_id
FROM t
WHERE session_start = first_session AND session_type = 'Viewer'
), b AS(
    SELECT user_id,
       SUM(CASE WHEN session_type = 'Streamer' THEN 1 ELSE 0 END) AS sessions_count
    FROM Sessions
    GROUP BY user_id
)
SELECT a.user_id, b.sessions_count
FROM a
JOIN b
ON a.user_id = b.user_id
WHERE b.sessions_count != 0
ORDER BY b.sessions_count DESC, a.user_id DESC;
