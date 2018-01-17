/*
  Query used to gather all data for San Francisco. Exported as san_francisco_temps
*/

SELECT year, city, avg_temp
FROM city_data
WHERE city = 'San Francisco'
ORDER BY year;

/*
  Query used to gather all temps for global weather. Exported as global_temps
*/

SELECT *
FROM global_data
ORDER BY year;
