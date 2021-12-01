CREATE DATABASE Employees;

CREATE TABLE employee_table
(
    id INT PRIMARY KEY IDENTITY (1, 1),
    name VARCHAR(50),
    salary INT
)

INSERT INTO employee_table
    (name, salary)
VALUES
    ('Guantai', 250000),
    ('John', 350000),
    ('Doe', 150000),
    ('Jane', 50000),
    ('Smith', 220000),
    ('Curtis', 450000);

select min(salary)salary
from employee_table
where salary in 
(select top 3
    salary
from employee_table
ORDER BY salary desc);

select *
from employee_table;

select *
from employee_table e left join sales s on s.employee_id = e.id
where sales_amount=null;