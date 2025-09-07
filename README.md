# 📊 DATA_EXPLORE — SQL Layoffs Analysis

This project explores **layoffs data** using SQL.  
The goal is to uncover insights about workforce reductions across companies, industries, locations, and years.

The SQL script [`data exploring.sql`](./data%20exploring.sql) contains queries ranging from simple exploration to advanced analytical queries.

---

## 📑 Table of Contents

1. [Project Overview](#-project-overview)  
2. [Dataset](#-dataset)  
3. [Queries Breakdown](#-queries-breakdown)  
   - [Easier Queries](#-easier-queries)  
   - [Aggregated Insights](#-aggregated-insights)  
   - [Advanced Analysis](#-advanced-analysis)  
4. [Insights You Can Extract](#-insights-you-can-extract)  
5. [Tech Stack](#-tech-stack)  
6. [How to Use](#-how-to-use)  
7. [Future Improvements](#-future-improvements)  
8. [License](#-license)  

---

## 📖 Project Overview

The project uses SQL to answer key questions such as:  

- Which companies had the **largest single-day layoffs**?  
- Which industries and countries were most affected?  
- What were the **yearly trends** of layoffs?  
- Which companies consistently appeared in the **Top 3 layoffs per year**?  
- What is the **cumulative total of layoffs over time**?  

---

## 📂 Dataset

The dataset is stored in a table named **`standralising`**, with fields including:  

- `company`  
- `industry`  
- `location`  
- `country`  
- `stage`  
- `date`  
- `total_laid_off`  
- `percentage_laid_off`  
- `funds_raised`  

---

## 🛠 Queries Breakdown

### 🔹 Easier Queries
- View all records  
- Maximum layoffs (`MAX(total_laid_off)`)  
- Companies with **100% layoffs**  
- Min/Max layoff percentage  

```sql
SELECT MAX(total_laid_off) FROM standralising;
SELECT * FROM standralising WHERE percentage_laid_off = 1;
🔹 Aggregated Insights
Biggest single-day layoffs

Most total layoffs by company

Layoffs grouped by location, country, industry, stage

Year-wise layoffs

sql
Copy code
SELECT country, SUM(total_laid_off) AS total_laid_off
FROM standralising
GROUP BY country
ORDER BY total_laid_off DESC;
🔹 Advanced Analysis
Top 3 companies per year (using window functions)

Rolling monthly totals of layoffs

Cumulative layoffs using CTE + window functions

sql
Copy code
WITH DATE_CTE AS 
(
  SELECT SUBSTRING(date,1,7) AS dates, SUM(total_laid_off) AS total_laid_off
  FROM standralising
  GROUP BY dates
)
SELECT dates, SUM(total_laid_off) OVER (ORDER BY dates ASC) AS rolling_total_layoffs
FROM DATE_CTE;
📈 Insights You Can Extract
📌 Top companies with the largest layoffs (single day & total)

📌 Industries & countries most impacted

📌 Year-over-year layoff trends

📌 Cumulative layoffs across months

🧑‍💻 Tech Stack
SQL (MySQL / PostgreSQL compatible)

Data organized in a relational database

🌟 How to Use
Clone the repo:

bash
Copy code
git clone https://github.com/adenomaraden/DATA_EXPLORE.git
Open data exploring.sql in your SQL client.

Run queries step by step on the dataset table (standralising).

📌 Future Improvements
Add data cleaning pipeline (remove duplicates, standardize formats).

Build visualizations (Tableau / Power BI / Python).

Extend project with ETL automation for live updates
