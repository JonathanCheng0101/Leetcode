WITH t AS(
    SELECT DISTINCT city,
       HOUR(call_time) AS `hour`,
       COUNT(city) OVER(PARTITION BY city,HOUR(call_time)) AS cnt
    FROM calls
)
, a AS(
    SELECT *,
        RANK()OVER(PARTITION BY city ORDER BY cnt DESC) AS rn
    FROM t
)
SELECT city,
       `hour` AS peak_calling_hour,
       cnt AS number_of_calls
FROM a
WHERE rn = 1
ORDER BY `hour` DESC, city DESC;
