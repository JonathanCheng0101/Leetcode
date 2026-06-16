# Write your MySQL query statement below
WITH t AS(
    SELECT t.transaction_id, t.customer_id, t.product_id, p.category, p.price, t.transaction_date, t.amount
    FROM Transactions t
    JOIN Products p
    ON t.product_id = p.product_id
), a AS(
    SELECT customer_id, category, transaction_date,COUNT(category)OVER(PARTITION BY customer_id, category) AS cnt
    FROM t
), b AS(
    SELECT *, ROW_NUMBER()OVER(PARTITION BY customer_id ORDER BY cnt DESC, transaction_date DESC) AS rn
    FROM a
), c AS(
    SELECT customer_id,
       ROUND(SUM(amount), 2) AS total_amount,
       COUNT(transaction_id) AS transaction_count,
       COUNT(DISTINCT category) AS unique_categories,
       ROUND(SUM(amount) / COUNT(category), 2) AS avg_transaction_amount,
       ROUND((COUNT(transaction_id) * 10) + (SUM(amount) / 100), 2) AS loyalty_score 
FROM t
GROUP BY customer_id

), d AS(
    SELECT customer_id, category AS top_category
FROM b
WHERE rn = 1
)
SELECT c.customer_id,
       c.total_amount,
       c.transaction_count,
       c.unique_categories,
       c.avg_transaction_amount,
       d.top_category,
       c.loyalty_score 
FROM c
JOIN d
ON c.customer_id = d.customer_id
ORDER BY c.loyalty_score DESC, c.customer_id ASC;