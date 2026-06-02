# Write your MySQL query statement below
WITH t AS(
    SELECT DISTINCT LEAST(r1.user_id,r2.user_id) AS user1_id,
       GREATEST(r1.user_id,r2.user_id) AS user2_id,
       r1.follower_id
    FROM Relations r1
    JOIN Relations r2
    ON r1.follower_id = r2.follower_id AND r1.user_id != r2.user_id
),a AS(
    SELECT user1_id,
           user2_id,
           RANK()OVER(ORDER BY COUNT(*) DESC) AS rn
    FROM t
    GROUP BY user1_id, user2_id
)
    
SELECT user1_id,
        user2_id
FROM a
WHERE rn = 1
   
