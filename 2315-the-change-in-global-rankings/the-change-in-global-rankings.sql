WITH t AS(
    SELECT t.team_id, t.name,t.points,p.points_change,
        CAST(RANK()OVER(ORDER BY t.points DESC, t.name ASC) AS SIGNED) AS cur_rn,
       t.points + p.points_change AS new_points
    FROM TeamPoints t
    JOIN PointsChange p
    ON t.team_id = p.team_id
)
SELECT team_id,
       name,
       cur_rn - CAST(RANK()OVER(ORDER BY new_points DESC, t.name ASC) AS SIGNED) AS rank_diff
FROM t
