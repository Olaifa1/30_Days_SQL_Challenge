CREATE DATABASE EMPLOYEE


use EMPLOYEE

Select *
from employee


/**
QUESTION 16 (DAY 22):
Using the Employee Table dataset, write an SSMS query to show all the employees first name and last name and their respective salaries. 
Also, show the overall average salary of the company 
and calculate the difference between  each employee's salary and the company average salary.
**/

SELECT
    first_name, last_name,salary,
    AVG(salary) OVER () AS Company_Average,
    salary - AVG(salary) OVER () AS salary_difference
FROM Employee;




/**
In this query:

We select the first_name, last_name, and salary columns from the Employee table.
We use the AVG function with the OVER () window frame to calculate the average salary of the entire company. 
The OVER () clause indicates that the average is computed over all rows in the result set.
We calculate the difference between each employee's salary 
and the average salary of the company by subtracting the average salary from the employee's salary.
Running this query in SSMS will give you a result set with the first name, last name, salary, average salary of the company, and the salary difference for each employee.

**/


