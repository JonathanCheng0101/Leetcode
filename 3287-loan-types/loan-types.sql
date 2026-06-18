SELECT user_id
FROM Loans
WHERE loan_type IN ('Mortgage', 'Refinance')
GROUP BY user_id
HAVING COUNT(DISTINCT loan_type) >= 2
ORDER BY user_id ASC;