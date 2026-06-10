# Write your MySQL query statement below
WITH senior AS(
    SELECT *,
        SUM(salary)OVER(ORDER BY salary ASC) AS cur_sum
    FROM Candidates
    WHERE experience = 'Senior'
), 
senior_hire AS(
    SELECT employee_id
    FROM senior
    WHERE cur_sum <= 70000
),
senior_sum AS(
    SELECT IFNULL(MAX(cur_sum), 0) AS cur_sum
    FROM senior
    WHERE cur_sum <= 70000 
),
junior AS(
    SELECT *,
        SUM(salary)OVER(ORDER BY salary ASC) AS cur_sum
    FROM Candidates
    WHERE experience = 'Junior'
), 
junior_hire AS(
    SELECT j.employee_id
    FROM junior j
    JOIN senior_sum s
    WHERE j.cur_sum <= 70000 - s.cur_sum
)
SELECT employee_id
FROM junior_hire

UNION ALL 

SELECT employee_id
FROM senior_hire


