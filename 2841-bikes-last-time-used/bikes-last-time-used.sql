WITH t AS(
    SELECT bike_number,
        end_time,
        RANK()OVER(PARTITION BY bike_number ORDER BY end_time DESC) AS rn
    FROM Bikes
)
SELECT bike_number, end_time
FROM t
WHERE rn = 1
ORDER BY end_time DESC;