# Write your MySQL query statement below
WITH t AS(
        SELECT book_id,
        session_rating,
        COUNT(book_id) OVER(PARTITION BY book_id) AS cnt,
        CASE WHEN session_rating >= 4 OR session_rating <= 2 THEN 1 ELSE 0 END AS extreme_chk
    FROM reading_sessions 
), a AS(
    SELECT book_id,
       MAX(session_rating) - MIN(session_rating) AS rating_spread,
       SUM(extreme_chk)/ COUNT(book_id) AS polarization_score
    FROM t
    WHERE cnt >= 5 
    GROUP BY book_id
    HAVING SUM(extreme_chk)/ COUNT(book_id) >= 0.6 AND MAX(session_rating) >= 4 AND MIN(session_rating) <= 2
)
SELECT b.book_id,
       b.title,
       b.author,
       b.genre,
       b.pages,
       a.rating_spread,
       ROUND(a.polarization_score, 2) AS polarization_score
FROM books b
JOIN a
ON b.book_id = a.book_id
ORDER BY polarization_score DESC, b.title DESC;