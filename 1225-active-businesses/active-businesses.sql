WITH t AS(
    SELECT *,
           AVG(occurrences)OVER(PARTITION BY event_type) AS avg_occ
    FROM Events
)
SELECT business_id
FROM t
WHERE occurrences > avg_occ
GROUP BY business_id
HAVING COUNT(*) > 1;