# Write your MySQL query statement below
WITH t AS(
    SELECT *,
       CASE WHEN session_rating >=4 OR session_rating <= 2 THEN 1 ELSE 0 END AS polarized,
       MIN(session_rating)OVER(PARTITION BY book_id) AS min_rating,
       MAX(session_rating)OVER(PARTITION BY book_id) AS max_rating,
       COUNT(book_id)OVER(PARTITION BY book_id)AS cnt
    FROM reading_sessions
),a AS(
    SELECT book_id, 
       MAX(max_rating  - min_rating) AS rating_spread,
       SUM(polarized)/COUNT(book_id) AS polarization_score 
    FROM t
    WHERE cnt >= 5 AND min_rating <= 2 AND max_rating >= 4
    GROUP BY book_id
)
SELECT  a.book_id, b.title, b.author, b.genre, b.pages, a.rating_spread, ROUND(a.polarization_score, 2) AS polarization_score
FROM a
JOIN books b
ON a.book_id = b.book_id
WHERE rating_spread >= 2 AND polarization_score >= 0.6
ORDER BY a.polarization_score DESC, b.title DESC;
