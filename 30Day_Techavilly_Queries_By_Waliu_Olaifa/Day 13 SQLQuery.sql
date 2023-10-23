USE [Marketing data]




/**
Question 12: 
Micro Bank wants  to be sure they have enough data for this campaign and would like to see the total count of each job as contained in the dataset. 
Using the marketing data, write a query to show the count of each job, arrange the total count in Desc order.
**/

SELECT job, COUNT(*) AS job_count
FROM [Marketing data for bank]
GROUP BY job
ORDER BY job_count DESC;

