# Write your MySQL query statement below
WITH h AS(
    SELECT 1 AS half_number
    UNION ALL 
    SELECT 2
), a AS(
    SELECT DISTINCT t.team_name, h.half_number
    FROM Teams t
    CROSS JOIN h
), b AS(
    SELECT p.pass_from,
           t1.team_name,
           CASE WHEN p.time_stamp<= "45:00" THEN 1 ELSE 2 END AS half_number,
           CASE WHEN t1.team_name = t2.team_name  THEN 1 ELSE -1 END AS dominance
FROM Passes p
JOIN Teams t1
ON p.pass_from = t1.player_id
JOIN Teams t2
ON p.pass_to = t2.player_id
)
SELECT team_name, half_number, SUM(dominance) AS dominance
FROM b
GROUP BY team_name, half_number
ORDER BY team_name ASC, half_number ASC;
