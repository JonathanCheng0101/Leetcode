SELECT id,
       IFNULL((CASE WHEN id % 2 = 1 THEN LEAD(student) OVER(ORDER BY id ASC)
            WHEN id % 2 = 0 THEN LAG(student) OVER(ORDER BY id ASC) END), student) AS student
FROM Seat;