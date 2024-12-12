-- primary key and foreign key
use aishwarya;
create table professor(id int primary key,
					   pname varchar(25),
                       salary int);
create table courses(cid int primary key,
					 pid int,
                     cname varchar(20),
                     foreign key(pid) references professor(id)
                     on delete cascade
                     on update cascade
                     ); -- table which it is dependent on
desc professor;
desc courses;
insert into professor values (101,'Rekha',10000),
							 (102,'Aishwarya',20000),
							 (103,'raymond',30000),
							 (104,'Varsha',40000);
insert into courses values(1,101,'DSDA'),
						  (2,101,'Data science'),
                          (3,103,'FSD'),
                          (4,102,'Python');
                          
-- display professor name and course taught by them
select cname,pname from professor,Courses where id=pid;

select cname,pname 
from professor,courses
where professor.id=courses.pid;

select c.cname,p.pname 
from professor p,courses c
where p.id=c.pid;

-- remove or delete professor varsha from the records

-- after setting cascade delete the records which are dependent on pk will be deleted fk also
delete from professor where pname='raymond'; -- it will raise error as in courses we have records dependent on this value 
select * from professor;

-- update the records of raymond and set the new salary
update professor set salary=4546 where pname='raymond';

-- update the pid of raymond to 110
update professor set id=110 where id=102;

drop table courses;
drop table professor;
select * from courses;
