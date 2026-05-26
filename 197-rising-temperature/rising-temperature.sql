SELECT w2.id AS Id
FROM Weather w1
JOIN Weather w2
ON TIMESTAMPDIFF(day,w1.recordDate, w2.recordDate) = 1
WHERE w1.temperature < w2.temperature;