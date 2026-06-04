WITH t AS(
    SELECT country_id,
        CASE WHEN AVG(weather_state) <= 15 THEN 'Cold' 
             WHEN AVG(weather_state) >= 25 THEN 'Hot'
            ELSE 'Warm' END AS weather_type
    FROM Weather
    WHERE DATE_FORMAT(`day`, "%Y-%m") = '2019-11'
    GROUP BY country_id
)
SELECT  c.country_name, t.weather_type
FROM Countries c
JOIN t 
ON c.country_id = t.country_id