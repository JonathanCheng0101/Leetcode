WITH t AS(
    SELECT s.student_id, s.student_name, sub.subject_name
    FROM Students s
    CROSS JOIN Subjects sub
), a AS(
    SELECT student_id, subject_name, COUNT(*) AS attended_exams
    FROM Examinations
    GROUP BY student_id, subject_name
)
SELECT t.student_id, t.student_name, t.subject_name, IFNULL(a.attended_exams, 0) AS attended_exams
FROM t
LEFT JOIN a 
ON t.student_id = a.student_id AND t.subject_name = a.subject_name
ORDER BY t.student_id ASC, t.subject_name ASC;
