📊 Layoffs Data Exploration with SQL

This project explores global layoffs data using SQL.
The goal is to analyze patterns, trends, and insights around layoffs across companies, industries, countries, and time periods.

🚀 Features

Data Exploration: Quickly preview and explore the dataset with SELECT *.

Easier Queries:

Find maximum layoffs.

Identify companies with 100% layoffs.

Check percentages and funding details.

Aggregated Insights:

Top companies, locations, countries, and industries by layoffs.

Year-wise and stage-wise layoff summaries.

Advanced Analysis:

Rolling totals of layoffs by month.

CTEs for cumulative layoffs.

Ranking companies with the most layoffs per year (Top 3 each year).

📂 Dataset

The dataset used in this project is stored in a table called standralising, which contains information such as:

company

total_laid_off

percentage_laid_off

location

country

date

industry

stage

funds_raised

🛠️ SQL Queries Breakdown
🔹 Easier Queries
-- Maximum layoffs
SELECT MAX(total_laid_off)
FROM standralising;

-- Companies with 100% layoffs
SELECT *
FROM standralising
WHERE percentage_laid_off = 1;

🔹 Aggregated Insights
-- Total layoffs by industry
SELECT industry, SUM(total_laid_off) AS total_laid_off
FROM standralising
GROUP BY industry
ORDER BY total_laid_off DESC;

-- Total layoffs by country
SELECT country, SUM(total_laid_off) AS total_laid_off
FROM standralising
GROUP BY country
ORDER BY total_laid_off DESC;

🔹 Advanced Queries
-- Rolling total of layoffs per month
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

📈 Insights You Can Extract

Which companies had the largest single-day layoffs.

Which industries and countries were most affected.

The trend of layoffs over the years.

Top 3 companies per year with the most layoffs.

Rolling and cumulative totals to see how layoffs spread over time.

🧑‍💻 Tech Stack

SQL (MySQL / PostgreSQL compatible)

Dataset stored in relational database

Queries structured for exploration + insights

📸 Example Output (Optional)

Add charts or screenshots of query results / dashboards here for better presentation.

🌟 How to Use

Clone this repo:

git clone https://github.com/your-username/layoffs-sql-analysis.git


Import the dataset into your SQL database.

Run queries in your favorite SQL client (MySQL Workbench, DBeaver, pgAdmin, etc.).

Explore, analyze, and derive insights!

📌 Future Improvements

Add visualizations (Tableau, Power BI, or Python Matplotlib/Seaborn).

Automate ETL pipeline to update data.

Extend to predictive analysis with ML models.

🤝 Contributing

Pull requests are welcome! For major changes, please open an issue first to discuss what you’d like to change.

📜 License

This project is licensed under the MIT License.

👉 Would you like me to also create a section with visualizations (e.g., matplotlib or Tableau screenshots) so your README looks even more attractive and professional?

You said:
wheni past to the readme the titles and other are mixsing 
ChatGPT said:

Ah, I see what happened 🙂. On GitHub, Markdown formatting needs proper spacing and syntax to display correctly. If titles and other formatting are missing when you paste, it’s usually because of missing blank lines or incorrect heading syntax.

Here’s a fixed and properly structured README.md that will look clean on GitHub:

# 📊 Layoffs Data Exploration with SQL

This project explores global layoffs data using SQL.  
The goal is to analyze patterns, trends, and insights around layoffs across companies, industries, countries, and time periods.

---

## 🚀 Features

- **Data Exploration**: Quickly preview and explore the dataset with `SELECT *`.
- **Easier Queries**:
  - Find maximum layoffs.
  - Identify companies with 100% layoffs.
  - Check percentages and funding details.
- **Aggregated Insights**:
  - Top companies, locations, countries, and industries by layoffs.
  - Year-wise and stage-wise layoff summaries.
- **Advanced Analysis**:
  - Rolling totals of layoffs by month.
  - CTEs for cumulative layoffs.
  - Ranking companies with the most layoffs per year (Top 3 each year).

---

## 📂 Dataset

The dataset used in this project is stored in a table called **`standralising`**, which contains information such as:

- `company`  
- `total_laid_off`  
- `percentage_laid_off`  
- `location`  
- `country`  
- `date`  
- `industry`  
- `stage`  
- `funds_raised`  

---

## 🛠️ SQL Queries Breakdown

### 🔹 Easier Queries
```sql
-- Maximum layoffs
SELECT MAX(total_laid_off)
FROM standralising;

-- Companies with 100% layoffs
SELECT *
FROM standralising
WHERE percentage_laid_off = 1;

🔹 Aggregated Insights
-- Total layoffs by industry
SELECT industry, SUM(total_laid_off) AS total_laid_off
FROM standralising
GROUP BY industry
ORDER BY total_laid_off DESC;

-- Total layoffs by country
SELECT country, SUM(total_laid_off) AS total_laid_off
FROM standralising
GROUP BY country
ORDER BY total_laid_off DESC;

🔹 Advanced Queries
-- Rolling total of layoffs per month
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

📈 Insights You Can Extract

Which companies had the largest single-day layoffs

Which industries and countries were most affected

The trend of layoffs over the years

Top 3 companies per year with the most layoffs

Rolling and cumulative totals to see how layoffs spread over time

🧑‍💻 Tech Stack

SQL (MySQL / PostgreSQL compatible)

Dataset stored in relational database

Queries structured for exploration + insights

📸 Example Output (Optional)

Add charts or screenshots of query results / dashboards here for better presentation.

🌟 How to Use

Clone this repo:

git clone https://github.com/your-username/layoffs-sql-analysis.git


Import the dataset into your SQL database.

Run queries in your favorite SQL client (MySQL Workbench, DBeaver, pgAdmin, etc.).

Explore, analyze, and derive insights!

📌 Future Improvements

Add visualizations (Tableau, Power BI, or Python Matplotlib/Seaborn)

Automate ETL pipeline to update data

Extend to predictive analysis with ML models

🤝 Contributing

Pull requests are welcome! For major changes, please open an issue first to discuss what you’d like to change.

📜 License

This project is licensed under the MIT License.
