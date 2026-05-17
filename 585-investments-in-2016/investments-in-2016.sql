# Write your MySQL query statement below
WITH t AS(
    SELECT COUNT(*) OVER(PARTITION BY tiv_2015) AS cnt_2015,
           COUNT(*) OVER(PARTITION BY lat,lon) AS location,
           tiv_2016
    FROM Insurance
)



SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM t
WHERE cnt_2015 > 1 AND location = 1;