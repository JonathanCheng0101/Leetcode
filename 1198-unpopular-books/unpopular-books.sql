WITH t AS(
    SELECT book_id,
        name
    FROM Books
    WHERE available_from <= DATE_SUB('2019-06-23', INTERVAL 30 DAY)
), a AS(
    SELECT book_id,
       SUM(quantity) AS quantity
    FROM Orders
    WHERE dispatch_date >= DATE_SUB('2019-06-23', INTERVAL 365 DAY) AND dispatch_date <= '2019-06-23'
    GROUP BY book_id
), b AS(
    SELECT t.book_id, t.name, IFNULL(a.quantity, 0) AS quantity
    FROM t
    LEFT JOIN a
    ON t.book_id = a.book_id
)
SELECT book_id,
       name
FROM b
WHERE quantity < 10;