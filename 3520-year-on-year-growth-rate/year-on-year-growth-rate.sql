# Write your MySQL query statement below
WITH t AS(
    SELECT YEAR(transaction_date) AS `year`,
        product_id,
        SUM(spend) AS curr_year_spend
        
    FROM user_transactions
    GROUP BY product_id, YEAR(transaction_date)
)
SELECT `year`,
       product_id,
       curr_year_spend,
       LAG(curr_year_spend)OVER(PARTITION BY product_id ORDER BY `year` ASC) AS prev_year_spend,
       ROUND(100 * (curr_year_spend - LAG(curr_year_spend)OVER(PARTITION BY product_id ORDER BY `year` ASC))/ LAG(curr_year_spend)OVER(PARTITION BY product_id ORDER BY `year` ASC), 2) AS yoy_rate
FROM t
ORDER BY product_id ASC, `year` ASC;