use [Marketing Data];

/**
QUESTION 13:
Just for clarity purposes, your company wants to see which education level got to the management job the most. 
Write a query to show the education level that  gets the management position the most. 
Let your output show the education, job and the count of jobs columns.
**/


SELECT TOP 1 (education), job, COUNT(job) AS job_count
FROM [Marketing data for bank]
WHERE job = 'management'
GROUP BY education, job
ORDER BY job_count DESC
