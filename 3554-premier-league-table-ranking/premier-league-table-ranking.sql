# Write your MySQL query statement below
SELECT team_id,
       team_name,
       (3 * wins + 1 * draws) AS points,
       RANK() OVER(ORDER BY (3 * wins + 1 * draws) DESC) AS `position`
FROM TeamStats
ORDER BY points DESC, team_name ASC;