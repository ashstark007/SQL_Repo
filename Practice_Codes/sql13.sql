-- create table emplyee with fields eid,fname,lname,salary,joiningdate,dept gender

use aishwarya;
create table employee(eid int,fname varchar(20),lname varchar(20),salary int,jdate date,dept varchar(20),gender varchar(10));

-- insert any 6 records
insert into employee values (101,'Aishwarya','ravindran',5000,'2012-02-05','training','f'),
							(102,'Akhil','kumar',7000,'2019-05-15','training','m'),
							(103,'Abhishek','ravindran',6500,'2017-01-20','sales','m'),
							(104,'vikas','raj',2500,'2020-09-05','ops','m'),
							(105,'sam','sathe',5000,'2018-03-24','sales','m'),
							(106,'emma','watson',7000,'2020-02-19','ops','f');

-- write a query to get fnameand lname in uppercase
select upper(fname) as first_name,upper(lname) as lastname from employee;

-- write a query to combine fnsme snd lnsme and display it as full_name
select concat(fname,' ',lname) as full_name from employee;

-- select employee details whose name is vikas
select * from employee where fname ='vikas';

-- get employeedetails whose name starts with a 
select * from employee where fname like 'a%';

-- get employees details whose lastname contains k
select * from employee where fname like '%k%';
-- get employees whose dept starts with s and lastname ends on n
select * from employee where dept like 's%' and lname like '%n';

-- get the highest and lowest salary
select max(salary) as maximum_salary ,min(salary) as minimum_salary from employee;

-- get all unique dept names
select distinct(dept) from employee;

-- show the joining date in the form of dd-mmm-yy 15 march 2024
SELECT JDATE,DATE_FORMAT(JDATE,'%d %M %Y') FROM EMPLOYEE;

-- show the fname and years of experience of employee
select fname,timestampdiff(YEAR,jdate,curdate())as exp from employee;


-- get employee details who has joined in the month of june
select * from employee where month(jdate)=05;