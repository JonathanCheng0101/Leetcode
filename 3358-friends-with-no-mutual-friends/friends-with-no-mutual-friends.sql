# Write your MySQL query statement below
WITH t AS(
    SELECT user_id1 AS id1, user_id2 AS id2
    FROM Friends
    UNION ALL
    SELECT user_id2, user_id1
    FROM Friends
), a AS(
    SELECT LEAST(t1.id2,t2.id2) AS user_id1, GREATEST(t1.id2,t2.id2) AS user_id2
    FROM t t1
    JOIN t t2
    ON t1.id1 = t2.id1
    WHERE t1.id2 < t2.id2 
)
SELECT f.user_id1, f.user_id2
FROM Friends f
LEFT JOIN a
ON LEAST(f.user_id1, f.user_id2) = a.user_id1 AND GREATEST(f.user_id1, f.user_id2) = a.user_id2
WHERE a.user_id1 IS NULL AND a.user_id2 IS NULL 
ORDER BY f.user_id1, f.user_id2