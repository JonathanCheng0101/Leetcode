# Write your MySQL query statement below
WITH t AS(
    SELECT driver_id,
       AVG(CASE WHEN trip_date < '2023-07-01' THEN distance_km/ fuel_consumed END) AS first_half_avg,
       AVG(CASE WHEN trip_date >= '2023-07-01' THEN distance_km/ fuel_consumed END) AS second_half_avg
    FROM trips
    GROUP BY driver_id
)
SELECT t.driver_id,
       d.driver_name,
       ROUND(t.first_half_avg, 2) AS first_half_avg,
       ROUND(t.second_half_avg, 2) AS second_half_avg,
       ROUND(t.second_half_avg - t.first_half_avg, 2) AS efficiency_improvement
FROM t
JOIN drivers d
ON t.driver_id = d.driver_id
WHERE t.first_half_avg IS NOT NULL AND t.second_half_avg IS NOT NULL AND t.first_half_avg < t.second_half_avg
ORDER BY efficiency_improvement DESC, d.driver_name ASC;