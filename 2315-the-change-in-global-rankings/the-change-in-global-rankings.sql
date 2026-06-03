# Write your MySQL query statement below
WITH a AS(
    SELECT t.team_id,
        t.name,
        CAST(RANK()OVER(ORDER BY t.points DESC, t.name ASC) AS SIGNED) AS cur_rank,
        t.points + c.points_change AS nxt_point
    FROM Teampoints t
    JOIN PointsChange c
    ON t.team_id = c.team_id
)

    SELECT team_id,
       name,
       cur_rank - CAST(RANK()OVER(ORDER BY a.nxt_point DESC, a.name ASC)AS SIGNED) AS rank_diff
FROM a


