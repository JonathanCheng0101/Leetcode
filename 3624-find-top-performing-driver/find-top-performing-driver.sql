# Write your MySQL query statement below
WITH t AS(
    SELECT t.vehicle_id, t.`distance`, t.rating, v.driver_id, v.fuel_type, d.accidents
    FROM Trips t
    JOIN Vehicles v
    ON t.vehicle_id = v.vehicle_id
    JOIN Drivers d
    ON d.driver_id = v.driver_id
), a AS(
    SELECT SUM(distance) AS `distance`,
           AVG(rating) AS rating,
           fuel_type,
           driver_id,
           AVG(accidents) AS accidents
    FROM t
    GROUP BY fuel_type, driver_id
), b AS(
    SELECT *,
       RANK()OVER(PARTITION BY fuel_type ORDER BY rating DESC, `distance` DESC, accidents ASC) AS rn
FROM a
)
SELECT fuel_type,
       driver_id,
       ROUND(rating, 2) AS rating,
       `distance`
FROM b
WHERE rn = 1
ORDER BY fuel_type ASC;
    
