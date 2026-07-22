WITH t AS(
    SELECT *,
       ROW_NUMBER()OVER(PARTITION BY player_id ORDER BY event_date ASC) AS rn
    FROM Activity
)
SELECT player_id, event_date AS first_login
FROM t
WHERE rn = 1;
