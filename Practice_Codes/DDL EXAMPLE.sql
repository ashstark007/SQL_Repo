use aishwarya;
use company_info;
create table if not exists employee_info(empid int,ename char(255),edept char(255),email varchar(255),ephone bigint);
create table if not exists emp_info(empid int,ename char(255),edept char(255),email varchar(255),ephone bigint);
show tables;
desc emp_info;
select * from employee_info;
select ename from employee_info;
select ename,edept from employee_info;

-- show emplyee name and salary of only ece dept

select ename,email from employee_info where edept='ece';

select * from product_info;

-- PRICE BETWEEN 45000 and 90000

select * from product_info where pprice between 45000 and 90000;


