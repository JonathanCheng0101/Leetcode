# Write your MySQL query statement below
# x+ y > z and y+z > x and x+z > y
# 但我不知道要怎麼寫相加的邏輯 還有新增triangle 以及裡面賦值

SELECT x,
       y,
       z,
       IF (x + y > z AND x + z > y AND y + z > x,
        "Yes",
        "No"
       )AS triangle
FROM Triangle