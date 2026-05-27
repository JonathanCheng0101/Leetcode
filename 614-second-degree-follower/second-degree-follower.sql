# Write your MySQL query statement below
WITH t AS(
    SELECT DISTINCT followee
    FROM Follow
    WHERE followee IN (SELECT follower FROM Follow)
),c AS(
    SELECT followee,
           COUNT(followee) AS cnt
    FROM Follow
    GROUP BY followee
)
SELECT t.followee AS follower,
       c.cnt AS num
FROM t
JOIN c
ON t.followee = c.followee
ORDER BY follower ASC;