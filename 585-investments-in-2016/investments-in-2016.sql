# Write your MySQL query statement below
WITH t AS(
    SELECT pid
    FROM Insurance
    GROUP BY lat, lon
    HAVING COUNT(*) = 1
), a AS(
SELECT pid,
       COUNT(pid) OVER(PARTITION BY tiv_2015) AS cnt
FROM Insurance
)
, b AS(
    SELECT a.pid
    FROM a
    JOIN t
    ON a.pid = t.pid
    WHERE a.cnt != 1
)

SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM Insurance i
JOIN b
ON b.pid = i.pid

