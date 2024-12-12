use aishwarya;

-- self join -- we have to fetch the record from same table
-- ----------------
create table emp_data (empid int primary key,ename varchar(20),mgnrid int);
insert into emp_data values (1,'Rahul',3),
							(2,'zain',3),
                            (3,'Raman',4),
                            (4,'vaibhav',5),
                            (5,'aman',Null);
select * from emp_data;

select e.ename as employee,m.ename as manager
from emp_data e
join
emp_data m
on e.mgnrid=m.empid;

-- ***********************************************************************************************
use company_info;

select * from empinfo;
create table project(pid int,empid int,pname varchar(20));
insert into project values  (1,101,"CLP"),
							(2,101,"GRS"),
							(3,104,"Track Task"),
							(4,103,"HR management"),
							(5,103,"DDS");
select * from project;

-- get empname projectname order by emp name for those employee who have assigned project
select e.fname,p.pname as Project
from empinfo e
join project p
on e.eid =p.empid
order by e.fname;

-- get empname projectname order by emp name for those employee even they havent assigned any project yet
select e.fname,p.pname as Project
from empinfo e
left join project p
on e.eid =p.empid
order by e.fname;

-- get empname projectname order by emp name of employees who are not working on any project and display it as 'No project assigned'
select e.fname,ifnull(p.pname, 'No project assigned')
from empinfo e
left  join project p
on e.eid=p.empid
where p.pname is Null
order by e.fname;

-- write query to get ename and project who are working on more than one project

select e.eid,e.fname,p.pname
from empinfo e
join project p
on e.eid=p.empid
where e.eid in(select count(p.empid) from project p group by p.empid having count(*)>1);
