# Write your MySQL query statement below
WITH t AS(
    SELECT *,
           MIN(test_date) AS min_pos_date
    FROM covid_tests
    WHERE result = 'Positive'
    GROUP BY patient_id
), a AS(
    SELECT c.patient_id,
       t.min_pos_date,
       MIN(c.test_date) AS min_neg_date,
       TIMESTAMPDIFF(day, t.min_pos_date,MIN(c.test_date)) AS diff
    FROM covid_tests c
    LEFT JOIN t
    ON c.patient_id = t.patient_id
    WHERE c.result = 'Negative' AND TIMESTAMPDIFF(day, t.min_pos_date,c.test_date) > 0
    GROUP BY c.patient_id)
SELECT p.patient_id,
       p.patient_name,
       p.age,
       a.diff AS recovery_time
FROM patients p
JOIN a 
ON p.patient_id = a.patient_id
ORDER BY recovery_time ASC, p.patient_name ASC;





    

