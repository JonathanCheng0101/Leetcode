# Write your MySQL query statement below
WITH t AS(
    SELECT interview_id, 
           SUM(score) AS total_score
    FROM Rounds
    GROUP BY interview_id
)
SELECT candidate_id
FROM Candidates c
JOIN t
ON t.interview_id = c.interview_id
WHERE t.total_score > 15 AND c.years_of_exp >= 2;
