# Write your MySQL query statement below
WITH t AS(
    SELECT product_id,
           YEAR(purchase_date) AS `year`
    FROM Orders
), a AS(
    SELECT product_id,
        `year`,
        COUNT(product_id)AS cnt
    FROM t
    GROUP BY product_id, `year`
), b AS(
    SELECT product_id,
           `year`,
           cnt,
           LEAD(`year`) OVER(PARTITION BY product_id ORDER BY `year` ASC) AS next_yr,      
           LEAD(cnt) OVER(PARTITION BY product_id ORDER BY `year` ASC) AS next_cnt   
    FROM a
)
SELECT DISTINCT product_id
FROM b
WHERE next_yr = `year` + 1
      AND
      cnt >= 3
      AND
      next_cnt >=3;    
                