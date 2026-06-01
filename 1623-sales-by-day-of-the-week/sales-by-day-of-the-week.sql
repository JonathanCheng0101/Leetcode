# Write your MySQL query statement below
WITH t AS(
    SELECT i.item_category AS Category,
       IFNULL(o.quantity, 0) AS quantity,
       DATE_FORMAT(o.order_date, "%W") AS `day`
    FROM Items i 
    LEFT JOIN Orders o
    ON o.item_id = i.item_id
)
SELECT CATEGORY,
       IFNULL(SUM(CASE WHEN `day` = 'Monday' THEN quantity END), 0) AS MONDAY,
       IFNULL(SUM(CASE WHEN `day` = 'Tuesday' THEN quantity END), 0) AS TUESDAY,
       IFNULL(SUM(CASE WHEN `day` = 'Wednesday' THEN quantity END), 0) AS WEDNESDAY,
       IFNULL(SUM(CASE WHEN `day` = 'Thursday' THEN quantity END), 0) AS THURSDAY,
       IFNULL(SUM(CASE WHEN `day` = 'Friday' THEN quantity END), 0) AS FRIDAY,
       IFNULL(SUM(CASE WHEN `day` = 'Saturday' THEN quantity END), 0) AS SATURDAY,
       IFNULL(SUM(CASE WHEN `day` = 'Sunday' THEN quantity END), 0) AS SUNDAY
FROM t
GROUP BY CATEGORY
ORDER BY CATEGORY ASC;