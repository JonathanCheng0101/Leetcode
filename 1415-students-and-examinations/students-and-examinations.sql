WITH t AS(
    SELECT s.student_id, s.student_name, sub.subject_name
    FROM Students s
    CROSS JOIN Subjects sub
)
SELECT t.student_id,
       t.student_name,
       t.subject_name,
       IFNULL(COUNT(e.subject_name), 0) AS attended_exams
FROM t 
LEFT JOIN Examinations e
ON t.student_id = e.student_id AND t.subject_name = e.subject_name
GROUP BY t.student_id, t.subject_name
ORDER BY t.student_id ASC, t.subject_name ASC