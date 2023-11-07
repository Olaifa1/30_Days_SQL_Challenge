/**
DAY 30 QUESTION 22:
Using the employee Dataset, please write a query to determine the rank of employees based on their salaries in each department. For each department, 
find the employee(s) with the highest salary and rank them in Desc order.
**/
USE EMPLOYEE;
WITH DepartmentSalaries AS (
    SELECT
        department,
        first_name,
        last_name,
        salary,
        DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS department_salary_rank
    FROM
        Employee
)

SELECT
    first_name,
    last_name,
    department,
    salary,
    department_salary_rank
FROM
    DepartmentSalaries
ORDER BY
    department,
    department_salary_rank;
