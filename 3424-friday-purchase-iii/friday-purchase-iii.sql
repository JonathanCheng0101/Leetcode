# Write your MySQL query statement below
WITH t AS(
    SELECT p.user_id,
        u.membership,
        p.purchase_date,
        CASE WHEN u.membership = 'Premium' THEN p.amount_spend ELSE 0 END AS premium_amount,
        CASE WHEN u.membership = 'VIP' THEN p.amount_spend ELSE 0 END AS vip_amount,
        DAYOFWEEK(p.purchase_date) AS weekday_chk
    FROM Purchases p
    JOIN Users u
    ON p.user_id = u.user_id
    WHERE u.membership IN ('Premium', 'VIP')
), a AS(
    SELECT purchase_date,
        membership,
        SUM(premium_amount) AS premium_amount,
        SUM(vip_amount) AS vip_amount
    FROM t
    WHERE weekday_chk = 6
    GROUP BY purchase_date, membership
), b AS(
    SELECT '2023-11-03' AS `date`,
       1 AS week_of_month
UNION ALL
SELECT '2023-11-10',
       2
UNION ALL
SELECT '2023-11-17',
       3
UNION ALL
SELECT '2023-11-24',
       4
), c AS(
    SELECT 'Premium' AS membership
    UNION All
    SELECT 'VIP'
), d AS(
    SELECT b.`date`, b.week_of_month, c.membership
    FROM b
    CROSS JOIN c
)

SELECT d.week_of_month,
       d.membership,
       CASE WHEN a.membership = 'Premium' THEN premium_amount
            WHEN a.membership = 'VIP' THEN vip_amount
        ELSE 0 END AS total_amount
FROM d
LEFT JOIN a
ON d.`date` = a.purchase_date AND a.membership = d.membership
ORDER BY week_of_month ASC, d.membership ASC;


