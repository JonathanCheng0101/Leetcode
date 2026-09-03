WITH t AS(
    SELECT DISTINCT visit_id
    FROM Transactions
), a AS(
    SELECT visit_id,
       customer_id
    FROM Visits v
    WHERE NOT EXISTS(
        SELECT 1
        FROM t
        WHERE t.visit_id = v.visit_id
    )
)

SELECT customer_id,
       COUNT(*) AS count_no_trans
FROM a
GROUP BY customer_id;
