USE EMPLOYEE

/**
DAY 29 (QUESTION 21):
Using the employee Dataset, please write a query to show the job title and department with the highest salary.
**/

SELECT DISTINCT job_title, department
FROM Employee
WHERE salary = (SELECT MAX(salary) FROM Employee);
