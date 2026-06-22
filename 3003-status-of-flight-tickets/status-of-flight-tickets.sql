# Write your MySQL query statement below
WITH t AS(
    SELECT *,
        ROW_NUMBER()OVER(PARTITION BY flight_id ORDER BY booking_time ASC) AS rn
    FROM Passengers
)
SELECT passenger_id,
       CASE WHEN rn <= capacity THEN 'Confirmed' ELSE 'Waitlist' END AS Status
FROM t
JOIN Flights f
ON t.flight_id = f.flight_id
ORDER BY t.passenger_id ASC;