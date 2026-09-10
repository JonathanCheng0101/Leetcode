WITH t AS(
    SELECT book_id,
        name
    FROM Books
    WHERE available_from <= DATE_SUB('2019-06-23', INTERVAL 29 DAY)
), a AS(
    SELECT book_id, SUM(quantity) AS quantity
    FROM Orders
    WHERE dispatch_date BETWEEN DATE_SUB('2019-06-23', INTERVAL 364 DAY) AND '2019-06-23'
    GROUP BY book_id
)
SELECT t.book_id, t.name
FROM t
LEFT JOIN a
ON t.book_id = a.book_id
WHERE IFNULL(a.quantity, 0) < 10;