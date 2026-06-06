# Write your MySQL query statement below
WITH t AS(
    SELECT product_id,
        YEAR(purchase_date) AS `year`,
        COUNT(product_id) AS cnt
    FROM Orders
    GROUP BY product_id, YEAR(purchase_date)
), a AS(
    SELECT *,
       LEAD(cnt)OVER(PARTITION BY product_id ORDER BY `year`) AS nxt_cnt,
       LEAD(`year`)OVER(PARTITION BY product_id ORDER BY `year`) AS nxt_yr     
    FROM t
)

SELECT DISTINCT product_id
FROM a
WHERE cnt >= 3 AND
      nxt_cnt >= 3 AND
      nxt_yr - `year` = 1;