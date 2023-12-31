Use Superstore;

/**
Question 7:
The Briggs company has 3 categories of business generating revenue for the company. 
They want to know which of them is driving the business. 
Write a query to show the total sales and percentage contribution. 
Show category, Total Sales and Percentage contribution columns in your output.
**/
SELECT
    Category,
    ROUND(SUM(Sales), 0) AS TotalSales,
    ROUND((SUM(Sales) / (SELECT SUM(Sales) FROM Orders)) * 100, 1) AS PercentageContribution
FROM
    Orders
GROUP BY
    Category
ORDER BY 
	TotalSales DESC;

	





/**	In this query:

We select the "Category" from the "Orders" table to group the data by different categories.
We use the SUM function to calculate the total sales for each category.
To calculate the percentage contribution, we divide the total sales for each category by the overall total sales (calculated using a subquery) and multiply by 100 to get the percentage.
The results are grouped by the "Category," so you get the total sales and percentage contribution for each category.
This query will provide you with a result set containing the category, total sales, and percentage contribution for each category of business generated by The Briggs company.
**/


SELECT
    Category,
    ROUND(SUM(Sales), 0) AS TotalSales,
	--Divide TotaSale of each Category with the TotalSales of all categories. Find the percentage. Round up to 0dp. Convert reult to String and put the "%" as the unit by using the function " CONCAT"
    CONCAT(ROUND((SUM(Sales) / (SELECT SUM(Sales) FROM Orders)) * 100, 1), '%') AS 'PercentageContribution (%)'
FROM
    Orders
GROUP BY
    Category
ORDER BY 
	TotalSales DESC;
