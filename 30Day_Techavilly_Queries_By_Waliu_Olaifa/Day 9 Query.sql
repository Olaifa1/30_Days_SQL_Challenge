Use Superstore;


/**
QUESTION 9:
Now that you have identified "phones" from column Sub_Category 
as the business driver in terms of revenue. The company wants to know the total "phones sales" by year 
to understand how "each year" performed. As the Analyst, 
please help them to show the breakdown of the Total sales by year in descending order. 
let your output show only Total sales and sales year column.

**/

SELECT
	ROUND(SUM(Sales),0) AS [Total Sales],
	YEAR(Order_Date) AS [Sales Year]
	
FROM Orders
WHERE Sub_Category = 'Phones'
GROUP BY YEAR(Order_Date)
ORDER BY [Total Sales] DESC;
