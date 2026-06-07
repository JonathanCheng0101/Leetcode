WITH t AS(
    SELECT submit_date,
        DAYOFWEEK(submit_date) AS day_chk
FROM Tasks
)
SELECT SUM(CASE WHEN day_chk = 1 OR day_chk = 7 THEN 1 ELSE 0 END) AS weekend_cnt,
       SUM(CASE WHEN day_chk BETWEEN 2 AND 6 THEN 1 ELSE 0 END) AS working_cnt
FROM t