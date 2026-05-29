# Write your MySQL query statement below
WITH t AS(
    SELECT *,
       CASE WHEN home_team_goals > away_team_goals THEN 3
            WHEN home_team_goals = away_team_goals THEN 1
            ELSE 0 END AS home_points,
       CASE WHEN home_team_goals < away_team_goals THEN 3
            WHEN home_team_goals = away_team_goals THEN 1
            ELSE 0 END AS away_points
FROM Matches
), a AS(
    SELECT home_team_id AS team_id,
           home_team_goals AS goals_for,
           away_team_goals AS goals_against,
           home_points AS points
FROM t 

UNION ALL

SELECT away_team_id AS team_id,
       away_team_goals AS goals_for,
       home_team_goals AS goals_against,
       away_points AS points
FROM t
)

SELECT t.team_name,
       COUNT(*) AS matches_played,
       SUM(a.points) AS points,
       SUM(a.goals_for) AS goal_for,
       SUM(a.goals_against) AS goal_against,
       SUM(a.goals_for) - SUM(a.goals_against) AS goal_diff
FROM a
JOIN Teams t
ON a.team_id = t.team_id
GROUP BY a.team_id
ORDER BY SUM(a.points) DESC, goal_diff DESC, t.team_name ASC;

