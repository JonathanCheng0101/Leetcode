# Write your MySQL query statement below
WITH t AS(
    SELECT user_id,
           COUNT(content_id) AS total_cnt
    FROM reactions 
    GROUP BY user_id
    HAVING COUNT(DISTINCT content_id) >= 5
)
, a AS(
    SELECT r.user_id,
           r.reaction,
           COUNT(r.content_id) AS reaction_cnt
    FROM reactions r
    GROUP BY r.user_id, r.reaction
), b AS(
    SELECT a.user_id,
       a.reaction AS dominant_reaction,
       CASE WHEN a.reaction_cnt/t.total_cnt > 0.6 THEN ROUND(reaction_cnt/t.total_cnt, 2) END AS reaction_ratio
FROM a
JOIN t
ON t.user_id = a.user_id
)
SELECT *
FROM b
WHERE reaction_ratio IS NOT NULL
ORDER BY reaction_ratio DESC, user_id ASC;

