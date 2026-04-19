# Write your MySQL query statement below  library_books    borrowing_records
WITH current_borrow AS(
    SELECT book_id,COUNT(*) AS borrow_num
    FROM borrowing_records
    WHERE return_date IS NULL
    GROUP BY book_id
    )

SELECT l.book_id, l.title, l.author, l.genre, l.publication_year, l.total_copies AS current_borrowers
FROM library_books l
LEFT JOIN current_borrow c
ON l.book_id = c.book_id
WHERE l.total_copies - c.borrow_num = 0
ORDER BY current_borrowers  DESC,l.title ASC;



