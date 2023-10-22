create database [Marketing Data];

use [Marketing Data];

select *
from INFORMATION_SCHEMA.TABLES;

select *
from [Marketing data for bank];


--Select all rows that have a NULL value in column pdays 
select pdays
from  [Marketing data for bank]
where pdays = NULL;



--  Number of Customers who are divorced with balance greater than 2000 
SELECT COUNT(*) DivorcedCustomersWithBalanceGreaterThan2000
FROM [Marketing data for bank]
WHERE marital = 'divorced' AND balance > 2000


--Total Number of customers
SELECT  COUNT(*) TotalCustomers
FROM [Marketing data for bank]





SELECT 
   ((COUNT(CASE WHEN marital = 'divorced' AND balance > 2000 THEN 1 ELSE NULL END)* 100 / COUNT(*))) AS Percentage
FROM [Marketing data for bank]

/**
QUESTION 11:
Your Company started consulting for Micro Bank who needs to analyze their marketing data to understand their customers better. 
This will help them plan their next marketing campaign. 
You are brought on board as the aalyst for this job. They have an offer for customers who are divorced but they need data to back up the campaign.
Using the marketing data, write an SSMS query to show the percentage of customers who are divorced and have balances greater than 2000.
**/
SELECT
    (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM [Marketing data for bank])) AS Percentage
FROM
    [Marketing data for bank]
WHERE
    marital = 'divorced' AND balance > 2000;



/**

In this query:

We use a subquery (SELECT COUNT(*) FROM [Marketing data for bank]) to get the total number of records in the "[Marketing data for bank]" table.
We use the main query to count the number of records where marital is 'divorced' and balance is greater than 2000.
We calculate the percentage by dividing the count of divorced customers with balances greater than 2000 by the total count of records and multiplying by 100.
We use * 100.0 to ensure that the division result is a decimal value.
The result is rounded to two decimal places, and the percentage sign is placed beside the result.
Running this query in SQL Server Management Studio (SSMS) will give you the percentage of customers 
who are divorced and have balances greater than 2000 in the "[Marketing data for bank]" table.
**/
OR

/**
QUESTION 11:
Your Company started consulting for Micro Bank who needs to analyze their marketing data to understand their customers better. 
This will help them plan their next marketing campaign. 
You are brought on board as the aalyst for this job. They have an offer for customers who are divorced but they need data to back up the campaign.
Using the marketing data, write an SSMS query to show the percentage of customers who are divorced and have balances greater than 2000.
**/

SELECT 
    ROUND(
	--CASE statement conditionally counts the customers meeting the specified criteria, then multiply by 100. Second count function counts Total Customers.
	--First Count function divides statement 1 by Statement 2 to get the result.
	(COUNT(CASE WHEN marital = 'divorced' AND balance > 2000 THEN 1 END) * 100.0) / COUNT(*), 
	2) AS PercentageOfDivorcedCustomersWithBalanceGreeaterThan2000
FROM [Marketing data for bank];





/**
This query calculates the percentage of customers who are divorced and have balances greater than 2000 by using the COUNT function 
along with a CASE statement to conditionally count the customers meeting the specified criteria. 
It then rounds the result to two decimal places using the ROUND function.
**/