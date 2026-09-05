WITH t AS(
    SELECT player_id,
        event_date,
        DENSE_RANK()OVER(PARTITION BY player_id ORDER BY event_date ASC) AS rn
    FROM Activity
), a AS(
    SELECT player_id, CASE WHEN rn = 2 AND DATEDIFF(event_date, LAG(event_date)OVER(PARTITION BY player_id ORDER BY event_date ASC)) = 1 THEN 1 ELSE 0 END AS chk
    FROM t
), b AS(
    SELECT player_id, SUM(chk) AS chk
    FROM a
    GROUP BY player_id
)
SELECT ROUND(SUM(chk)/COUNT(player_id), 2) AS fraction 
FROM b
