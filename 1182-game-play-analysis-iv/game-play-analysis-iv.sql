# Write your MySQL query statement below
WITH t AS(
    SELECT *,
           MIN(event_date)OVER(PARTITION BY player_id) AS first_date
    FROM Activity
)
SELECT ROUND(SUM(CASE WHEN DATEDIFF(event_date,first_date) = 1 THEN 1 ELSE 0 END)/COUNT(DISTINCT player_id),2) AS fraction
FROM t;
