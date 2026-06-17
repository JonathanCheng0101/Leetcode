# Write your MySQL query statement below
WITH pro AS(
    SELECT *, COUNT(skill) OVER(PARTITION BY project_id) AS proj_skill_cnt
    FROM Projects
),
 t AS(
    SELECT p.project_id,
        p.skill AS project_skill,
        p.importance,
        c.candidate_id,
        c.skill AS candi_skill,
        c.proficiency,
        p.proj_skill_cnt,
        CASE WHEN c.proficiency > p.importance THEN 10
                WHEN c.proficiency < p.importance THEN -5
                ELSE 0 END AS score
    FROM pro p
    JOIN candidates c
    ON p.skill = c.skill
    ORDER BY p.project_id, c.candidate_id
), a AS(
        SELECT *,
    COUNT(candi_skill) OVER(PARTITION BY project_id, candidate_id) AS can_skill_cnt
FROM t 

),b AS(
    SELECT project_id,
       candidate_id,
       SUM(score) AS score
FROM a
WHERE can_skill_cnt = proj_skill_cnt 
GROUP BY project_id, candidate_id
)
, c AS(
    SELECT *,
       RANK()OVER(PARTITION BY project_id ORDER BY score DESC, candidate_id ASC) AS rn
    FROM b
)

SELECT project_id,
       candidate_id,
       100+ score AS score
FROM c
WHERE rn = 1
ORDER BY project_id ASC;
