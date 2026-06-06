# Write your MySQL query statement below
# DAYOFWEEK(date)
WITH t AS(
    SELECT task_id,
       DAYOFWEEK(submit_date) AS judge
    FROM Tasks
)
SELECT SUM(CASE WHEN judge = 1 OR judge = 7 THEN 1 ELSE 0 END) AS weekend_cnt,
       SUM(CASE WHEN judge BETWEEN 2 AND 6 THEN 1 ELSE 0 END) AS working_cnt 
FROM t