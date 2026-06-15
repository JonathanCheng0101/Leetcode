# Write your MySQL query statement below
WITH t AS(
        SELECT *, 
        TIMESTAMPDIFF(minute, entry_time, exit_time) AS min_diff
        FROM ParkingTransactions
), a AS(
    SELECT lot_id,
       car_id,
       SUM(fee_paid) AS fee_paid,
       SUM(min_diff)/60 AS hour_diff,
       MAX(SUM(min_diff)/60)OVER(PARTITION BY car_id) AS max_hr
    FROM t
    GROUP BY car_id, lot_id
), b AS(
    SELECT car_id,
       SUM(fee_paid) AS total_fee_paid,
       ROUND(SUM(fee_paid) / SUM(hour_diff), 2) AS avg_hourly_fee
FROM a
GROUP BY car_id

), c AS(
    SELECT car_id, lot_id
    FROM a
    WHERE max_hr = hour_diff
)
SELECT b.car_id,
       b.total_fee_paid,
       b.avg_hourly_fee,
       c.lot_id AS most_time_lot
FROM b
JOIN c
ON b.car_id = c.car_id
ORDER BY b.car_id ASC;
