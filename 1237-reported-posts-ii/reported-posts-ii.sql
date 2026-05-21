# Write your MySQL query statement below
WITH t AS(
    SELECT COUNT(DISTINCT r.post_id)/COUNT(DISTINCT a.post_id) AS daily_percent
    FROM Actions a
    LEFT JOIN Removals r
    ON a.post_id = r.post_id
    WHERE extra = 'spam'
    GROUP BY action_date
)
SELECT ROUND(AVG(daily_percent) *100, 2) AS average_daily_percent
FROM t;