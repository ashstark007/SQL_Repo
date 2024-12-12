-- create table customers (cid ,cname,pname,quantity ,price)
create table customer(cid int,cname varchar(50),pname varchar(50),quantity int,price int);

-- insert unique 5 values
insert into customer values (1,'Ash','mobile',50,4000),
							(2,'appu','mobile',10,3000),
							(3,'akku','laptop',20,7000),
							(4,'abhi','tv',15,8000),
							(5,'sam','laptop',25,9000);

-- add new column as city varchar(20)
alter table customer add city varchar(20);
select * from customer;

-- change cname to cust_name
alter table customer rename column cname to cust_name;

-- update city of all customers as thane
update customer set city='thane';

-- display the pname where quantity is greater than 5 and less than 10
select pname from customer where quantity>5 and quantity<10;

-- display customer id and name who have purchased product with more than 20 quantity
select cid,cust_name from customer where quantity>20;

-- show the total price of all products
select price,quantity , price *quantity as total_price from customer;

-- add discount of 10% for each product
select pname,price,price*0.1 as discount_price from customer;

-- show pname,original price discounted price 10%
  select pname,price,price+price*0.1 as discount_price from customer;