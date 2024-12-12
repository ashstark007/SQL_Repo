show tables;
desc employee;
-- add constraint primary key on column eid
-- alter table tablename add constraint primarykeyname primary key(eid);
alter table employee
add constraint pk_eid
primary key(eid);

select * from employee;
delete from employee where fname='manish';

-- add check constraint on salary column allowing values in between 1000 and 7000 only
alter table employee 
add constraint checkcsalary
check(salary >=1000 and salary<=7000);

-- add unique constraint on jdate
alter table employee
add constraint unidate
unique(jdate);

-- add default value for dept as 'NA'
alter table employee 
alter dept set default "NA";
desc employee;

-- add not  null constraint on frstname column
alter table employee 
add constraint notnull
not null(fname); -- we cannot add not null constraint by using alter table command and add constraint

alter table employee 
modify fname  varchar(20) not null; -- we have to use modify command to add not null constraint
desc employee;

create table dept (deptid int,eid int,deptname varchar(20));
-- add constraint foreign key on eid field of dept

alter table dept 
add constraint fk
foreign key (eid) references employee(eid);

-- drop constraint

desc dept;
alter table dept drop constraint fk; -- drop foreign key
alter table employee drop constraint checkcsalary;-- drop check constraint
alter table employee drop constraint  unidate;-- drop unique
alter table employee drop  primary key; -- drop primary key
alter table employee modify dept varchar(20); -- drop not null
alter table employee alter column dept  drop default; -- drop constraint default
alter table employee modify eid int; 