# Write your MySQL query statement below
WITH t AS(
    SELECT *,
           ROW_NUMBER()OVER(PARTITION BY username ORDER BY endDate DESC) AS rn,
           COUNT(username) OVER(PARTITION BY username) AS cnt
    FROM UserActivity
)

SELECT username, activity, startDate, endDate
FROM t
WHERE rn = 2 or cnt = 1




