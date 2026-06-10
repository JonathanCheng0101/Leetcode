# Write your MySQL query statement below
WITH t AS(
    SELECT flight_id,
        COUNT(*) AS cnt
    FROM Passengers
    GROUP BY flight_id
), a AS(
    SELECT f.flight_id,
        f.capacity,
        IFNULL(t.cnt, 0) AS cnt
    FROM Flights f
    LEFT JOIN t
    ON f.flight_id = t.flight_id
)
SELECT flight_id,
       LEAST(capacity, cnt) AS booked_cnt,
       GREATEST(0, cnt - capacity) AS waitlist_cnt
FROM a
ORDER BY flight_id ASC;