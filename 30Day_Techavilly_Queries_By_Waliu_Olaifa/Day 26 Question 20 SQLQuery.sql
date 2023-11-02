USE EMPLOYEE;

/**
DAY 26 (QUESTION 20):
Using the employee table dataset, write a query to show 
the ratio of the analyst job title to the entire job titles.
**/
SELECT
	COUNT(CASE WHEN job_title = 'Analyst' THEN 1 END) AS AnalystCount,
	COUNT (*) AS AnalystToTotalRatio
FROM Employee
