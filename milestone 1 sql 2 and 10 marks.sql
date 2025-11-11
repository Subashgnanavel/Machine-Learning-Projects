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