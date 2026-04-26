# Write your MySQL query statement below
SELECT user_id,
       COUNT(tokens) AS prompt_count,
       ROUND(SUM(tokens) / COUNT(tokens),2)AS avg_tokens
FROM prompts
GROUP BY user_id
HAVING COUNT(tokens) >= 3 AND COUNT(DISTINCT tokens) > 1
ORDER BY avg_tokens DESC, user_id ASC;