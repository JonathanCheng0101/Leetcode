# Write your MySQL query statement below
WITH t AS(
    SELECT HOUR(call_time) AS peak_calling_hour,
           city,
           COUNT(*) AS number_of_calls
    FROM Calls
    GROUP BY city, HOUR(call_time)
), a AS(
    SELECT city,
       peak_calling_hour,
       number_of_calls,
       RANK()OVER(PARTITION BY city ORDER BY number_of_calls DESC) AS rn
FROM t
)
SELECT city,
       peak_calling_hour,
       number_of_calls
FROM a
WHERE rn = 1
ORDER BY peak_calling_hour DESC, city DESC;

