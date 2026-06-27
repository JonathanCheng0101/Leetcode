-- get friends of user1_id 1
WITH t AS(
    SELECT user1_id AS user1, user2_id AS user2
    FROM Friendship
    UNION ALL
    SELECT user2_id AS user1, user1_id AS user2
    FROM Friendship
), a AS(
    SELECT user1, user2
FROM t
WHERE user1 < user2
GROUP BY user1, user2
)

SELECT DISTINCT l.page_id AS recommended_page
FROM Likes l
JOIN a
ON l.user_id = a.user2 AND a.user1 = 1
WHERE NOT EXISTS(
    SELECT 1
    FROM Likes l2
    WHERE l.page_id = l2.page_id AND l2.user_id = 1
)