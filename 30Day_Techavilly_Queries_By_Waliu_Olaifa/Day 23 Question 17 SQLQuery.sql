USE EMPLOYEE



select *
from SharePrice
/**
DAY 23 QUESTION 17:
Using the SharePrice Table dataset, write an SSMS query to show a table that displays the highest daily decrease and the highest daily increase in share price.
**/


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