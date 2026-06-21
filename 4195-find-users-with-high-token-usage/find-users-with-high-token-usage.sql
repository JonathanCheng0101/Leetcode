# user_id | prompt_count  | avg_tokens
WITH t AS(
    SELECT user_id,
        COUNT(user_id)OVER(PARTITION BY user_id) AS prompt_count,
        tokens,
        ROUND(AVG(tokens)OVER(PARTITION BY user_id), 2) AS avg_tokens
    FROM prompts
)
SELECT DISTINCT user_id, prompt_count, avg_tokens
FROM t
WHERE prompt_count >= 3 AND tokens > avg_tokens
ORDER BY avg_tokens DESC, user_id ASC;