-- 1. Creating a database and table
create database Students;
use Students;
create table Students (
    id int primary key,
    name varchar(50),
    marks int
);

-- 2. Insert 
insert into Students (id, name, marks)
values (1, 'Rahul', 85);

-- 3. Update marks 
update Students
set marks = 90
where id = 1;

-- 4.greater than 75
select * from Students
where marks > 75;

-- 5.average marks
select avg(marks) as average_marks
from Students;

-- 6.second highest mark
select max(marks) as second_highest
from Students
where marks < (select max(marks) from Students);

 -- 7.current date and time 
 select now() as current_datetime;
 
 -- 9.marks greater than 80
 select * from Students
 where marks > 80;
 

