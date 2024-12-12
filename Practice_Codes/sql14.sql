-- order by getting used for sorting data either ascending or descending order
-- group by getting used to combine data on the basis of columns
show tables;
use aishwarya;
select * from employee;
-- show the emp record in asc order of employee fname
select * from employee order by fname; -- by default its ascending

-- show the emp records with highest salary first
select * from employee order by salary desc;

-- show fname lname dept in sorted order according to emp department
select eid,fname,lname,dept from employee order by 4; -- 4 means position of dept in selection list instead of column name

-- show the records of emp whose salary is highest
select * from employee order by salary desc limit 1;

-- show the records of employee whose salary is second highest
select * from employee order by salary desc limit 1 offset 2; -- offset 1 will leave 1st row and start from 2nd row

-- show the records of emp  as per salary desc order where dept name is training
select * from employee where dept ='training'order by salary desc;

-- show the maximum total_salary as per dept
select dept,max(salary) from employee group by dept;
select dept,min(salary) from employee group by dept;
select dept,avg(salary) from employee group by dept;
select fname,max(salary) from employee group by fname;
select fname,max(salary),dept from employee group by fname,dept;

-- show the count of employees in each dept
select dept,count(*) as total_emp -- count(*) will give all unique value 
from employee
group by dept;

select dept,count(eid) as total_emp
from employee
group by dept;

select dept,count(dept) as total_emp
from employee
group by dept;

-- having clause
-- show the records according to dept whre emp count is 2
select dept,count(eid) as total_emp
from employee
group by dept
having total_emp=2;

select dept,count(eid) as total_emp
from employee
group by dept
having count(dept)=2;

-- show the min salary according to dept ans sort it in asc order of min salary
select dept,min(salary) as minimum_salary from employee 
group by dept
order by minimum_salary;

-- constraints - rules applied when inserting the record in the column
-- constraints to be added while we are defining the table structure
-- certain constraints can be added with the help of alter after creating the table structure.
-- 1. Unique -- it will not allow to add duplicate values in the column
-- 2 Not Null -- it will not allow to keep blank values in column
-- primary key is a combination of notnull and unique
-- 3 check - it will allow to insert onltyrthe records which will satisfy the check condition
-- 4 default -by using this constraint the null or blank values of the column gets replaced by the value provided in default constraint.



desc employee;
insert into employee(eid,fname,lname,salary,dept,gender) values(106,"manish","kumar",4656,"ops","M");
select * from employee;

create table cust_info(custid int unique,cname varchar(20) not null,orderid int,pname varchar(20));
desc cust_info;

insert into cust_info(custid,cname,orderid,pname) values(201,'Yash',101,'laptop');
select * from cust_info;
insert into cust_info(custid,cname,orderid,pname) values(201,'Reshma',101,'Mouse'); -- errror cause cid is not unique values
insert into cust_info(custid,cname,orderid,pname) values(202,'Reshma',101,'Mouse');
insert into cust_info(custid,orderid,pname) values(203,101,'Mouse');
insert into cust_info(custid,cname,orderid,pname) values(203,'Mayuri',103,'Desktop');
insert into cust_info(custid,cname,orderid) values(204,'Mayuri',103);
select * from cust_info;

-- check constraint
create table if not exists bookmaster(bookid int not null unique,
									 book_name varchar(20) not null,
                                     price int check(price>0),
                                     pages int check(pages>0));
desc bookmaster;
insert into bookmaster values(1,'abc',0,1); -- error
insert into bookmaster values(1,'abc',102,10);-- run
insert into bookmaster values(1,'abc',110,0);-- error
insert into bookmaster values(1,'abc',102,12);-- duplicate entry
insert into bookmaster values(2,'abc',102,12);-- run
select * from bookmaster;

-- check constraint with IN keyword and like operator

drop table bookmaster;
create  table if not exists publisher  (pid  int not null unique,
										pname varchar(20) not null,
                                        city varchar(20),
                                        country varchar(30) check (country in('USA','UK','INDIA'))
                                        );
desc publisher;
insert into publisher values(1,'XYZ','mumbai','Japan');
insert into publisher values(1,'XYZ','mumbai','USA');

alter table publisher drop column pdate;

insert into publisher values(2,'XYZ','mumbai','india');
insert into publisher values(3,'XYZ','mumbai','uk');
select * from publisher;

create table newpublisher(pubid int default 00,
						 pubname varchar(20) default "Not Available",
                         country varchar(20) default "India",
                         city varchar(20),
                         check ((Country='India' and city='Pune') or(Country='India' and city='Mumbai'))
						 );
desc newpublisher;
insert into newpublisher(city) values('Delhi'); -- error
insert into newpublisher(country,city) values('usa','Pune'); -- error
insert into newpublisher(city) values('Pune');-- run
insert into newpublisher(country,city) values('India','Mumbai');
select * from newpublisher;
insert into newpublisher(pubid,pubname,country,city) values(1,'ABC','India','Mumbai');

-- 1 create table author with fields as authorid which will have only unique and not null values
-- author name not null 
-- country if user don't specify  then default value is "No Country specified"
-- age must be in between 20 to 60
-- book_type which should start with edu-
-- insert any 5 records
-- add new column as ratings which must be in the range of 1 to 10

create table author(authorid int not null unique,
					aname varchar(20) not null,
                    country varchar(20) default "No Country Specified",
                    age int check(age between 20 and 60),
                    book_type varchar(20) check(book_type like 'edu%')); 
insert into author(authorid,aname,age,book_type) values(1,"ABC",21,"educational");
insert into author(authorid,aname,country,age,book_type) values(2,"xyz",'India',21,"educational");
insert into author(authorid,aname,country,age,book_type) values(3,"wxy",'usa',59,"educational");
insert into author(authorid,aname,country,age,book_type) values(4,"rfg",'india',60,"educational");
insert into author(authorid,aname,age,book_type) values(5,"bhi",55,"educational");
insert into author(authorid,aname,age,book_type) values(6,"sdf",55,"fiction");
select * from author;
alter table author add column ratings int check(ratings between 1 and 10);

desc author;
update author set ratings=5 ;
select * from author;