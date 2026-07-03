# Write your MySQL query statement below
# book_id, name

WITH t AS(
    SELECT book_id, name
    FROM Books
    WHERE TIMESTAMPDIFF(DAY, available_from, '2019-06-23') > 30
), a AS(
    SELECT book_id, SUM(quantity) AS quantity
    FROM Orders
    WHERE TIMESTAMPDIFF(DAY, dispatch_date , '2019-06-23') < 365 AND TIMESTAMPDIFF(DAY, dispatch_date , '2019-06-23') > 0
    GROUP BY book_id
    HAVING quantity >= 10
)
SELECT t.book_id, t.name
FROM t
WHERE NOT EXISTS (
    SELECT 1
    FROM a
    WHERE a.book_id = t.book_id
)


