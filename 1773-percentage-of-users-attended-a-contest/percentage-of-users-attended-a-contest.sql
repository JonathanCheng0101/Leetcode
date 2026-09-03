WITH t AS(
    SELECT COUNT(*) AS total_cnt
    FROM Users
)
SELECT r.contest_id, ROUND(100 * COUNT(DISTINCT r.user_id)/ t.total_cnt, 2) AS percentage
FROM Register r
CROSS JOIN t
GROUP BY r.contest_id
ORDER BY percentage DESC, contest_id ASC;