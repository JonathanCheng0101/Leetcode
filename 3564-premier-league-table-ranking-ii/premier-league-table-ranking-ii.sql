# Write your MySQL query statement below
WITH t AS(
    SELECT team_name,
        wins * 3 + draws AS points,
        RANK()OVER(ORDER BY wins * 3 + draws DESC) AS `position`
    FROM TeamStats
), a AS(
    SELECT COUNT(*) AS total_cnt
FROM t
)
SELECT t.team_name,
       t.points,
       t.`position`,
       CASE WHEN t.`position`<= CEIL(a.total_cnt * 0.33) THEN 'Tier 1'
            WHEN t.`position` > CEIL(a.total_cnt * 0.33) AND t.`position` <= CEIL(a.total_cnt * 0.66) THEN 'Tier 2'
            ELSE 'Tier 3'
            END AS tier
FROM t
JOIN a
ORDER BY points DESC, team_name ASC;

