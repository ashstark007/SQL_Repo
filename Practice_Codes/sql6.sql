-- DML DATA MANIPULATION LANGUAGE
-- INSERT UPDATE DELETE
SELECT * FROM employee;

-- SAFE MODE DISABLE
set SQL_SAFE_UPDATES=0;

-- TO CHANGE THE SALARY OF EMPLOYEE ABHI TO 7000
update employee 
set salary=7000 
where empid=104;

-- TO DELETE EMPLOYEE AKSHY
delete from employee; -- it will remove all data

delete from employee where empid=105; -- it will remove only records which match the condition given in where clause
select * from employee;

truncate  employee; -- removes entire values from table while maintaining the structure of the tablecustomer_infocid
desc employee;
drop table employee;
