# Write your MySQL query statement below
WITH t AS(
    SELECT *,
       IFNULL(TIMESTAMPDIFF(day,visit_date, LEAD(visit_date)OVER(PARTITION BY user_id ORDER BY visit_date ASC)),TIMESTAMPDIFF(day, visit_date, '2021-01-01')) AS diff
    FROM UserVisits
)
SELECT user_id, 
       MAX(diff) AS biggest_window
FROM t
GROUP BY user_id
ORDER BY user_id ASC;
