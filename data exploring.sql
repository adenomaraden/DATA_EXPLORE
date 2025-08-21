

-- Explore the data
SELECT * 
FROM standralising;

-- EASIER QUERIES

SELECT MAX(total_laid_off)
FROM standralising;

-- Looking at Percentage to see how big these layoffs were
SELECT MAX(percentage_laid_off), MIN(percentage_laid_off)
FROM standralising
WHERE percentage_laid_off IS NOT NULL;

-- Which companies had 100% of their employees laid off
SELECT *
FROM standralising
WHERE percentage_laid_off = 1;

-- Check how big some of these companies were by funds raised
SELECT *
FROM standralising 
WHERE percentage_laid_off = 1




-- SOMEWHAT TOUGHER (using GROUP BY)

-- Companies with the biggest single layoff (on one day)
SELECT company, total_laid_off
FROM standralising
ORDER BY total_laid_off DESC
LIMIT 5;

-- Companies with the most total layoffs
SELECT company, SUM(total_laid_off) AS total_laid_off
FROM standralising
GROUP BY company
ORDER BY total_laid_off DESC
LIMIT 10;

-- By location
SELECT location, SUM(total_laid_off) AS total_laid_off
FROM standralising
GROUP BY location
ORDER BY total_laid_off DESC
LIMIT 10;

-- By country
SELECT country, SUM(total_laid_off) AS total_laid_off
FROM standralising
GROUP BY country
ORDER BY total_laid_off DESC;

-- By year
SELECT YEAR(date) AS years, SUM(total_laid_off) AS total_laid_off
FROM standralising
GROUP BY YEAR(date)
ORDER BY years ASC;

-- By industry
SELECT industry, SUM(total_laid_off) AS total_laid_off
FROM standralising
GROUP BY industry
ORDER BY total_laid_off DESC;

-- By stage
SELECT stage, SUM(total_laid_off) AS total_laid_off
FROM standralising
GROUP BY stage
ORDER BY total_laid_off DESC;



-- TOUGHER QUERIES

-- Companies with most layoffs per year (Top 3 each year)
SELECT a.company, a.years, a.total_laid_off
FROM (
  SELECT company, YEAR(`date`) AS years, SUM(total_laid_off) AS total_laid_off
  FROM standralising
  WHERE `date` IS NOT NULL
  GROUP BY company, YEAR(`date`)
) a
LEFT JOIN (
  SELECT company, YEAR(`date`) AS years, SUM(total_laid_off) AS total_laid_off
  FROM standralising
  WHERE `date` IS NOT NULL
  GROUP BY company, YEAR(`date`)
) b
  ON a.years = b.years AND b.total_laid_off > a.total_laid_off
GROUP BY a.company, a.years, a.total_laid_off
HAVING COUNT(b.company) < 3        -- keep the top 3 per year
ORDER BY a.years ASC, a.total_laid_off DESC, a.company ASC;



-- Rolling total of layoffs per month
SELECT SUBSTRING(date,1,7) AS dates, SUM(total_laid_off) AS total_laid_off
FROM standralising
GROUP BY dates
ORDER BY dates ASC;

-- Use rolling total inside a CTE
WITH DATE_CTE AS 
(
  SELECT SUBSTRING(date,1,7) AS dates, SUM(total_laid_off) AS total_laid_off
  FROM standralising
  GROUP BY dates
  ORDER BY dates ASC
)
SELECT dates, SUM(total_laid_off) OVER (ORDER BY dates ASC) AS rolling_total_layoffs
FROM DATE_CTE
ORDER BY dates ASC;






