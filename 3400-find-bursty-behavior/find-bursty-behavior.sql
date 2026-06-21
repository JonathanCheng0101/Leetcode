# Write your MySQL query statement below
WITH t AS(
    SELECT user_id,
        COUNT(user_id) / 4 AS AVG_weekly_posts
    FROM Posts
    WHERE post_date BETWEEN '2024-02-01' AND '2024-02-28'
    GROUP BY user_id
),c AS(
    SELECT *
    FROM Posts
    WHERE post_date BETWEEN '2024-02-01' AND '2024-02-28'
), daily AS(
    SELECT DISTINCT user_id, post_date
    FROM Posts

),
a AS(
    SELECT p1.user_id,
       COUNT(p2.user_id) AS cnt 
FROM daily p1
JOIN c p2
ON (p1.user_id = p2.user_id) AND (p2.post_date BETWEEN p1.post_date AND DATE_ADD(p1.post_date, INTERVAL 6 DAY))
GROUP BY p1.user_id, p1.post_date

), b AS(
    SELECT user_id, MAX(cnt) AS max_7day_posts
    FROM a
    GROUP BY user_id
)
SELECT b.user_id, b.max_7day_posts, t.avg_weekly_posts
FROM b
JOIN t
ON b.user_id = t.user_id
WHERE b.max_7day_posts >= 2 * t.avg_weekly_posts
ORDER BY b.user_id ASC;