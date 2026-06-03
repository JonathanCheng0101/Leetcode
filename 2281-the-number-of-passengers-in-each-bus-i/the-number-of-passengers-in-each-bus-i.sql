# Write your MySQL query statement below
WITH t AS(
    SELECT b.bus_id,
        b.arrival_time,
        SUM(CASE WHEN b.arrival_time >= p.arrival_time THEN 1 ELSE 0 END) AS cnt
    FROM Buses b
    CROSS JOIN Passengers p
    GROUP BY b.bus_id, b.arrival_time
)
SELECt bus_id,
       (cnt - IFNULL(LAG(cnt)OVER(ORDER BY arrival_time ASC), 0)) AS passengers_cnt
FROM t
ORDER BY bus_id ASC;