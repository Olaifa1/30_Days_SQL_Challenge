create database Superstore;

Use Superstore;


Select *
from Orders;

Select *
from People;

Select *
from Returns;

Select *
from INFORMATION_SCHEMA.COLUMNS;


/**
Using table Orders, the Briggs company wants to ship some of their products 
to customers in selected cities but they want to know the average days 
it will take to deliver those items to Dallas, Los Angeles, Seattle and Madison. 
Write an SSMS query to show  the average delivery days to those cities. 
Only show the City and Average delivery days column in your output.
**/
SELECT City, AVG(DATEDIFF(day, Order_Date, Ship_Date)) AS AverageDeliveryDays
FROM Orders
WHERE City IN ('Dallas', 'Los Angeles', 'Seattle', 'Madison')
GROUP BY City;

/**
In this query:

We select the "City" column and calculate the average delivery days using the DATEDIFF function, 
which calculates the number of days between the "Order_Date" and "Ship_Date" columns.

We use the WHERE clause to filter the results to include only rows 
where the "City" is one of the specified cities: 'Dallas', 'Los Angeles', 'Seattle', or 'Madison'.

We use GROUP BY to group the results by the "City," so you get the average delivery days for each of the specified cities.

The output of this query will show two columns: "City" and "AverageDeliveryDays," 
displaying the average delivery days for each of the selected cities.
**/