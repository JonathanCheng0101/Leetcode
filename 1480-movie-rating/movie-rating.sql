# Write your MySQL query statement below
(SELECT u.name AS results
FROM Users u
JOIN Movierating r
ON u.user_id = r.user_id
GROUP BY u.user_id
ORDER BY COUNT(*) DESC, u.name ASC
LIMIT 1)

UNION ALL

(
SELECT m.title
FROM Movies m
JOIN Movierating r
ON m.movie_id = r.movie_id
WHERE DATE_FORMAT(r.created_at,'%Y-%m') = '2020-02' 
GROUP BY m.movie_id,m.title
ORDER BY AVG(r.rating) DESC, m.title ASC
LIMIT 1
);