# Write your MySQL query statement below
WITH t AS(
    SELECT *, MIN(event_date) OVER(PARTITION BY player_id ORDER BY event_date ASC) AS first_date
    FROM Activity
)
SELECT IFNULL(ROUND (SUM(CASE WHEN DATEDIFF(event_date, first_date) = 1 THEN 1 END)/COUNT(DISTINCT player_id),2), 0) AS fraction
FROM t
