WITH t AS(
    SELECT candidate_id, SUM(CASE WHEN skill IN ('Python', 'Tableau', 'PostgreSQL') THEN 1 ELSE 0 END) AS skill_cnt
    FROM Candidates
    GROUP BY candidate_id
)
SELECT candidate_id
FROM t
WHERE skill_cnt >= 3
ORDER BY candidate_id ASC;