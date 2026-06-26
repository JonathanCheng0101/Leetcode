# | player_id | player_name | grand_slams_count |
WITH t AS(SELECT Wimbledon AS winner
        FROM Championships
        UNION ALL
        SELECT Fr_open 
        FROM Championships
        UNION ALL
        SELECT US_open 
        FROM Championships
        UNION ALL
        SELECT AU_open 
        FROM Championships
), a AS(
    SELECT winner, COUNT(winner) AS grand_slams_count
    FROM t
    GROUP BY winner
)
SELECT player_id, player_name, grand_slams_count
FROM Players p
JOIN a
ON p.player_id = a.winner;
