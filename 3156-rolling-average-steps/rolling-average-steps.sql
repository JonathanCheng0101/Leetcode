# Write your MySQL query statement below
WITH t AS(
    SELECT *,
        DATE_SUB(steps_date, INTERVAL ROW_NUMBER()OVER(PARTITION BY user_id ORDER BY steps_date) day) AS grp
    FROM Steps
), a AS(
SELECT *, COUNT(grp)OVER(PARTITION BY user_id,grp) AS grp_cnt
FROM t 
), b AS(
    SELECT user_id,
       steps_count,
       steps_date,
       ROUND(SUM(steps_count)OVER(PARTITION BY user_id, grp ORDER BY steps_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) / 3, 2) AS rolling_average,
       DATE_ADD(MIN(steps_date)OVER(PARTITION BY user_id, grp), INTERVAL 2 day) AS valid_day
FROM a
WHERE grp_cnt >= 3
)

SELECT user_id,
       steps_date,
       rolling_average
FROM b
WHERE steps_date >= valid_day
ORDER BY user_id ASC, steps_date ASC;