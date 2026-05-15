CREATE PROCEDURE getUserIDs(startDate DATE, endDate DATE, minAmount INT)
BEGIN
	# Write your MySQL query statement below.
    SELECT DISTINCT user_id
    FROM Purchases
    WHERE (time_stamp BETWEEN DATE_FORMAT(startDate, '%Y-%m-%d)') AND DATE_FORMAT(endDate, '%Y-%m-%d)'))
        AND
        amount >= minAmount
    ORDER BY user_id;
	
END