WITH t AS(
    SELECT *, SUBSTRING_INDEX(email, '@', -1) AS email_domain
    FROM Emails
    WHERE email LIKE '%.com'
)
SELECT email_domain,
       COUNT(DISTINCT id) AS `count`
FROM t
GROUP BY email_domain
ORDER BY email_domain ASC;