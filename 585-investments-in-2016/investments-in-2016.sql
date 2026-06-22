WITH t AS(
    SELECT pid, lat, lon
    FROM Insurance
    GROUP BY lat, lon
    HAVING COUNT(pid) = 1
), a AS(
    SELECT pid,
           COUNT(tiv_2015)OVER(PARTITION BY tiv_2015) AS cnt
    FROM Insurance
    
)
SELECT ROUND(SUM(i.tiv_2016), 2) AS tiv_2016
FROM Insurance i
JOIN t
ON i.pid = t.pid
JOIN a
ON i.pid = a.pid AND  a.cnt > 1



