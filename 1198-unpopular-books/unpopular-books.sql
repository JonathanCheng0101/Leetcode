WITH t AS(
    SELECT *
    FROM Books
    WHERE TIMESTAMPDIFF(day, available_from, '2019-06-23') >= 30
), o AS(
    SELECT book_id, quantity
    FROM Orders
    WHERE TIMESTAMPDIFF(day, dispatch_date, '2019-06-23') <= 365
    GROUP BY book_id
    HAVING SUM(quantity) >= 10
)
SELECT t.book_id,
       t.name
FROM t
WHERE NOT EXISTS(
    SELECT 1
    FROM o
    WHERE t.book_id = o.book_id
)
