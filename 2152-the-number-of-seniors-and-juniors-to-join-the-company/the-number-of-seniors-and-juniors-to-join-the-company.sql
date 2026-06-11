# Write your MySQL query statement below
WITH t AS(
        SELECT *,
                SUM(salary)OVER(ORDER BY salary ASC) AS senior_sum
        FROM Candidates
        WHERE experience = 'Senior'
), 
senior_count AS(
    SELECT COUNT(employee_id) AS senior_cnt
    FROM t WHERE senior_sum <= 70000
),
senior_remain AS(
    SELECT IFNULL(MAX(senior_sum), 0) AS remain
    FROM t
    WHERE senior_sum <= 70000
),
junior AS(
    SELECT *,
            SUM(salary)OVER(ORDER BY salary ASC) AS junior_sum
    FROM Candidates
    WHERE experience = 'Junior'
),
junior_count AS(
    SELECT COUNT(j.employee_id) AS junior_cnt
    FROM junior j 
    JOIN senior_remain s
    WHERE j.junior_sum <= 70000 - s.remain
)
SELECT 'Senior' AS experience,
       senior_cnt AS accepted_candidates
FROM senior_count

UNION ALL

SELECT 'Junior',
       junior_cnt
FROM junior_count




