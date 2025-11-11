create database Students;
use Students;

create table Department (
    dept_id int primary key,
    dept_name varchar(50)
);


create table Students (
    student_id int primary key,
    name varchar(50),
    dept_id int,
    marks int,
    foreign key (dept_id) references Department(dept_id)
);

 
insert into Department (dept_id, dept_name) values
(101, 'Computer Sci'),
(102, 'IT'),
(103, 'ECE');

insert into Students (student_id, name, dept_id, marks) values
(1, 'Rahul', 101, 85),
(2, 'Priya', 102, 92),
(3, 'Karthik', 101, 76),
(4, 'Meena', 103, 88);

-- 1.aggregate function
select d.dept_name, avg(s.marks) as avg_marks
from Students s
join Department d on s.dept_id = d.dept_id
group by d.dept_name;

-- 2.join
select s.name as student_name, d.dept_name
from Students s
join Department d on s.dept_id = d.dept_id;

-- 3.subquery
select name, marks
from Students
where marks > (select avg(marks) from Students);

