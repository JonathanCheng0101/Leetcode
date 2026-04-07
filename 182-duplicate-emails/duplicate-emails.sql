# Write your MySQL query statement below
SELECT email  # 最後要呈現的東西
FROM Person 
GROUP BY email   # 把資料「按照某個欄位分組」
HAVING  COUNT(*)> 1 # 對「分組結果」做條件篩選