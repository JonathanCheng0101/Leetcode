CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
    WITH t AS(
        SELECT salary,
               DENSE_RANK() OVER(ORDER BY salary DESC) AS rn
        FROM Employee 
    )
    SELECT DISTINCT salary
    FROM t
    WHERE rn = N
  );
END