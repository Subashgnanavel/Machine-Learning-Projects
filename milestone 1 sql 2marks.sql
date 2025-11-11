-- 1. DDL vs DML:			
Data Definition Language :  it defines the structure. example: create table Students 				
Data Manipulation Language :  it manages the data. example: insert into Students values		
			
-- 2. Second Highest Salary:			
select max(salary) 			
from employees 			
where salary < (select max(salary) from employees);			
			
-- 3. inner join vs left join:			
inner join : Returns only matching rows.						
left join : Returns all rows from left table + matches from right.			
select s.stu_name, d.dept_name 			
from student s 			
inner join departments d on s.dept_id = d.dept_id;			
			
-- 4. trigger in mysql:			
trigger =  the code executed automatically on events.			
Example: adding student name as attendance
						
--5. Normalization:						
Process of reducing redundancy.						
Example: storing the student name in the department as they have a roll number repeately. 

10 marks
create database employee;
  use employee;
  
create table employee (emp_id int primary key,emp_name varchar(50),dept_id int,salary int,hire_date date);
insert into employee (emp_id, emp_name, dept_id, salary, hire_date) values (101, 'John', 1, 50000, '2018-05-12'),(102, 'Amit', 2, 65000, '2017-03-20'),(103, 'Sara', 2, 72000, '2019-08-15'),(104, 'Lina', 3, 48000, '2020-01-10'),(105, 'Raj', 4, 55000, '2016-09-25'),(106, 'Emma', 1, 60000, '2015-11-02');

create table attendance (att_id int primary key,emp_id int not null,att_date date not null,status varchar(10) check (status in ('Present', 'Absent')));
insert into  attendance (att_id, emp_id, att_date, status) values (1, 101, '2025-09-01', 'Present'),(2, 102, '2025-09-01', 'Absent'),(3, 103, '2025-09-01', 'Present'),(4, 104, '2025-09-01', 'Present'),(5, 105, '2025-09-01', 'Present'),(6, 106, '2025-09-01', 'Present');

-- a) Write a DDL command to create the departments table with dept_id as Primary Key and dept_name as NOT NULL.
create table department (dept_id int primary key,dept_name varchar(50) not null);

-- b) Insert two sample records into the departments table (e.g., Sales, IT).
insert into department (dept_id, dept_name) values(1, 'Sales'),(2, 'IT'),(3, 'HR'),(4, 'Finance');

-- c) Write a query to display the employee name and department name using a JOIN between employees and departments.
select * from employee inner join department using (dept_id);

-- d)Write a query to find the highest salary using an aggregate function.
select max(salary) from employee;
 
 -- e) Write a subquery to fetch the employees who earn more than the average salary.
select  emp_id, emp_name, salary from employees where salary > (select avg(salary) from employees);

-- f) Create a view named emp_salary_view to display emp_name, dept_name, salary.
create view emp_salary_view as select e.emp_name,d.dept_name,e.salary from employees e join  departments d on e.dept_id = d.dept_id;

-- g) Write a stored procedure named GetDeptEmployees that accepts a dept_id and returns all employee names in that department.
delimiter //
create procedure getdeptemployees(in input_dept_id int)
begin
    select emp_name
    from employees
    where dept_id = input_dept_id;
end //
delimiter ;
 
 -- h) Write a user-defined function YearWorked(hire_date) that calculates the number of years an employee has worked in the company.
 delimiter //
create function yearworked(hire_date date)
returns int
deterministic
begin
    declare years_worked int;
    set years_worked = year(curdate()) - year(hire_date);
    return years_worked;
end //
delimiter ;

 -- j) Write a query using string function to display employee names in uppercase.
select upper(emp_name) as emp_name_upper from employees;