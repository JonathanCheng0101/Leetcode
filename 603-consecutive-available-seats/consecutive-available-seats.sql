WITH t AS(
    SELECT *
    FROM Cinema
    WHERE free = 1
), a AS(
SELECT CASE WHEN (seat_id - LAG(seat_id)OVER(ORDER BY seat_id) = 1) OR (LEAD(seat_id)OVER(ORDER BY seat_id) - seat_id= 1) THEN seat_id END AS seat_id
FROM t
)
SELECT seat_id
FROM a
WHERE seat_id IS NOT NULL;

