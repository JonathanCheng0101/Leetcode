# | age_bucket | send_perc | open_perc 
WITH t AS(
    SELECT age.age_bucket, a.user_id, a.activity_type, a.time_spent
    FROM Activities a
    JOIN Age age
    ON a.user_id = age.user_id
), a AS(
    SELECT age_bucket,
       SUM(CASE WHEN activity_type = 'send' THEN time_spent ELSE 0 END) AS send,
       SUM(CASE WHEN activity_type = 'open' THEN time_spent ELSE 0 END) AS open,
       SUM(time_spent) AS total
FROM t
GROUP BY age_bucket

)
SELECT age_bucket,  ROUND(100 * send/ total, 2) AS send_perc,  ROUND(100 *open/ total, 2) AS open_perc
FROM a;