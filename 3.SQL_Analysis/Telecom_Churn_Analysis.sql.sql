-- Telecom Churn Analysis Project
-- Dataset: Kaggle Telecom Churn Dataset
-- Tool: SQL
-- Objective: Identify factors influencing customer churn

CREATE DATABASE telecom_churn;

USE telecom_churn;  

SELECT TOP 10 * 
FROM churn_data;

--Query-1: Total Customers
SELECT 
COUNT(*) AS total_customers
FROM churn_data;

--Query-2: Churn Distribution
select churn,
	count(*) as customers
from Churn_Data
group by Churn

--Query-3: Churn Rate
SELECT 
	COUNT(CASE WHEN churn='TRUE' THEN 1 END)*100.0/COUNT(*) AS churn_rate
FROM churn_data;

--Query-4: Customer Service Calls VS Churn
select	
	Customer_service_calls,count(*) as customers,
	SUM(CASE WHEN churn='TRUE' THEN 1 ELSE 0 END) AS churn_count,
	ROUND(SUM(CASE WHEN churn='TRUE' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS churn_percent
	from Churn_Data
group by Customer_service_calls
order by 1;

--Query-5: Internation plan vs churn
SELECT 
International_plan,
	COUNT(*) AS total_customers,
	SUM(CASE WHEN churn='TRUE' THEN 1 ELSE 0 END) AS churn_count,
	ROUND(SUM(CASE WHEN churn='TRUE' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS churn_percent
FROM Churn_Data
GROUP BY International_plan;

--Query-6: Daily Minutes Usage by Churn
SELECT 
    churn,
    ROUND(AVG(total_day_minutes),2) AS avg_day_minutes,
    ROUND(AVG(total_eve_minutes),2) AS avg_eve_minutes,
    ROUND(AVG(total_night_minutes),2) AS avg_night_minutes
FROM churn_data
GROUP BY churn;

--Query-7: Voice Mail plan vs Churn
SELECT 
   voice_mail_plan,
    COUNT(*) AS total_customers,
   SUM(CASE WHEN churn='TRUE' THEN 1 ELSE 0 END) AS churn_count,
   ROUND(SUM(CASE WHEN churn='TRUE' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS churn_percent
FROM churn_data
GROUP BY voice_mail_plan;

--Query-8: Account Length vs Churn
SELECT 
    churn,
    ROUND(AVG(account_length),2) AS avg_account_length
FROM churn_data
GROUP BY churn;
