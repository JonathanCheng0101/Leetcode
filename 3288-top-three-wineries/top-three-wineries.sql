# Write your MySQL query statement below
WITH pre AS(
    SELECT country, SUM(points) AS points, winery
    FROM Wineries
    GROUP BY country, winery
)
 ,t AS(
    SELECT *,
        RANK()OVER(PARTITION BY country ORDER BY points DESC, winery ASC) AS rn
    FROM pre
), a AS(
    SELECT country,
       CASE WHEN rn = 1 THEN CONCAT(winery, " (", points, ")")  END AS top_winery,
       CASE WHEN rn = 2 THEN CONCAT(winery, " (", points, ")")  END AS second_winery,
       CASE WHEN rn = 3 THEN CONCAT(winery, " (", points, ")")  END AS third_winery
FROM t
)
SELECT country,
       MAX(top_winery) AS top_winery,
       IFNULL(MAX(second_winery), "No second winery") AS second_winery,
       IFNULL(MAX(third_winery), "No third winery") AS third_winery
FROM a
GROUP BY country
ORDER BY country ASC;
