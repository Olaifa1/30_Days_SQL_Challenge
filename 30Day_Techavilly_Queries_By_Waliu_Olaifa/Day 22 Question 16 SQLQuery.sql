CREATE DATABASE EMPLOYEE


use EMPLOYEE

Select *
from employee


/**
QUESTION 16 (DAY 22):
Using the Employee Table dataset, write an SSMS query to show all the employees first name and last name and their respective salaries. 
Also, show the overall average salary of the company 
and calculate the difference between  each employee's salary and the company average salary.
**/

SELECT
    first_name, last_name,salary,
    AVG(salary) OVER () AS Company_Average,
    salary - AVG(salary) OVER () AS salary_difference
FROM Employee;




/**
In this query:

We select the first_name, last_name, and salary columns from the Employee table.
We use the AVG function with the OVER () window frame to calculate the average salary of the entire company. 
The OVER () clause indicates that the average is computed over all rows in the result set.
We calculate the difference between each employee's salary 
and the average salary of the company by subtracting the average salary from the employee's salary.
Running this query in SSMS will give you a result set with the first name, last name, salary, average salary of the company, and the salary difference for each employee.

**/

select *
from SharePrice
/**
Using the SharePrice Table dataset, write an SSMS query to show a table that displays the highest daily decrease and the highest daily increase in share price.
**/


SELECT
    date,
    ticker,
    company,
	MAX(open_price - close_price) AS highest_daily_decrease,
    MAX(close_price - open_price) AS highest_daily_increase
    
FROM SharePrice
GROUP BY date, ticker, company
ORDER BY highest_daily_increase DESC, highest_daily_decrease DESC


SELECT TOP 1
    date,
    ticker,
    company,
	MAX(open_price - close_price) AS highest_daily_decrease,
    MAX(close_price - open_price) AS highest_daily_increase
    
FROM SharePrice
GROUP BY date, ticker, company
ORDER BY highest_daily_increase DESC, highest_daily_decrease DESC


-- Calculate the difference between close_price and open_price
SELECT
    ticker,
    date,
    (close_price - open_price) AS price_difference
INTO
    TempPriceDifference
FROM
    SharePrice;

-- Find the maximum and minimum differences
WITH DifferenceCTE AS (
    SELECT
        ticker,
        date,
        price_difference,
        ROW_NUMBER() OVER (PARTITION BY ticker ORDER BY price_difference ASC) AS min_rank,
        ROW_NUMBER() OVER (PARTITION BY ticker ORDER BY price_difference DESC) AS max_rank
    FROM
        TempPriceDifference
)
SELECT
    ROUND(MAX(CASE WHEN min_rank = 1 THEN price_difference END), 2) AS highest_daily_decrease,
	ROUND(MAX(CASE WHEN max_rank = 1 THEN price_difference END), 2) AS highest_daily_increase
   
FROM
    DifferenceCTE
GROUP BY
    ticker;

-- Drop the temporary table
DROP TABLE TempPriceDifference;




/**
This query first calculates the difference between close_price and open_price for each row in the SharePrice table and 
stores it in a temporary table called TempPriceDifference. 
Then, it uses a Common Table Expression (CTE) to rank the differences within each ticker group to find the maximum and minimum differences. 
Finally, it retrieves the maximum and minimum differences for each ticker and presents them in a two-column result set. 
The temporary table is dropped at the end to clean up.
Make sure to replace ticker with the appropriate column name if your table structure differs.
**/