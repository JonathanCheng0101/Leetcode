# Write your MySQL query statement below
WITH t AS(
    SELECT book_id,
           name
    FROM Books
    WHERE TIMESTAMPDIFF(day, available_from, '2019-06-23') > 31
), o AS(
    SELECT book_id,
           quantity
    FROM Orders
    WHERE TIMESTAMPDIFF(day, dispatch_date, '2019-06-23') <= 365
)
SELECT t.book_id, t.name
FROM t
LEFT JOIN o
ON t.book_id = o.book_id
GROUP BY t.book_id
HAVING IFNULL(SUM(o.quantity),0) < 10;