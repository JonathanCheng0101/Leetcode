# Write your MySQL query statement below
WITH t AS(
    SELECT t.client_id,
       t.driver_id,
       t.status,
       t.request_at,
       CASE WHEN t.client_id = u1.users_id AND u1.role = 'client' AND u1.banned = 'No' 
                 AND
                 t.driver_id = u2.users_id AND u2.role = 'driver' AND u2.banned = 'No' THEN 1
            ELSE 0 END AS valid_chk
FROM Trips t
JOIN Users u1
ON t.client_id = u1.users_id
JOIN Users u2
ON t.driver_id = u2.users_id
), a AS(
   SELECT *
    FROM t
    WHERE valid_chk = 1 AND request_at BETWEEN '2013-10-01' AND '2013-10-03'
)
SELECT request_at AS `Day`,
       ROUND(SUM(CASE WHEN status = 'cancelled_by_driver' OR status = 'cancelled_by_client' THEN 1 ELSE 0 END)/ COUNT(*), 2) AS 'Cancellation Rate'
FROM a
GROUP BY request_at
ORDER BY request_at ASC;
