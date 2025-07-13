-- 1)Get all columns for records where damage is 'w/o'
SELECT *
FROM flight
WHERE dmg = 'w/o';

-- 2)Count how many accidents happened in each damage category
SELECT dmg, COUNT(*) as total
FROM flight
GROUP BY dmg;

-- 3)List distinct aircraft types
SELECT DISTINCT type
FROM flight;

-- 4)Get total number of fatal accidents (fatal > 0)
SELECT COUNT(*) as total_accidents
FROM flight
WHERE fatal > 0;

-- 5)Find the most recent 5 accidents
SELECT *
FROM flight
ORDER BY STR_TO_DATE(acc_date, "%d-%b-%y") desc
LIMIT 5;

-- 6)Find top 5 operators with the most accidents
SELECT operator, COUNT(*) as total_accidents
FROM flight
GROUP BY operator
ORDER BY total_accidents desc
LIMIT 5;

-- 7)Get average fatalities per operator
SELECT operator, AVG(fatal) as average_fatalities
FROM flight
GROUP BY operator
ORDER BY average_fatalities desc;

-- 8)Find number of accidents per year
SELECT YEAR(STR_TO_DATE(acc_date, "%d-%b-%y")) as year, COUNT(*) as 'Total accidents'
FROM flight
GROUP BY year
ORDER BY year;

-- 9)Find the top 3 locations with the highest total fatalities
SELECT location, SUM(fatal) as Total_deaths
FROM flight
GROUP BY location
ORDER BY total_deaths desc
LIMIT 3;

-- 10)Get operators who have more than 2 fatal accidents (using CTE)
WITH fatal_accidents(operator, total_accidents)
as (SELECT operator, COUNT(*)
	FROM flight
    GROUP BY operator)
SELECT *
FROM fatal_accidents
WHERE total_accidents > 2;

SELECT * FROM flight;