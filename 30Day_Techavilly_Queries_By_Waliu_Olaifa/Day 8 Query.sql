Use Superstore;


/**
QUESTION 8:
After seeing the Sales by Category, the Briggs company became curious 
and wanted to dig deeper to see which subcategory is selling the most. 
They need the help of an analyst. Please help the company 
to write a query to show the Sub_Category and the TotalSales of each Sub_Category. 
Let your query display only the Sub_Category and the TotalSales columns to see which product sells the most.
**/

SELECT Sub_Category, ROUND(SUM(Sales), 0) AS [Total Sales]  	
FROM Orders
GROUP BY Sub_Category
ORDER BY [Total Sales]  DESC;
