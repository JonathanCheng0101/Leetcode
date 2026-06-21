# Write your MySQL query statement below
WITH t AS(
    SELECT user_id
    FROM subscription_events
    GROUP BY user_id
    HAVING SUM(CASE WHEN event_type = 'downgrade' THEN 1 ELSE 0 END) >= 1
), a AS(
    SELECT user_id,
       event_date,
       event_type,
       plan_name AS current_plan,
       monthly_amount AS current_monthly_amount,
       MIN(event_date)OVER(PARTITION BY user_id) AS earliest_date,
       MAX(event_date)OVER(PARTITION BY user_id) AS latest_date,
       MAX(monthly_amount)OVER(PARTITION BY user_id ORDER BY monthly_amount DESC) AS max_historical_amount
    FROM subscription_events
), b AS(
    SELECT *, TIMESTAMPDIFF(day, earliest_date, latest_date) AS days_as_subscriber 
    FROM a
    WHERE (event_date = latest_date)
        AND
        (TIMESTAMPDIFF(day, earliest_date, latest_date) >= 60) 
        AND
        current_monthly_amount/max_historical_amount < 0.5
        AND
        NOT EXISTS(
            SELECT 1
            FROM subscription_events s
            WHERE s.user_id = a.user_id AND s.event_type = 'cancel'
        )


)
SELECT b.user_id, b.current_plan, b.current_monthly_amount, b.max_historical_amount, b.days_as_subscriber
FROM b
JOIN t
ON b.user_id = t.user_id
ORDER BY b.days_as_subscriber DESC, b.user_id ASC;



       