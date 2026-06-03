# Write your MySQL query statement below
WITH t AS(
    SELECT *,
           ROW_NUMBER()OVER(PARTITION BY username ORDER BY endDate DESC) AS rn
    FROM UserActivity
)

SELECT username, activity, startDate, endDate
FROM t
WHERE rn = 2

UNION ALL

SELECT username, activity, startDate, endDate
FROM UserActivity
GROUP BY username
HAVING COUNT(*) = 1


