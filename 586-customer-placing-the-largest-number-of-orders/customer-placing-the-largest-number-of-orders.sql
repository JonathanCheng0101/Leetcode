# Write your MySQL query statement below
# COUNT(*)
SELECT customer_number
FROM Orders
GROUP BY customer_number
ORDER BY COUNT(*) DESC
LIMIT 1 

# SELECT 後面接啥 就會顯示啥
# sum是對裡面的值相加 count就是單純算幾次
# ORDER BY ... DESC   -- 由大到小（最大在前）
# ORDER BY ... ASC    -- 由小到大（最小在前，預設）