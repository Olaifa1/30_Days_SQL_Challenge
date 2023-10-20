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



/**
QUESTION 1:
Using the Movie Data, write a query to show the  original_titles released in 2017 whose vote_count is more than 15 and  runtime  is more than 100.
**/

SELECT m.original_title
FROM [Movie ID] AS m
INNER JOIN [Release Date] AS rd ON m.MovieID = rd.MovieID
INNER JOIN [Runtime] AS rt ON m.MovieID = rt.MovieID
WHERE YEAR(rd.release_date) = 2017
  AND m.vote_count > 15
  AND rt.runtime > 100;

----
 /**
 In this query:

I join the "Movie ID" table with the "Release Date" table using INNER JOIN and match records on the "MovieID" column.
I join the result of the first join with the "Runtime" table using INNER JOIN and match records again on the "MovieID" column.
The WHERE clause filters the results to include only movies released in 2017 (using YEAR(rd.release_date) = 2017), 
with a vote count greater than 15 (using m.vote_count > 15), and a runtime greater than 100 (using rt.runtime > 100).
This query then returns the original titles of movies that meet all of these criteria.
**/