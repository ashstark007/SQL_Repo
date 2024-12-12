use company_info;
select * from products;

create table if not exists emp_info(empid int,empname char(20),dept char(10),salary int,age int,city char(15)); 

insert into emp_info values (101,'Rekha','Training',7000,34, 'Navi Mumbai'),
							(102,'Ranjita','Hr',5000,23, 'Thane'),
                            (103,'Pooja','Operations',4000.23,26, 'Panvel'),
                            (104,'Pallavi','Training',8000,34, 'Navi Mumbai');

-- relational operators
-- ***********************

-- =,>,<,>=,<=,<>,!=

-- display records of employee whose city is thane
select * from emp_info where city='Thane';

-- display records of employees whose salary is greater than or equal to 5000
select * from emp_info where salary>=5000;

-- display records of employee whose city is not navi mumbai
select * from emp_info where city!='Navi Mumbai';
select * from emp_info where city<>'Navi Mumbai';

-- LOGICAL OPERATORS
-- ************************

-- AND,OR,NOT

-- 1. show the records of employee whose salary is greater than 5000 and who lives in city navi mumbai
-- (AND all the conditions must be true to get the output)
select * from emp_info where salary>5000 and city ='Navi Mumbai';

-- 2. show the records of employee whose salary is greter than 10000 or who belongs to city navi mumabi
-- (OR atleast one of the conditions must be true)
select * from emp_info where salary>10000 or city ='Navi Mumbai' or empid=110;

-- 3. show the records of employees whose city is other than thane
select * from emp_info where not city='Thane';

-- ARITHMETIC OPERATORS
-- ***************************

-- +,-,*,/,//->FLOOR DIVISION,%->MODULUS DIVISION
-- show annual salary of employee
select empname,salary*12 as annual_salary from emp_info ; -- as is called alise

-- show the age of employee before 10yrs
select  empname,age-10 as emp_age from emp_info;

-- show the remaining years of service till retirement
select empname,age as current_age,60-age as remaining_years from emp_info;

-- show the hike amount after 30% increment
select empname, salary,salary*0.3 as hike_amount from emp_info;

-- show the final salary after 30percent hike
select empname,
		salary as current_salary,
		salary*0.3 as hike_amount, 
		salary+(salary*0.3) as final_salary,
		salary*12 as annual_salary
        from emp_info;

