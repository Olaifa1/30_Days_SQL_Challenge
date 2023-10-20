create database [Movie Data];


use [Movie Data];

-- Find out all the tables in the database in use named [Movie Data]
select *
from INFORMATION_SCHEMA.TABLES

select *
from INFORMATION_SCHEMA.COLUMNS

NOTE I USED THE IMPORT FLAT FILE WIZARD METHOD TO IMPORT ALL TEXT FILES INTO THE [Movie Data] DATABASE
-- Using the The Import Flat File Wizard method
/**
After creating the database [Movie Data],
Convert the .csv file to TEXT(TAB Delimited) (*.txt) file with tab as delimiter
Right click the database [Movie Data]
A dropdown menu shows up
Click on "Task"
Click on Import flat file
Click the browse button to Browse the path of the file and click on the file
Where "DBNull.value cannot take null" error comes up,either you check your "null" box 
or if you don't want to have null value in your table, 
go back to your excel and do a proper normalization/seperation of  the tables 
till you successfully remoce all null values from your table.
Where "string" error, comes up, more often, 
the datatype used is smaller than one of the values in the table, 
change datatype with a bogger one. E.g from "tinyint" to Bigint or int.
**/
select *
from [Movie ID]


select *
from Genres

select *
from [Release Date]


select *
from Runtime

METHOD 1:
--A query showing the maximum budget spent on a movie with
select max(budget)
from [Movie ID]


/** 
Since 175000000 is the maximum budget spent on a movie. 
Then here is a query showing the ID, name and budget of the movie with the highest budget.
**/

select MovieID, original_title, budget
from [Movie ID]
where budget = 175000000


METHOD 2:
/**
In this query:
We use a subquery to find the maximum budget from the "[Movie ID]" table.
The WHERE clause filters the result to only include rows where the "budget" matches the maximum budget found in the subquery.
The SELECT statement retrieves the "original_title" and "budget" for the movie with the maximum budget.
This query will give you the "original_title" of the movie with the highest budget in the "[Movie ID]" table.
**/
SELECT original_title, budget
FROM [Movie ID]
WHERE budget = (
    SELECT MAX(budget) FROM [Movie ID]
);


/**
QUESTION 4:
Using the Movie Data, write a query to show the top 10 movie titles
whose language is English or French and the budget is more than 1,000,000.
**/
SELECT TOP 10 title, original_language, budget
FROM [Movie ID]
WHERE (original_language = 'en' OR original_language = 'fr')
  AND budget > 1000000
ORDER BY budget DESC;
