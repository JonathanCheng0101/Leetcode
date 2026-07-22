WITH t AS(
    SELECT visit_id, SUM(amount) AS amount
    FROM Transactions 
    GROUP BY visit_id
), a AS(
    SELECT v.customer_id, t.visit_id
    FROM Visits v
    LEFT JOIN t
    ON v.visit_id = t.visit_id
), b AS(
    SELECT customer_id, SUM(CASE WHEN visit_id IS NULL THEN 1 ELSE 0 END) AS count_no_trans
FROM a
GROUP BY customer_id

)
SELECT *
FROM b
WHERE count_no_trans != 0