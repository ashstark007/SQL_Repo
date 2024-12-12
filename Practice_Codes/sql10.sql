-- pattern matching and like operators
use company_info;
create table employees (eid int,fname varchar(20),lname varchar(20),dept varchar(20),PF int,HRA float);
insert into employees values(101,'Aishwarya','Ravindran','Training',2000,5000),
							(102,'Akhil','Kumar','sales',3000,6000),
							(103,'Abhishek','Ravindran','Training',4000,5000),
							(104,'Akash','Kumar','sales',2500,6500),
							(105,'Rahul','R','ops',1800,4000);
desc employees;
select * from employees;
        
-- total salary
select PF,HRA,PF+HRA as total_salary,((PF+HRA)*12) as annual_salary from employees; 

-- Distinct 
-- display only unique records
select distinct(dept) from employees;

-- aggregate functions : the functions which returns only single values
-- count,sum,avg,max,min

-- COUNT:
-- **********
-- show the count of unique departments
select count(distinct(dept)) from employees;

-- SHOW THE SUM OF HRA
select sum(HRA) from employees;

-- SHOW THE average OF HRA
select avg(HRA) from employees;

-- SHOW THE maximum OF HRA
select max(HRA) from employees;

-- SHOW THE minimum OF HRA
select min(HRA) from employees;

-- Pattern Matching
-- Wildcards (%,_) and like operators

-- show the employee records whose name starts with R
select * from employees where fname like "R%"; -- % means after R it can have n number of characters

-- show the employee records whose firstname starts with A or belongs to dept which ends with s
select * from employees where fname like "r%" or dept like "%s";

-- show the records where dept name have a in between
select * from employees where dept like "%a%";

-- show the employee records whose lastname starts with R and whose salay is more than 4000
select * from employees where lname like "r%" and PF>=4000;

-- show the employee record whosse fname starts with r and ends with l with exactly 5 characters
-- underscore means fixed length of characters

select * from employees where fname like "r___l";

-- display the maximum and min hra amount
select max(HRA) from employees;
select min(HRA) from employees;

-- add new column as total_salary
alter table employees add total_salary int;

-- update the total_salary as hra +pf
update employees set total_salary=HRA+PF;
select * from employees;

-- chnage the table name as EmpInfo
alter table employees rename EmpInfo;
select * from EmpInfo;

-- show the fname,lname whose salary is morevthan average salary
select fname,lname,total_salary from EmpInfo
 where total_salary>(select avg(total_salary) from EmpInfo);