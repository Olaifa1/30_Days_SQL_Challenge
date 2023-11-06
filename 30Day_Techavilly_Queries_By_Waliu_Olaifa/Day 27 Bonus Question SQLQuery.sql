USE Superstore;


/**
DAY 27 BONUS QUESTION:
Write a query to find the 3rd highest sales from the sample superstore data.
**/

SELECT TOP 1 ROUND(Sales, 2) AS ThirdHighestSales
FROM  (
		SELECT TOP 3 Sales
		FROM Orders
		ORDER BY Sales DESC
) AS SubQuery
ORDER BY Sales ASC


--OR


WITH RankedOrders AS (
    SELECT
        Order_ID,
        Sales,
        DENSE_RANK() OVER (ORDER BY Sales DESC) AS SalesRank
    FROM
        Orders
)
SELECT
    Order_ID,
    Sales
FROM
    RankedOrders
WHERE
    SalesRank = 3;


/**
This query first creates a common table expression (CTE) called RankedOrders, 
where it ranks the orders based on the Sales column in descending order using the DENSE_RANK() window function. 
The resulting rank is stored in the SalesRank column. Then, in the main query, 
it selects the Order_ID and Sales from the CTE where the SalesRank is equal to 3, 
which gives you the 3rd highest sales value from the Orders table.
**/