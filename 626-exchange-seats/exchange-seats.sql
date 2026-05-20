# Write your MySQL query statement below
WITH t AS(
    SELECT id,
       CASE WHEN id % 2 = 1 THEN IFNULL(LEAD(student)OVER(ORDER BY id),student) 
            WHEN id % 2 = 0 THEN LAG(student)OVER(ORDER BY id) END AS new_student
    FROM Seat
)
SELECT id,
       new_student AS student
FROM t