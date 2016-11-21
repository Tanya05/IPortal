--1
 SELECT country.name, count(*) as number_of_cities FROM country, city WHERE country.code = city.countrycode GROUP BY country.name ORDER BY number_of_cities DESC;

--2
SELECT country.name, city.name FROM country, city WHERE country.code = city.countrycode and city.name LIKE 'Z%';

--3
SELECT 'Min', name FROM country WHERE population = (SELECT min(population) FROM country)  UNION  SELECT 'Max', name FROM country WHERE population = (SELECT MAX(population) FROM country)  UNION  SELECT 'Avg', round(AVG(population),0) as average_population FROM country;

--4
SELECT name, indepYear FROM country WHERE indepYear = (SELECT indepYear FROM country WHERE name = 'Poland');

--5
SELECT name, indepYear FROM country where indepYear = (SELECT min(indepYear) FROM country) UNION SELECT name, indepYear FROM country WHERE indepYear = (SELECT max(indepYear) FROM country);

--6
SELECT country.name, countrylanguage.language FROM country, countrylanguage WHERE country.code = countrylanguage.countrycode and country.capital IS NULL;

--7
SELECT name, LifeExpectancy FROM country WHERE LifeExpectancy > (SELECT LifeExpectancy FROM country WHERE name = 'India');

--8
SELECT country.name, countrylanguage.language FROM country, countrylanguage WHERE country.code = countrylanguage.countrycode ORDER BY country.name;

--9
SELECT country.name, countrylanguage.language FROM country, countrylanguage WHERE country.code = countrylanguage.countrycode and countrylanguage.language IN (SELECT countrylanguage.language FROM country, countrylanguage WHERE country.code = countrylanguage.countrycode and country.name = 'New Zealand');

--10
 SELECT country.name, city.name FROM country, city WHERE country.code = city.countrycode and city.population IN (SELECT max(city.population) FROM country, city WHERE country.code = city.countrycode GROUP BY country.name);