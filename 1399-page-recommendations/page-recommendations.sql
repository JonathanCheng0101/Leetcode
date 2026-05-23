# Write your MySQL query statement below
WITH t AS(
    SELECT l2.user_id,
       l2.page_id
    FROM Likes l2
    WHERE NOT EXISTS(
        SELECT 1 
        FROM Likes l1
        WHERE l1.user_id = 1 AND l1.page_id = l2.page_id 
    )
)
SELECT DISTINCT t.page_id AS recommended_page
FROM Friendship f
JOIN t
ON GREATEST(f.user1_id, f.user2_id) = t.user_id
WHERE LEAST(user1_id, user2_id) = 1