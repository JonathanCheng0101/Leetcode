# Write your MySQL query statement below
WITH t AS(
    SELECT Wimbledon AS winner_id 
    FROM Championships

    UNION ALL

    SELECT Fr_open
    FROM Championships

    UNION ALL

    SELECT US_open
    FROM Championships

    UNION ALL

    SELECT Au_open
    FROM Championships
)
SELECT player_id,
       player_name,
       COUNT(*) AS grand_slams_count
FROM Players p
JOIN t
ON p.player_id = t.winner_id
GROUP BY p.player_id