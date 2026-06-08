WITH t AS(
    SELECT visit_id
    FROM Transactions
    GROUP BY visit_id
), a AS(
    SELECT customer_id
FROM Visits v
WHERE NOT EXISTS(
    SELECT 1
    FROM t
    WHERE v.visit_id = t.visit_id
)
)
SELECT customer_id, COUNT(customer_id) AS count_no_trans
FROM a
GROUP BY customer_id
