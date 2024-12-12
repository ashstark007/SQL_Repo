USE company_info;
show tables;
select * from emp_info;

-- DDL COMMAND
-- *************************

-- add new column to emp_info
alter table emp_info add manager char(50);
desc emp_info;

-- change dattype of existing column
alter table emp_info modify ename varchar(20);
desc emp_info;

-- change dept colnmae to new name as DEPT
alter table emp_info rename column edept to DEPT;
desc emp_info;

-- change table name to new table name
alter table emp_info rename Employee;
show tables;
desc Employee;

-- delete single column 
alter table employee drop DEPT;
desc Employee;

-- to delete multiple columns 
alter table employee drop city,
					drop manager;
desc Employee;
alter table employee drop column age; -- column is optionalproduct_info
