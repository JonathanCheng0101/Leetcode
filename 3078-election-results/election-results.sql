# Write your MySQL query statement below
WITH t AS(
    SELECT *,
        COUNT(voter)OVER(PARTITION BY voter) AS cnt
    FROM Votes
    WHERE candidate IS NOT NULL
), a AS(
    SELECT *,
        1/cnt AS vote_score
    FROM t
), b AS(
    SELECT DISTINCT candidate,
       SUM(vote_score)OVER(PARTITION BY candidate) AS score
    FROM a
), c AS(
SELECT candidate,
       RANK()OVER(ORDER BY score DESC) AS rn
FROM b
)
SELECT candidate
FROM c
WHERE rn = 1