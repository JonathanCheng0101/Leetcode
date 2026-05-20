WITH t AS(
    SELECT user_id,
           activity_date,
           MIN(activity_date)OVER(PARTITION BY user_id) AS first_login
    FROM Traffic
    WHERE activity = 'login'
)

SELECT activity_date AS login_date,
       COUNT(DISTINCT user_id) AS user_count
FROM t
WHERE (first_login) = activity_date AND TIMESTAMPDIFF(day,activity_date, '2019-06-30') BETWEEN 0 AND 90
GROUP BY activity_date
