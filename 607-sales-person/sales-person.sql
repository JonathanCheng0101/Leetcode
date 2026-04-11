# Write your MySQL query statement below
# SELECT s.name
# FROM SalesPerson s
# LEFT JOIN Orders o
# ON s.sales_id = o.sales_id
# WHERE o.com_id != 1
# 注意 left join的問題 
# LEFT JOIN 的意思是：「左表全部保留，右表沒匹配到的地方填 NULL」
# 會衍生出把沒有訂單的人直接null 但他們應該要保留

SELECT name
FROM SalesPerson
WHERE sales_id NOT IN (
    SELECT sales_id
    FROM Orders
    WHERE com_id = (
        SELECT com_id
        FROM Company
        WHERE name = 'RED'
    )
);