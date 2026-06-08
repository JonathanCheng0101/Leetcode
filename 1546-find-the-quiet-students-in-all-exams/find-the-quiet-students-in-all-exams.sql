# Write your MySQL query statement below
WITH t AS(
    SELECT *,
       CASE WHEN (score = MIN(score)OVER(PARTITION BY exam_id)) OR (score = MAX(score)OVER(PARTITION BY exam_id)) THEN 1 ELSE 0 END AS min_max_chk
    FROM Exam
), a AS (
    SELECT *
    FROM t
    WHERE min_max_chk = 1
)
SELECT s.student_id, s.student_name
FROM Student s
WHERE s.student_id IN (SELECT DISTINCT student_id FROM Exam) AND NOT EXISTS(
    SELECT 1
    FROM a
    WHERE a.student_id = s.student_id
)
ORDER BY student_id ASC;