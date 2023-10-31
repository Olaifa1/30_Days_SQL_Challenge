USE Superstore


/**
DAY 24 (QUESTION 18)
Our client is planning their logistics for 2024, they want to know the average number of days
it takes to ship to the top 10 states. Using the sample superstore dataset, write a query to show
the state and the average number of days between the order date and the ship date to the top 10 states.
**/
SELECT TOP 10 State, 
		AVG(DATEDIFF(day, Order_Date, Ship_Date)) AS AverageDaysBetweenOrderAndShip
FROM Orders
GROUP BY State
ORDER BY AverageDaysBetweenOrderAndShip ASC