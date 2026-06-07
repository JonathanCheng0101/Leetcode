# Write your MySQL query statement below
WITH t AS(
    SELECT product_id, YEAR(purchase_date) AS `year`, COUNT(product_id) AS cnt
FROM Orders
GROUP BY product_id, `year`
), a AS(
    SELECT product_id,
       `year`,
       cnt,
       LEAD(`year`)OVER(PARTITION BY product_id ORDER BY `year` ASC) AS nxt_yr,
       LEAD(cnt)OVER(PARTITION BY product_id ORDER BY `year` ASC) AS nxt_cnt
FROM t
)
SELECT DISTINCT product_id
FROM a
WHERE nxt_yr - `year` = 1 AND cnt >= 3 AND nxt_cnt >= 3;