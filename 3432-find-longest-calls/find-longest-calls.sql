# Write your MySQL query statement below
WITH t AS(
        SELECT ca.contact_id,
        c.first_name,
        ca.type,
        ca.duration,
        RANK()OVER(PARTITION BY ca.type ORDER BY ca.duration DESC) AS rn
    FROM Calls ca
    JOIN Contacts c
    ON c.id = ca.contact_id
)
SELECT first_name,
       type,
       DATE_FORMAT(SEC_TO_TIME(duration), "%H:%i:%s") AS duration_formatted
FROM t
WHERE rn <= 3
ORDER BY type DESC, duration DESC, first_name DESC;
