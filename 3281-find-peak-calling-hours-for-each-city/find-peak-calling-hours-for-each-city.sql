WITH t AS(
    SELECT city,
      HOUR(call_time) AS calling_hr,
      COUNT(*) AS cnt
    FROM Calls
    GROUP BY city, HOUR(call_time)
), a AS(
    SELECT city,
       calling_hr AS peak_calling_hour,
       cnt AS number_of_calls,
       RANK() OVER (PARTITION BY city ORDER BY cnt DESC) AS rn
    FROM t
)
SELECT city,
       peak_calling_hour,
       number_of_calls
FROM a
WHERE rn = 1
ORDER BY peak_calling_hour DESC, city DESC;