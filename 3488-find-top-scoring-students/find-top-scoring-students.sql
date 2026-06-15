# Write your MySQL query statement below
WITH t AS(
    SELECT s.student_id, c.course_id, s.major AS studnet_major, c.major AS course_major
    FROM courses c
    JOIN students s
    ON c.major = s.major
), a AS(
    SELECT t.student_id,
       t.course_id,
       e.grade,
       t.studnet_major,
       t.course_major
FROM t
LEFT JOIN enrollments e
ON t.student_id = e.student_id AND e.course_id = t.course_id
)
SELECT DISTINCT student_id
FROM a
WHERE NOT EXISTS(
    SELECT 1
    FROM a a2 
    WHERE (a.student_id  = a2.student_id AND a2.grade != 'A')OR (a.student_id  = a2.student_id AND a2.grade IS NULL)
) 
ORDER BY student_id ASC;
