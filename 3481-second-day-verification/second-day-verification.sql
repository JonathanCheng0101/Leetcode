WITH t AS(
    SELECT e.email_id,
        e.user_id,
        DATE_FORMAT(e.signup_date, "%Y-%m-%d") AS signup_date,
        t.signup_action,
        DATE_FORMAT(t.action_date, "%Y-%m-%d") AS action_date
    FROM emails e
    JOIN texts t
    ON e.email_id = t.email_id
)
SELECT user_id
FROM t
WHERE signup_action = 'Verified'
      AND
      TIMESTAMPDIFF(day, signup_date, action_date) = 1
ORDER BY user_id ASC; 


