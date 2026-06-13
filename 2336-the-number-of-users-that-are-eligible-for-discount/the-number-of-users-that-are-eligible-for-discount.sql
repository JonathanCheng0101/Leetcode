CREATE FUNCTION getUserIDs(startDate DATE, endDate DATE, minAmount INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      SELECT COUNT(DISTINCT user_id)
      FROM Purchases
      WHERE time_stamp BETWEEN DATE_FORMAT(startDate, "%Y-%m-%d") AND DATE_FORMAT(endDate, "%Y-%m-%d")
    AND amount >= minAmount
      
  );
END