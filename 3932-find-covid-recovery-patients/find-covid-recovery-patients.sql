# Write your MySQL query statement below
WITH t AS(
    SELECT patient_id
    FROM covid_tests
    WHERE result IN ("Positive","Negative")
    GROUP BY patient_id
    HAVING COUNT(DISTINCT result) >= 2
), 
pos AS(
    SELECT c.patient_id,
           MIN(c.test_date) AS min_pos
FROM covid_tests c
WHERE result = 'Positive'
GROUP BY c.patient_id

),
neg AS(
    SELECT c.patient_id,
           MIN(c.test_date) AS min_neg
FROM covid_tests c
JOIN pos
ON c.patient_id = pos.patient_id
WHERE result = 'Negative' AND test_date > pos.min_pos
GROUP BY c.patient_id
)


SELECT p.patient_id,
       p.patient_name,
       p.age,
       DATEDIFF(neg.min_neg, pos.min_pos) AS recovery_time
FROM patients p
JOIN t
ON p.patient_id = t.patient_id
JOIN pos
ON p.patient_id = pos.patient_id
JOIN neg
ON p.patient_id = neg.patient_id

ORDER BY recovery_time ASC, p.patient_name ASC;
