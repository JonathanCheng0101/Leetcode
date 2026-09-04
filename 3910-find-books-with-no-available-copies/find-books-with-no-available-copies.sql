# Write your MySQL query statement below
WITH t AS(
    SELECT book_id,
        COUNT(*) AS minus_cnt
    FROM borrowing_records
    WHERE return_date IS NULL
    GROUP BY book_id
), a AS(
    SELECT l.book_id,
       l.title,
       author,
       l.genre,
       l.publication_year,
       l.total_copies - IFNULL(t.minus_cnt, 0) AS copy_left 
    FROM library_books l
    LEFT JOIN t
    ON l.book_id = t.book_id
)
SELECT a.book_id,
       a.title,
       a.author,
       a.genre,
       a.publication_year,
       l.total_copies AS current_borrowers 
FROM a
JOIN library_books l
ON a.book_id = l.book_id
WHERE a.copy_left = 0
ORDER BY current_borrowers DESC, a.title ASC;
