WITH t AS(
    SELECT a.student_id AS a_id,
       a.student_name AS a_name,
       b.student_id AS b_id,
       b.student_name AS b_name,
       c.student_id AS c_id,
       c.student_name AS c_name
FROM SchoolA a
JOIN SchoolB b
JOIN SchoolC c
)
SELECT a_name AS member_A,
       b_name AS member_B,
       C_name AS member_C
FROM t
WHERE (a_id != b_id) AND(b_id != c_id) AND(a_id != c_id) AND (a_name != b_name)AND (b_name != c_name)AND (a_name != c_name)