WITH t as(
    SELECT (ABS(x - LEAD(x) OVER(ORDER BY x))) AS shortest
    FROM `Point`
)
SELECT MIN(shortest) AS shortest
FROM t
WHERE shortest IS NOT NULL;