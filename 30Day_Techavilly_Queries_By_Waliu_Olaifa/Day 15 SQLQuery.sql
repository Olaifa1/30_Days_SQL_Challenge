use [Marketing Data]



/**
QUESTION 15:
Write a query to show the average duration of customers' employment in management positions. 
The duration should be calculated in years.
**/

SELECT 
		AVG(duration)/52 AS Avg_Employment_Duration_Years
FROM [Marketing data for bank]
WHERE job ='management'
GROUP BY job