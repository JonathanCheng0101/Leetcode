# Write your MySQL query statement below
WITH t AS (
    SELECT s.student_id, s.student_name, sub.subject_name
    FROM Students s
    CROSS JOIN Subjects sub
), a AS(
    SELECT student_id, subject_name, COUNT(*) AS cnt
    FROM Examinations
    GROUP BY student_id, subject_name
)
SELECT t.student_id, t.student_name, t.subject_name, IFNULL(a.cnt, 0) AS attended_exams
FROM t
LEFT JOIN a
ON t.student_id = a.student_id AND t.subject_name = a.subject_name
ORDER BY student_id ASC, subject_name ASC;