WITH t AS(
    SELECT log_id,
       ROW_NUMBER()OVER(ORDER BY log_id) AS rn,
       log_id - (ROW_NUMBER()OVER(ORDER BY log_id)) AS diff
    FROM Logs
)
SELECT MIN(log_id) AS start_id,
       MAX(log_id) AS end_id
FROM t
GROUP BY diff;