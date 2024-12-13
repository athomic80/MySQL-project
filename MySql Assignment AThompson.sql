#Task 3 
SELECT COUNT(name) FROM city WHERE CountryCode = "USA";

#Task 4
SELECT Name, Population, LifeExpectancy FROM country WHERE Code = "ARG";

#Task 5
SELECT Name, LifeExpectancy FROM country ORDER BY LifeExpectancy DESC LIMIT 1;

#Task 6
SELECT Name FROM city WHERE Name LIKE "F%" ORDER BY Name LIMIT 25;

#Task 7
SELECT Id, Name, Population FROM city ORDER BY Population DESC LIMIT 10;

#Task 8
SELECT Name, Population FROM city where population > 2000000 ORDER BY Population DESC;

#Task 9
SELECT Name FROM city where Name LIKE "Be%";

#Task 10
SELECT Name, Population FROM city WHERE Population BETWEEN 500000 AND 1000000 ORDER BY Population DESC;

#Task 11
SELECT Name, Population FROM city ORDER BY Population LIMIT 1;

#Task 12
SELECT country.Name, country.Population, countrylanguage.Language
FROM country
JOIN countrylanguage
ON country.Code = countrylanguage.CountryCode
WHERE country.Code = "CHE";

#Task 13
SELECT country.Name, city.Name
FROM country
JOIN city
ON country.Capital = city.ID
WHERE country.Name = "Spain";

#Task 14
SELECT Name, LifeExpectancy
FROM country
ORDER BY LifeExpectancy DESC
LIMIT 1;

#Task 15
SELECT city.Name AS City, country.Name AS Country
FROM country
JOIN city
ON country.Code = city.CountryCode
WHERE country.Continent = "Europe";

#Task 16
SELECT Name, Population FROM city ORDER BY Population DESC LIMIT 1;

#Task 17
SELECT Continent, SUM(Population) AS Population
FROM country
GROUP BY Continent
ORDER BY Population DESC;

#Task 18
SELECT Continent, AVG(LifeExpectancy) AS LifeExpectancy
FROM country
GROUP BY Continent
ORDER BY LifeExpectancy DESC;

#Task 19
SELECT country.Name, COUNT(city.CountryCode) AS NoofCities
FROM country
JOIN city
ON country.Code = city.CountryCode
GROUP BY country.Name
ORDER BY NoofCities DESC;

#Task 20
SELECT country.Name, SUM(city.Population) AS PopulationByCity, 
country.Population AS TotalPopulation, 
(country.Population - SUM(city.Population)) AS Difference
FROM country
JOIN city
ON country.Code = city.CountryCode
GROUP BY country.Name, country.Population
ORDER BY PopulationByCity DESC;

#Task 21
SELECT country.Continent, countrylanguage.Language, SUM(countrylanguage.Percentage) as TotalPercentage
FROM country
JOIN countrylanguage
ON country.Code = countrylanguage.CountryCode
GROUP BY country.Continent, countrylanguage.Language
HAVING SUM(countrylanguage.Percentage) = (SELECT MAX(TotalLanguagePercentage) 
FROM (SELECT SUM(l.Percentage) AS TotalLanguagePercentage FROM countrylanguage AS l JOIN country AS c ON l.CountryCode = c.Code
WHERE c.Continent = country.Continent GROUP BY l.Language) AS subquery) ORDER BY country.Continent;

#Task 22
SELECT country.name, countrylanguage.Language
FROM country
JOIN countrylanguage
ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.IsOfficial = "T" 
AND countrylanguage.Language = "English" 
OR countrylanguage.Language = "Spanish" 
OR countrylanguage.Language = "French";

#TASK 23
SELECT Continent, SUM(Population) AS Population
FROM country
GROUP BY Continent
ORDER BY Population DESC;

#Task 24
SELECT country.Name AS Country, COUNT(countrylanguage.Language) AS OfficialLanguageCount
FROM country
JOIN countrylanguage
ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.IsOfficial ="T"
GROUP BY country.Name
HAVING COUNT(countrylanguage.IsOfficial) > 3
ORDER BY country.name;

#TASK 25
SELECT Name, Population
FROM country
WHERE Population > (SELECT avg(Population) FROM country)
ORDER BY Population DESC;