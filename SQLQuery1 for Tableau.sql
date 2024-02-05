-- Covid 19 Project SQL Queries

-- View the data in CovidDeaths table

SELECT *
FROM PortfolioProject_C19..CovidDeaths
ORDER BY Continent, Location


-- SQL Queries

-- 1.


-- GLOBAL : Total Cases, Total Deaths, Chance of Death among confirmed cases


SELECT MAX(total_cases) AS TotalCases, MAX(total_deaths) AS TotalDeaths, ROUND(MAX(total_deaths)/MAX(CAST(total_cases AS FLOAT))*100, 4) AS ChanceOfDeath 
From PortfolioProject_C19..CovidDeaths 
WHERE continent IS NULL AND location IN ('World')



-- 2. 

-- CONTINENTS : Death Count per Continent
-- European Union is part of Europe

SELECT location, SUM(cast(new_deaths AS INT)) AS TotalDeathCount
FROM PortfolioProject_C19..CovidDeaths
WHERE continent IS NULL 
	AND location NOT IN ('World', 'European Union', 'International', 'High Income', 'Upper middle income', 'Lower middle income', 'Low income')
GROUP BY location
ORDER By TotalDeathCount DESC


-- 3. 

-- INCOME GROUPS : Total Cases, Percentage of Population Infected, Total Deaths, Percent of Deaths per Population, Chance of Death

SELECT location, population, MAX(total_cases) AS TotalCases, ROUND((SUM(new_cases)/CAST(population AS FLOAT))*100, 4) AS PercentagePopulationInfected, MAX(total_deaths) AS TotalDeaths, 
	ROUND((MAX(total_deaths)/CAST(population AS FLOAT))*100, 4) AS PercentagePopulationDeaths, ROUND(MAX(total_deaths)/MAX(CAST(total_cases AS FLOAT))*100, 4) AS ChanceOfDeath 
From PortfolioProject_C19..CovidDeaths 
WHERE continent IS NULL 
	AND location IN ('High Income', 'Upper middle income', 'Lower middle income', 'Low income')
GROUP BY location, population




-- 4. 

-- LOCATION AND POPULATION : Highest Infection Count and Percent of Population Infected by Location and Population

SELECT Location, Population, MAX(total_cases) AS HighestInfectionCount,  ROUND(MAX(total_cases/CAST(population AS FLOAT))*100, 3) AS PercentPopulationInfected
From PortfolioProject_C19..CovidDeaths
GROUP BY location, population
ORDER BY PercentPopulationInfected DESC


-- 5. 

-- CONTINENT : Total Cases, Percent of Populaion Infected, Total Deaths, Percentage of Population Deaths, Chance of Death among Confirmed Cases PER Continent and Population 

SELECT location, population, MAX(total_cases) AS TotalCases, ROUND((SUM(new_cases)/CAST(population AS FLOAT))*100, 4) AS PercentagePopulationInfected, MAX(total_deaths) AS TotalDeaths, 
	ROUND((MAX(total_deaths)/CAST(population AS FLOAT))*100, 4) AS PercentagePopulationDeaths, ROUND(MAX(total_deaths)/MAX(CAST(total_cases AS FLOAT))*100, 4) AS ChanceOfDeath 
From PortfolioProject_C19..CovidDeaths 
WHERE continent IS NULL AND location NOT IN ('World', 'European Union', 'High Income', 'Upper middle income', 'Lower middle income', 'Low income')
GROUP BY location, population
ORDER BY location







