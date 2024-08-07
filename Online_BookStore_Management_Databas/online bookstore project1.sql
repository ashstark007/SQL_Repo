create database onlinebooks;
use onlinebooks;

create table books (ISBN varchar(50),title varchar(100), author varchar(100),publisher_id int, genre varchar(60), price int);

drop table books;

alter table books
add constraint pk_ISBN
primary key(isbn) ;

alter table books
add constraint fk_pb
foreign key(publisher_id) references publisher(publisherid)
;
select * from books;

SELECT *
FROM books
WHERE publisher_id NOT IN (SELECT publisherid FROM publisher);

DELETE FROM books
WHERE title IS NULL OR author IS NULL;

alter table books modify column author varchar(200);
 drop table books;
 desc books;
 truncate table books;
 
 alter table books add column stock varchar(20);
 update books set stock='available';
 update books set stock='out of stock' where publisher_id=104;
 
insert into books values('978-0-321-94786-4','Learning Mobile App Development','Jakob Iversen',101,'technology',1500),
						('978-0-321-94786-5','It technology','James anderson',102,'technology',1520),
                        ('978-0-321-94786-6','Medicine Inventory','Jhimmy shergil',103,'paramedical',1050),
                        ('978-0-321-94786-7','Hospital Administration','Atish Jhangania',104,'medical',1560),
                        ('978-0-321-94786-8','Nursing procedure','David Lob',105,'Nursing council',1600),
                        ('978-0-321-94786-9','Agriculture farming','Arther Jason',106,'Agribusiness',1630),
                        ('978-0-321-94786-10','Architecture engineering','Jakob Backhum',105,'engineering',1690),
                        ('978-0-321-94786-11','Operation System','Dr Shruti Nagar',105,'HR analyctics',1700),
                        ('978-0-321-94786-12','Sapeins','Jonty Rodes',104,'noble',1800),
                        ('978-0-321-94786-13','Bio statistics','Pearson colon',106,'Statictics',1900);
select * from books;
create table customers (customer_id int, name varchar (20), address varchar (20), email varchar(15));

create table orders(order_id int, customer_id int,order_date date, status varchar(60), total_amount int);

insert into orders values(401,1,'2022-05-04','pending',3000),
						(402,2,'2021-06-10','paid',2500),
                        (403,3,'2020-03-12','paid',5000),
                        (404,4,'2019-05-02','pending',3500),
                        (405,5,'2023-10-21','paid',6000),
                        (406,6,'2024-02-09','pending',7000);

drop table orders;

alter table customers modify column email varchar(200);

insert into customers values(1, 'Ashwariya Ravindran', 'kerala','aish20@gmail.com'), 
                          (2, 'Kunal Jadhav', 'mumbai','kunal8898@gmail.com'), 
                          (3, 'Mahua Das', 'Agartala','mahua247@gmail.com'), 
                          (4, 'Srijita Nandy', 'kamalpur','srijita879@gmail.com'), 
                          (5, 'Mitan shil', 'Assam','mitantata@gmail.com'), 
                          (6, 'Ashit Sarkar', 'Udaipur','ashit2027@gmailcom'), 
                          (7, 'Madeep huda', 'indrapuri','randeepchand@gmailcom'), 
                          (8, 'Manash Das', 'Jaipur','manash.aig@gmailcom'), 
                          (9, 'Jesan ahmed', 'delhi','jesan.ahmed@gmailcom'), 
                          (10, 'Arijit Bose', 'kolkata','arijitbose@gmailcom');

create table order_details(order_id int, ISBN int, quantity int,price int);

drop table order_details;

alter table order_details modify ISBN varchar(50);

truncate order_details;

insert into order_details values(402,'978-0-321-94786-5',4,1850),
								(404,'978-0-321-94786-6',5,1890),
                                (405,'978-0-321-94786-7',6,1900),
                                (403,'978-0-321-94786-6',8,1950),
                                (402,'978-0-321-94786-10',7,2000),
                                (406,'978-0-321-94786-8',3,2050);

create table employees(employee_id int, name varchar(20),position varchar(40));

insert into employees values(301, 'sayali joshi','hr executive'),
							(302, 'Akash mhatre','business executive'),
                            (303, 'Pratik kulkarni','marking manager'),
                            (304, 'Asmina khatun','Port flio executive'),
                            (305, 'Amrita Joshi','hr manager'),
                            (306, 'Suyash kale','data engineer'),
                            (307, 'sadiya ansarei','data analyst'),
                            (308, 'Akansha more','Reception executive'),
                            (309, 'Mandeep kaur','sale executive'),
                            (310, 'Dhiman kar','business analyst');
create table categories(Id int, genre varchar(3));
desc categories;

alter table categories drop column name;

alter table categories modify column genre varchar(30);

insert into categories values(501, 'technology'),
							(502, 'medical'),
                            (503, 'paramedical'),
                            (504, 'nursing'),
                            (505, 'Agribusiness'),
                            (506, 'engineering'),
                            (507, 'hr analytics'),
                            (508, 'noble'),
                            (509, 'statistics'),
                            (510, 'technology');
                            
create table publisher(publisherid int,publisher_name varchar(60));

drop table publisher;

insert into publisher values
						(101, 'Wrox'),
						(102, 'Wiley'),
						(103, 'O''Reilly Media'),
						(104, 'Apress'),
						(105, 'Packt Publishing'),
						(106, 'Addison-Wesley');
                        
alter table publisher
add constraint pk_pb1
primary key (publisherid);

-- List of books by a specific author.

select title,author from books;

-- Total sales by month.

SELECT MONTH(order_date) AS order_month, SUM(total_amount) AS total_price
FROM orders
GROUP BY MONTH(order_date);



-- Customers who purchased more than a certain amount.

select c.name,o.total_amount from customers c,orders o where c.customer_id=o.customer_id and o.total_amount>5000;

select order_id, order_date, total_amount, status
from orders
where status = 'pending';

alter table customers
add constraint pk_ci
primary key(customer_id) ;


alter table orders
add constraint fk_order_id
primary key(order_id);

alter table orders
add constraint fk_ci
foreign key (customer_id) references customers(customer_id);

alter table order_details 
add constraint fk_od
foreign key (order_id) references orders(order_id);

alter table order_details 
add constraint fk_isbn
foreign key (ISBN) references books(ISBN);

-- Find customers who have placed orders exceeding a certain total amount.
SELECT c.customer_id, c.name, c.email, SUM(o.total_amount) AS total_ordered_amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name, c.email
HAVING SUM(o.total_amount) > 1000;


-- Identify books that have never been ordered.
select * from books where ISBN not in (select ISBN from order_details);


-- Retrieve order details along with customer information.

select o.order_id, o.order_date, o.total_amount,
       c.customer_id, c.name, c.email
from orders o
join  customers c ON o.customer_id = c.customer_id;

-- List books along with their publishers.

select  b.title,p.publisher_name
from books b
join publisher p ON b.publisher_id = p.publisherid;


CREATE VIEW order_details_view AS
SELECT o.order_id, o.customer_id, o.order_date, o.total_amount,
       c.name, c.email
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;

SELECT * FROM order_details_view;

-- Create a view for books that are currently in stock.

CREATE VIEW books_view AS
SELECT b.title,b.author,b.stock
FROM books b where b.stock="available";

SELECT * FROM books_view;


CREATE INDEX idx_order_id ON order_details(order_id);
