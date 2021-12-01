## What is the difference between where and having clause?
### Where

WHERE Clause is used to filter the records from the table or used while joining more than one table.Only those records will be extracted who are satisfying the specified condition in WHERE clause. It can be used with SELECT, UPDATE, DELETE statements.

Syntax:
***
SELECT S_Name, Age FROM Student 
WHERE Age >=18
***

### Having
HAVING Clause is used to filter the records from the groups based on the given condition in the HAVING Clause. Those groups who will satisfy the given condition will appear in the final result. HAVING Clause can only be used with SELECT statement. 

Syntax:
***
SELECT Age, COUNT(Roll_No) AS No_of_Students 
FROM Student GROUP BY Age
HAVING COUNT(Roll_No) > 1 
***


## What is the need for group functions in SQL?

Group functions are built-in SQL functions that operate on groups of rows and return one value for the entire group. These functions are: 
- ### COUNT
This function returns the number of rows in the table that satisfies the condition specified in the WHERE condition.
For Example: If you want the number of employees in a particular department, the query would be:

***
  SELECT COUNT (*) FROM employee
  WHERE dept = 'Electronics';
***
- ### MAX
This function is used to get the maximum value from a column.

To get the maximum salary drawn by an employee, the query would be:
***
SELECT MAX (salary) FROM employee;
***

- ### MIN
This function is used to get the minimum value from a column.

To get the minimum salary drawn by an employee, he query would be:
***
SELECT MIN (salary) FROM employee;
***
- ### AVG
This function is used to get the average value of a numeric column.

To get the average salary, the query would be
***
SELECT AVG (salary) FROM employee;
***
- ### SUM
This function is used to get the sum of a numeric column

To get the total salary given out to the employees,

SELECT SUM (salary) FROM employee;
- ### DISTINCT
This function is used to select the distinct rows.

For Example: If you want to select all distinct department names from employee table, the query would be:
***
SELECT DISTINCT dept FROM employee;
***
To get the count of employees with unique name, the query would be:

SELECT COUNT (DISTINCT name) FROM employee;
