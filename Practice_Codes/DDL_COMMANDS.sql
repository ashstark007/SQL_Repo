-- DDL COMMANDS - DATA DEFINITION LANGUAGE
-- ******************************************

-- create,alter,drop,truncate
-- ****************************************************************************************

create database aishwarya; -- create new databse

use aishwarya; -- use database

create table student_info(Rollno int); -- create table

drop table student_info; -- delete table

create table student_info(Rollno int,Sname char(20),Phone bigint);

desc student_info; -- describe table

show databases; -- list out all databases in the system

show tables; -- list out all the tables in currently used database

insert into student_info values(1,'Ash',45564654); -- insert all values

select * from student_info; -- show all values in table

insert into student_info values(2,'Appu',2111212);
select * from student_info;

-- ****************************************************************************

create database employee;
use employee;
create database company_info;
use company_info;
create table employee_info(empid int,ename char(255),edept char(255),email varchar(255),ephone bigint);
insert into employee_info values(101,'aishwarya','ece','aishwarya@gh.com',56556546),
(102,'appu','ce','appu@gmail.com',4555466),
(103,'akku','ee','akku@gmail.com',478788),
(104,'abhi','ae','abhi@gmail.com',5321315),
(105,'ray','cs','ray@gmail.com',23233); -- insert multiple valuesinto table
select * from employee_info;

-- ********************************************************************************
use company_info;
create table product_info (pid int,pname varchar(255),pcategory varchar(255),pprice bigint,pquantity bigint);
insert into product_info values(1,'oneplus','mobile',45556,1),
(2,'iphone','mobile',5562,5),
(3,'asus','laptop',87542,2),
(4,'hp','laptop',13323,1),
(5,'dell','laptop',122133,6),
(6,'boat headphone','accesseries',1213,1),
(7,'airpod','accesseries',21212,5),
(8,'book','stationary',211,25),
(9,'pen','stationary',50,6),
(10,'iball','mouse',1232,1);
show tables;
desc product_info;

select * from product_info;

-- ********************************************************************************************

create table customer_info (cid int,cname varchar(255),cemail varchar(255),cphone bigint,caddress varchar(255));
show tables;
insert into customer_info values(1,'ash','ash@h.com',546654654,'sector1'),
(2,'appu','appu@g.com',53165656,'sector2'),
(3,'akku','akku@g.com',234354634,'sector3'),
(4,'abhi','abhi@g.com',43565434,'sector4'),
(5,'ray','ray@h,com',647676746,'sector5'),
(6,'akshy','akshy@g.com',32556565,'sector6'),
(7,'sam','samg@.com',4676578,'sector7'),
(8,'roy','roy@g.com',436677876,'sector8'),
(9,'emma','emma@g.com',324355464,'sector9'),
(10,'mon','mon@g.com',435465656,'sector10');
select * from customer_info;

