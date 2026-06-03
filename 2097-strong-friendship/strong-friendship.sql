WITH t AS(
    SELECT user1_id, user2_id
    FROM Friendship

    UNION ALL

    SELECT user2_id AS user1_id, user1_id AS user2_id
    FROM Friendship
), a AS(
    SELECT t1.user1_id AS user1_id, t2.user1_id AS user2_id, COUNT(*) AS common_friend 
    FROM t t1
    JOIN t t2
    ON t1.user2_id = t2.user2_id
    WHERE t1.user1_id != t2.user1_id AND t1.user1_id < t2.user1_id
    GROUP BY t1.user1_id, t2.user1_id
    HAVING COUNT(*)>= 3
)
SELECT a.user1_id, a.user2_id, a.common_friend 
FROM a
JOIN Friendship f
ON a.user1_id = f.user1_id AND a.user2_id = f.user2_id