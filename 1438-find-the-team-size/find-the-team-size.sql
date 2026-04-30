# Write your MySQL query statement below

SELECT employee_id,
       COUNT(*) OVER (partition BY team_id) AS team_size
FROM Employee ;
