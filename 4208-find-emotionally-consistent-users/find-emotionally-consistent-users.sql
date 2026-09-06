WITH t AS(
    SELECT user_id,reaction, COUNT(*) AS reaction_cnt
    FROM reactions
    GROUP BY user_id, reaction
), a AS(
    SELECT *, RANK()OVER(PARTITION BY user_id ORDER BY reaction_cnt DESC) AS rn
    FROM t
), b AS(
    SELECT user_id, COUNT(content_id) AS total
    FROM reactions
    GROUP BY user_id
    HAVING COUNT(content_id) >= 5
)
SELECT b.user_id,
       a.reaction AS dominant_reaction,
       ROUND(a.reaction_cnt/ b.total, 2) AS reaction_ratio
FROM b
JOIN a
ON b.user_id = a.user_id
WHERE a.rn = 1 AND a.reaction_cnt/ b.total > 0.6
ORDER BY reaction_ratio DESC, b.user_id ASC;