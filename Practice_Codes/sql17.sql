-- create table student with fields sno int primary key,sname ,age int 

create table student (sno int primary key,sname varchar(20),age int);

-- create table course with field cno int primary key,cname
create table course(cno int primary key,cname varchar(20) not null);

-- create table enroll
-- enroll id int primary key
-- courseid int
-- stid int
-- jdate date
-- courseid fk on cascade delete
-- stid fk  on cascade update

create table enroll(enroll_id int primary key,
					courseid int,
                    stid int,
                    jdate date,
                    foreign key (courseid) references course(cno)
                    on delete cascade,
                    foreign key (stid) references student(sno)
                    on update cascade);
                    
insert into student values  (1,'Ash',27),
							(2,'rekha',26),
							(3,'sam',25),
							(4,'barry',45);
insert into course values(101,'ds'),
						(102,'dsda'),
						(103,'python'),
						(104,'java');
insert into enroll values   (202,101,2,"2025-11-14"),
							(203,103,3,"2022-03-05"),
							(204,104,4,"2024-04-19");
                            

-- write a query to display studentname,cname and jdate

select c.cname,s.sname,e.jdate from student s,
									course c,
                                    enroll e 
                                    where s.sno=e.stid and c.cno=e.courseid;
                                    
select * from enroll;