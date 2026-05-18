CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      WITH t AS (
        SELECT salary,
               DENSE_RANK() OVER(ORDER BY salary DESC) AS rn
        FROM Employee
      )
      SELECT DISTINCT IFNULL(salary, null)
      FROM t
      WHERE rn = N
          
  );
END