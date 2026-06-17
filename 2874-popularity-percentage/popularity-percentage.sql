# Write your MySQL query statement below

# step 1:find all ppl count
WITH t AS(
    SELECT user1 AS ppl
    FROM Friends
    UNION 
    SELECT user2
    FROM FRIENDS
), a AS(
    SELECT COUNT(DISTINCT ppl) AS total_cnt
    FROM t
), b AS(
    SELECT user1 AS user1, user2 AS user2
    FROM Friends
    UNION ALL 
    SELECT user2, user1
    FROM Friends 
),d AS(SELECT user1, user2
    FROM b
    GROUP BY user1, user2
)
 ,c AS(
    SELECT user1, COUNT(user2) AS friend_cnt
    FROM d
    GROUP BY user1
    ORDER BY user1 ASC
)
SELECT c.user1, ROUND(100* c.friend_cnt / a.total_cnt, 2) AS percentage_popularity
FROM c
JOIN a
ORDER BY c.user1 ASC;
