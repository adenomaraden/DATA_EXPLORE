

# 📊 Layoffs Data Exploration with SQL

This project explores global layoffs data using SQL.  
The goal is to analyze patterns, trends, and insights around layoffs across companies, industries, countries, and time periods.

---

## 🚀 Features

- **Data Exploration** → Quickly preview and explore the dataset with `SELECT *`.  
- **Easier Queries** →  
  - Find maximum layoffs  
  - Identify companies with 100% layoffs  
  - Check percentages and funding details  
- **Aggregated Insights** →  
  - Top companies, locations, countries, and industries by layoffs  
  - Year-wise and stage-wise layoff summaries  
- **Advanced Analysis** →  
  - Rolling totals of layoffs by month  
  - CTEs for cumulative layoffs  
  - Ranking companies with the most layoffs per year (Top 3 each year)  

---

## 📂 Dataset

The dataset is stored in a table called **`standralising`**, containing:

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

📌 Largest single-day layoffs by company

📌 Industries and countries most affected

📌 Layoff trends year by year

📌 Top 3 companies per year with most layoffs

📌 Rolling and cumulative totals of layoffs

🧑‍💻 Tech Stack

SQL (MySQL / PostgreSQL compatible)

Relational Database to store and query data

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

📊 Add visualizations (Tableau, Power BI, or Python Matplotlib/Seaborn)

⚡ Automate ETL pipeline to refresh data

🤖 Extend to predictive analysis with ML models

🤝 Contributing

Pull requests are welcome!
For major changes, please open an issue first to discuss what you’d like to change.

📜 License

This project is licensed under the MIT License.
