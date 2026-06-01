# Write your MySQL query statement below
WITH t AS(
    SELECT *,
           LEAD(created_at) OVER(PARTITION BY user_id ORDER BY created_at ASC) AS second_day
    FROM Users
)
SELECT DISTINCT user_id
FROM t
WHERE second_day IS NOT NULL AND DATEDIFF(second_day, created_at)<= 7;