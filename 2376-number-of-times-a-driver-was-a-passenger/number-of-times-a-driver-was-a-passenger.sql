# Write your MySQL query statement below
WITH t AS(
    SELECT DISTINCT driver_id
    FROM Rides
), a AS(
    SELECT passenger_id,
       COUNT(passenger_id) AS cnt
FROM Rides
GROUP BY passenger_id
)
SELECT t.driver_id, IFNULL(a.cnt, 0) AS cnt
FROM t 
LEFT JOIN a
ON t.driver_id = a.passenger_id;