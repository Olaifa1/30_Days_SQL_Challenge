USE [Marketing Data]

/**
QUESTION 15:
What is the total number of customers that have housing, loan and are single?
**/
SELECT COUNT(*) AS TotalCustomers
FROM [Marketing data for bank]
WHERE housing = 1 AND loan = 1 AND marital = 'single';