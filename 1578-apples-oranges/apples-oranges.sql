SELECT DISTINCT sale_date,
       SUM(CASE WHEN fruit = 'apples' THEN sold_num ELSE 0 END)OVER(PARTITION BY sale_date)      
       -  
       SUM(CASE WHEN fruit = 'oranges' THEN sold_num ELSE 0 END)OVER(PARTITION BY sale_date) AS diff
FROM Sales
