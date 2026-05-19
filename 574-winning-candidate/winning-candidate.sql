# Write your MySQL query statement below
SELECT c.name AS name
FROM Vote v
JOIN Candidate c
ON v.candidateId = c.id
GROUP BY v.candidateId
ORDER BY COUNT(*) DESC
LIMIT 1;