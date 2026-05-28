# Write your MySQL query statement below
WITH t AS(
    SELECT c.name,
       c.country_code,
       p.id
    FROM Country c
    JOIN Person p
    ON c.country_code = LEFT(p.phone_number, 3)
)
, a AS(
    SELECT caller_id AS id, duration
    FROM Calls

    UNION ALL

    SELECT callee_id AS id, duration
    FROM Calls
), b AS(
    SELECT t.name AS country,
       SUM(a.duration) AS sum_duration,
       COUNT(*) AS country_cnt,
       SUM(a.duration)/ COUNT(*) AS country_avg
    FROM a
    JOIN t
    ON a.id = t.id
    GROUP BY t.name
), c AS(
    SELECT SUM(sum_duration)/ SUM(country_cnt) AS global_avg
    FROM b
)
SELECT b.country
FROM b
JOIN c
WHERE b.country_avg > c.global_avg


    







