WITH t AS (
    SELECT user1_id, user2_id
    FROM Friendship

    UNION ALL

    SELECT user2_id, user1_id
    FROM Friendship
),
pairs AS (
    SELECT
        LEAST(t1.user1_id, t2.user1_id) AS user1_id,
        GREATEST(t1.user1_id, t2.user1_id) AS user2_id,
        COUNT(DISTINCT t1.user2_id) AS common_friend
    FROM t t1
    JOIN t t2
    ON t1.user2_id = t2.user2_id
    WHERE t1.user1_id < t2.user1_id
    GROUP BY t1.user1_id, t2.user1_id
)
SELECT p.user1_id, p.user2_id, p.common_friend
FROM pairs p
JOIN Friendship f
ON p.user1_id = LEAST(f.user1_id, f.user2_id)
AND p.user2_id = GREATEST(f.user1_id, f.user2_id)
WHERE p.common_friend >= 3;