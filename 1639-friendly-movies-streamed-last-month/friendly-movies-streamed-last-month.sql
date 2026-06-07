SELECT DISTINCT c.title
FROM Content c
JOIN TVProgram t
ON c.content_id = t.content_id
WHERE Kids_content = 'Y' AND YEAR(t.program_date) = 2020 AND MONTH(t.program_date) = 6 AND c.content_type = 'Movies'