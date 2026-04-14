# Write your MySQL query statement below
SELECT MAX(num) AS num
FROM(
    SELECT num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(*) = 1) t


# 為何一定要有 t 因為只要 只要你在 FROM 裡面放一個子查詢
# FROM ( ... )
#就 一定要幫它取名字

#WHERE 用來篩選「row」（分組前）
#HAVING 用來篩選「group」（分組後）
# 核心差別（超重要）
#	                    WHERE	       HAVING
#時機	              GROUP BY 前	GROUP BY 後
#篩選對象               單筆 row	  一整個 group
#能不能用COUNT / SUM	❌ 不行       ✅ 可以

