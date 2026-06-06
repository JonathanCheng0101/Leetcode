WITH t AS(
    SELECT COUNT(*) AS total
    FROM Users
), a AS(
    SELECT contest_id, COUNT(contest_id) AS cnt
    FROM Register
    GROUP BY contest_id
)
SELECT contest_id,
       ROUND(100* a.cnt/ t.total, 2) AS percentage
FROM a
JOIN t
ORDER BY percentage DESC, contest_id ASC;
