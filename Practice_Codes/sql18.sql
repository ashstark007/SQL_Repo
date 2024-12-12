use aishwarya;
show tables;
create table stud(id int,sname varchar(20),courseid int);
create table cours_es(cid int,cname varchar(20),fees int);
insert into stud values (101,"Mayuri",1),
						(102,"Reshma",1),
                        (103,"Rama",3),
                        (104,"Mahesh",4),
                        (105,"akshay",3);
 select * from stud;
 insert into cours_es values(1,'python',25000),
							(2,'java',20000),	
                            (3,'c++',27000),
                            (4,'power bi',29000),
                            (5,'Ms excel',15000);
truncate cours_es;
select * from cours_es;

-- show the details of students who enrolled for courses
select * from stud s
join cours_es c
on s.courseid=c.cid; -- inner join

insert into stud(id,sname) values(106,"Harsh");
insert into stud(id,sname) values(107,"Pooja");

-- show the details of all student with cname and cid whether enrolled or not

select * from stud s
left join cours_es c
on s.courseid=c.cid;

-- show the details of all courses whether the student have enrolled or not
select * from stud s
right join cours_es c
on s.courseid=c.cid;

-- show all the recors from student and courses matching and non matching also
(select * from stud s
left join 
cours_es c  
on s.courseid=c.cid)
union
(select * from stud s
right join 
cours_es c  
on s.courseid=c.cid);

-- mysql doesnt support full outer join  so to get full join we use left join+right join

-- cross join - cartesian product
select * from stud s
cross join cours_es c;

-- left anti join
-- show the records of student who have not enrolled for any course yet
select * from stud s
left join cours_es c
on s.courseid=c.cid
where c.cid is Null;

-- right anti join
-- show the records of courses  for which no students have enrolled for any course yet
select c.cid,c.cname,c.fees from stud s
right join cours_es c
on s.courseid=c.cid
where s.courseid is Null;

create table customers (cid int,cname varchar(20) ,mobileno bigint,pid int);
-- products(id,pname,price)
create table products(id int,pname varchar(20),price int);

-- all joins
insert into customers values(101,'Ash',15165654,1),
							(102,'akku',124545,4),
                            (103,'sam',787888,1),
                            (104,'raj',455455,2);
insert into products values(1,'laptop',4555),
					(2,'mouse',1222),
                    (3,'tv',1245),
                    (4,'mobile',7899);
insert into customers(cid,cname) values(105,'mayuri'),
										(106,'reshma');
select * from customers;

-- inner join
select * from customers c
join products p
on c.pid=p.id;

-- left join
select * from customers c
left join products p
on c.pid=p.id;

-- right join
select * from customers c
right join products p
on c.pid=p.id;

-- full join
(select * from customers c
left join products p
on c.pid=p.id)
union
(select * from customers c
right join products p
on c.pid=p.id);

-- cross join
select * from customers c
cross join products p;

-- left anti
select cid, cname from customers c
left join products p
on c.pid=p.id
where p.id is Null;

-- right anti
select * from customers c
right join products p
on c.pid=p.id
where c.pid is Null;