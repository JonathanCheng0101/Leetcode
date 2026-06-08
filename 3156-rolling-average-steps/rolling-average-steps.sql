# Write your MySQL query statement below
WITH t AS(
    SELECT *,
       DAY(steps_date) - ROW_NUMBER()OVER(PARTITION BY user_id ORDER BY DAY(steps_date)ASC) AS rn
    FROM Steps
), a AS(
    SELECT *, COUNT(rn)OVER(PARTITION BY user_id, rn) AS cnt
    FROM t
), b AS(
    SELECT user_id,
       steps_count,
       steps_date,
       rn,
       DATE_ADD(MIN(steps_date)OVER(PARTITION BY user_id, rn), INTERVAL 2 day) AS min_date,
       ROUND(SUM(steps_count)OVER(PARTITION BY user_id, rn ORDER BY steps_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)/ 3, 2) AS rolling_average
    FROM a
    WHERE cnt >= 3

)
    
SELECT user_id,
       steps_date,
       rolling_average
FROM b
WHERE steps_date >= min_date
ORDER BY user_id ASC, steps_date ASC;

