WITH t AS(
    SELECT log_id,
       ROW_NUMBER()OVER() as rn,
       log_id - ROW_NUMBER()OVER() AS diff
    FROM Logs
)
SELECT MIN(log_id) AS start_id,
       MAX(log_id) AS end_id
FROM t
GROUP BY diff
