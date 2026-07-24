WITH t AS(
    SELECT COUNT(*) AS user_count
    FROM Users 
), a AS(
    SELECT contest_id, COUNT(DISTINCT user_id) AS contest_cnt
    FROM Register
    GROUP BY contest_id
)
SELECT a.contest_id, ROUND(100*(a.contest_cnt/ t.user_count), 2) AS percentage
FROM a
CROSS JOIN t
ORDER BY percentage DESC, a.contest_id ASC;