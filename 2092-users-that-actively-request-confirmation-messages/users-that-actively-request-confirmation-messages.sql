WITH t AS(
    SELECT user_id,
        CASE WHEN TIMESTAMPDIFF(second, `time_stamp`, LEAD(`time_stamp`)OVER(PARTITION BY user_id ORDER BY `time_stamp` ASC)) <= 86400 THEN 1 ELSE 0 END AS chk
    FROM Confirmations
)
SELECT DISTINCT user_id
FROM t 
WHERE chk = 1
