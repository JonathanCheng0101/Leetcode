# Write your MySQL query statement below
WITH t AS(
    SELECT *,
        MIN(exam_date)OVER(PARTITION BY student_id, subject) AS min_date,
        MAX(exam_date)OVER(PARTITION BY student_id, subject) AS max_date
    FROM Scores
), a AS(
SELECT student_id, subject, score AS latest_score, exam_date
FROM t
WHERE exam_date = min_date OR exam_date = max_date
ORDER BY student_id
), b AS(
    SELECT student_id, subject, LAG(latest_score)OVER(PARTITION BY student_id, subject ORDER BY exam_date ASC)AS first_score, latest_score
FROM a

)
SELECT student_id, subject,first_score, latest_score
FROM b
WHERE latest_score > first_score
ORDER BY student_id ASC, subject ASC;




#         LAG(score)OVER(PARTITION BY student_id, subject ORDER BY exam_date ASC)AS first_score
