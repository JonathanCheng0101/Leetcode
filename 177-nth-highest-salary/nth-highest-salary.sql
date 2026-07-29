CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
    WITH t AS(
        SELECT *,
               DENSE_RANK()OVER(ORDER BY salary DESC) AS rn
        FROM Employee
    )
    SELECT MAX(CASE WHEN rn = N THEN salary END)
    FROM t
    
  );
END