# Write your MySQL query statement below
WITH t AS(
    SELECT flight_id, COUNT(flight_id) AS cnt
    FROM Passengers
    GROUP BY flight_id
)
SELECT f.flight_id,
       IFNULL(LEAST(f.capacity, t.cnt), 0) AS booked_cnt,
       IFNULL(CASE WHEN t.cnt - f.capacity > 0 THEN t.cnt - f.capacity
                   WHEN t.cnt - f.capacity < 0 THEN 0 END, 0)AS waitlist_cnt
FROM Flights f
LEFT JOIN t
ON f.flight_id = t.flight_id
ORDER BY f.flight_id ASC;
