# Write your MySQL query statement below
WITH f AS(
    SELECT CASE WHEN user1_id = 1 THEN user2_id ELSE user1_id END AS friend
    FROM Friendship 
    WHERE user1_id = 1 OR user2_id = 1
), l AS(
    SELECT l1.user_id, 
           l1.page_id
    FROM Likes l1
    WHERE NOT EXISTS(
        SELECT 1
        FROM Likes l2
        WHERE l2.user_id = 1 AND l2.page_id = l1.page_id
    )
)
SELECT DISTINCT l.page_id AS recommended_page
FROM l
JOIN f
ON f.friend = l.user_id
