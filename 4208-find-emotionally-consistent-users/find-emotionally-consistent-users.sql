WITH t AS(
    SELECT user_id
    FROM reactions
    GROUP BY user_id
    HAVING COUNT(DISTINCT content_id) >= 5
),
a AS(
    SELECT r.user_id,
        r.reaction,
        COUNT(reaction) AS reaction_cnt
    FROM reactions r
    JOIN t
    ON r.user_id = t.user_id
    GROUP BY r.user_id, r.reaction
),b AS(
    SELECT user_id,
        reaction AS dominant_reaction,
        reaction_cnt/ SUM(reaction_cnt)OVER(PARTITION BY user_id) AS reaction_ratio
    FROM a
)
SELECT user_id,
       dominant_reaction,
       ROUND(reaction_ratio, 2) AS reaction_ratio
FROM b
HAVING reaction_ratio >= 0.6
ORDER BY reaction_ratio DESC, user_id ASC;

