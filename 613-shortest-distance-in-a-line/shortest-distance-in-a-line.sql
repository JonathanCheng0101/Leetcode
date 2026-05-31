WITH t AS(
    SELECT (LEAD(x)OVER(ORDER BY x ASC) - x) AS diff
    FROM `Point`
)
SELECT MIN(diff) AS shortest
FROM t;