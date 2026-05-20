# Write your MySQL query statement below
WITH t AS(
    SELECT *,
           RANK() OVER(PARTITION BY student_id ORDER BY grade DESC, course_id ASC) AS rn
    FROM Enrollments
)

SELECT student_id,
       course_id, 
       grade
FROM t
WHERE rn = 1
ORDER BY student_id ASC;