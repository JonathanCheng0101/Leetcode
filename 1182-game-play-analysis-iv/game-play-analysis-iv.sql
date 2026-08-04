WITH t AS (
    SELECT COUNT(DISTINCT player_id) AS total_cnt
    FROM Activity
), a AS(
    SELECT *,
       LEAD(event_date) OVER(PARTITION BY player_id ORDER BY event_date ASC) AS nxt_date,
       ROW_NUMBER()OVER(PARTITION BY player_id ORDER BY event_date ASC) AS rn
    FROM Activity
), b AS(
    SELECT COUNT(player_id) AS qualified
    FROM a
    WHERE  rn = 1 AND DATEDIFF(nxt_date, event_date) = 1
)
SELECT ROUND(b.qualified/ t.total_cnt, 2) AS fraction
FROM b
CROSS JOIN t

