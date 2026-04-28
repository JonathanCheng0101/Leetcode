# Write your MySQL query statement below
SELECT a.player_id, a.device_id
FROM Activity a
JOIN (
    SELECT player_id,
           MIN(event_date) AS min_event_date
    FROM Activity a
    GROUP BY player_id
    ) t
ON a.event_date = t.min_event_date AND a.player_id = t.player_id;