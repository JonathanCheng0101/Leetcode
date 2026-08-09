WITH t AS(
    SELECT book_id, name
    FROM Books
    WHERE available_from < '2019-05-23'
), a AS(
    SELECT book_id, SUM(quantity) AS quantity
    FROM Orders
    WHERE dispatch_date BETWEEN '2018-06-23' AND '2019-06-23'
    GROUP BY book_id
    HAVING SUM(quantity) >= 10
)
SELECT t.book_id, t.name
FROM t
WHERE NOT EXISTS(
    SELECT 1
    FROM a
    WHERE a.book_id = t.book_id
)

