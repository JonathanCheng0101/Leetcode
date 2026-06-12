# Write your MySQL query statement below
WITH t AS(
    SELECT player_id,
        match_day,
        CASE WHEN result = 'Win' THEN 1 ELSE 0 END AS result
    FROM Matches
), a AS(
    SELECT player_id,
       match_day,
       result,
       SUM(result)OVER(PARTITION BY player_id ORDER BY match_day) AS streak,
       ROW_NUMBER()OVER(PARTITION BY player_id ORDER BY match_day) AS rn
    FROM t
), b AS(
    SELECT *, rn - streak AS grp
    FROM a
    WHERE result = 1
), c AS(
    SELECT player_id,COUNT(grp) AS longest_streak
    FROM b
    GROUP BY player_id, grp
), d AS(
    SELECT DISTINCT player_id
    FROM Matches
), e AS(
    SELECT player_id,MAX(longest_streak) AS longest_streak
    FROM c
    GROUP BY player_id
)
SELECT d.player_id, IFNULL(e.longest_streak, 0) AS longest_streak
FROM d
LEFT JOIN e
ON d.player_id = e.player_id
