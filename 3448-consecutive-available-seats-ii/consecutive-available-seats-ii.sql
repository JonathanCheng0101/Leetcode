# Write your MySQL query statement below
WITH t AS(
    SELECT *,
        seat_id - SUM(free)OVER(ORDER BY seat_id) AS grp
    FROM Cinema
    WHERE free = 1
), a AS(
    SELECT seat_id,
       grp,
       ROW_NUMBER()OVER(PARTITION BY grp ORDER BY seat_id ASC) AS rn,
       COUNT(grp)OVER(PARTITION BY grp) AS cnt
FROM t
), b AS(
    SELECT COUNT(*)AS cnt
FROM t
GROUP BY grp

), c AS(
SELECT MAX(cnt) AS cnt
FROM b
), d AS(
    SELECT a.seat_id, a.grp, a.rn
FROM a
JOIN c
WHERE c.cnt = a.cnt

)
SELECT MIN(seat_id) AS first_seat_id,
       MAX(seat_id) AS last_seat_id,
       COUNT(*) AS consecutive_seats_len
FROM d
GROUP BY grp
ORDER BY first_seat_id ASC;