# Write your MySQL query statement below
WITH t AS(
    SELECT c.contact_id,
       con.first_name,
       c.type,
       c.duration,
       ROW_NUMBER()OVER(PARTITION BY c.type ORDER BY c.duration DESC) AS rn
    FROM Contacts con
    JOIN Calls c
    ON con.id = c.contact_id
)
SELECT first_name,
       type,
       DATE_FORMAT(SEC_TO_TIME(duration), "%H:%i:%s") AS duration_formatted
FROM t
WHERE rn <= 3
ORDER BY type DESC, duration DESC, first_name DESC