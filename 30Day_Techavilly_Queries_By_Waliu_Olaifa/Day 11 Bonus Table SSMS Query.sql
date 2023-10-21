create database BonusTable


use BonusTable;

select *
from INFORMATION_SCHEMA.COLUMNS

/**
As we conclude the analysis for the Briggs Company, 
they got some reviews on their website regarding their new product. 
Please use the Bonus table to write a query that returns only the meaningful reviews. 
These are reviews that are readable in English. There are two columns in the table, 
let your output return only the review column
**/
Select *
FROM [Bonus-Table]

SELECT Review
FROM [Bonus-Table]
Where translation IS NULL;