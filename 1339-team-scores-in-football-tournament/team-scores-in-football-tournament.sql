# Write your MySQL query statement below
WITH a AS(
    SELECT host_team AS team,
       CASE WHEN host_goals > guest_goals THEN 3
            WHEN host_goals = guest_goals THEN 1
            WHEN host_goals < guest_goals THEN 0 END AS score
    FROM Matches

    UNION ALL

    SELECT guest_team AS team,
        CASE WHEN host_goals > guest_goals THEN 0
                WHEN host_goals = guest_goals THEN 1
                WHEN host_goals < guest_goals THEN 3 END AS score
    FROM Matches
)
SELECT t.team_id,
       t.team_name,
       IFNULL(SUM(a.score), 0) AS num_points
FROM Teams t
LEFT JOIN a
ON t.team_id = a.team
GROUP BY t.team_id
ORDER BY num_points DESC, t.team_id ASC;