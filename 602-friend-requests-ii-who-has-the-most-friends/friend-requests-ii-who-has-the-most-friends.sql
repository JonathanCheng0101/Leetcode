WITH t AS (
    SELECT requester_id AS f1
    FROM RequestAccepted

    UNION ALL

    SELECT accepter_id AS f1
    FROM RequestAccepted
)
SELECT f1 AS id,
       COUNT(*) AS num
FROM t
GROUP BY f1
ORDER BY COUNT(*) DESC
LIMIT 1;