# Write your MySQL query statement below
SELECT class 
FROM Courses
GROUP BY class
HAVING count(student)>=5


#COUNT = 幾筆資料（幾個人） SUM = 數值加總
