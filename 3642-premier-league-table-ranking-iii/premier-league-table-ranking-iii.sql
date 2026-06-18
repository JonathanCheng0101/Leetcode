# Write your MySQL query statement below
WITH t AS(
    SELECT *, 3 * wins + draws AS points, goals_for - goals_against AS goal_difference
    FROM SeasonStats
)
SELECT season_id, team_id, team_name, points, goal_difference, RANK()OVER(PARTITION BY season_id ORDER BY points DESC, goal_difference DESC, team_name ASC) AS `position`
FROM t
ORDER BY season_id ASC, `position` ASC, team_name ASC;