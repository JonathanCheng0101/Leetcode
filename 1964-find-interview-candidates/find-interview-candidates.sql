WITH gold AS(
    SELECT gold_medal AS gold_id
    FROM Contests
    GROUP BY gold_medal
    HAVING COUNT(*) >= 3
)
,a AS((
SELECT contest_id, gold_medal AS medal
FROM contests
)
UNION ALL
(
SELECT contest_id, silver_medal AS medal
FROM contests
)
UNION ALL

(
SELECT contest_id, bronze_medal AS medal
FROM contests
))
, b AS(
    SELECT *,
       contest_id - ROW_NUMBER()OVER(PARTITION BY medal ORDER BY contest_id ASC) AS diff
    FROM a
), c AS(
    SELECT DISTINCT medal
    FROM b
    GROUP BY medal, diff
    HAVING COUNT(*) >= 3

    UNION

    SELECT gold_id FROM gold
)
SELECT u.name,
       u.mail
FROM Users u
JOIN c
ON u.user_id = c.medal






