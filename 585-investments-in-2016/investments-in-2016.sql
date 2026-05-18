WITH t AS(
    SELECT tiv_2016,
           COUNT(*) OVER(PARTITION BY tiv_2015) AS cnt_2015,
           COUNT(*) OVER(PARTITION BY lat,lon) AS latlon_cnt
    FROM Insurance
)
SELECT ROUND(SUM(tiv_2016),2) AS tiv_2016
FROM t
WHERE cnt_2015 > 1 AND latlon_cnt = 1