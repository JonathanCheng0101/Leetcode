# Write your MySQL query statement below
DELETE P1
FROM Person P1
JOIN Person p2
ON p1.email=p2.email
AND p1.id> p2.id


# join 成

# 下面這種的要刪除
# p1.id   p1.email    p2.id     p2.email
#    3      aa@gmail     1         aa@gmail  