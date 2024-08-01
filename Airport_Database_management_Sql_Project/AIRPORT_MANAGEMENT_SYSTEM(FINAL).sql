-- Airport Management System --
-- DB Design Fall 2016--
CREATE DATABASE airport;
USE airport;

CREATE TABLE CITY
(CNAME VARCHAR(15) NOT NULL,
STATE VARCHAR(15), 
COUNTRY VARCHAR(30),
PRIMARY KEY(CNAME));


-- Insering values of Table: CITY--
INSERT INTO CITY (CNAME, STATE, COUNTRY) VALUES('Louisville','Kentucky','United States');
INSERT INTO CITY (CNAME, STATE, COUNTRY) VALUES ('Chandigarh','Chandigarh','India');
INSERT INTO CITY (CNAME, STATE, COUNTRY) VALUES ('Fort Worth','Texas','United States');
INSERT INTO CITY (CNAME, STATE, COUNTRY) VALUES('Delhi','Delhi','India');
INSERT INTO CITY (CNAME, STATE, COUNTRY) VALUES('Mumbai','Maharashtra','India');
INSERT INTO CITY (CNAME, STATE, COUNTRY) VALUES('San Francisco', 'California', 'United States');
INSERT INTO CITY (CNAME, STATE, COUNTRY) VALUES('Frankfurt','Hesse','Germany');
INSERT INTO CITY (CNAME, STATE, COUNTRY) VALUES('Houston','Texas','United States');
INSERT INTO CITY (CNAME, STATE, COUNTRY) VALUES('New York City','New York','United States');
INSERT INTO CITY (CNAME, STATE, COUNTRY) VALUES('Tampa', 'Florida', 'United States');

CREATE TABLE AIRPORT
(AP_NAME VARCHAR(100) NOT NULL,
STATE VARCHAR(15), 
COUNTRY VARCHAR(30),
CNAME VARCHAR(15),
PRIMARY KEY(AP_NAME),
FOREIGN KEY(CNAME) REFERENCES CITY(CNAME) ON DELETE CASCADE);

-- Insering values for Table: AIRPORT--

INSERT INTO AIRPORT (AP_NAME, STATE, COUNTRY, CNAME) VALUES('Louisville International Airport','Kentucky','United States','Louisville');
INSERT INTO AIRPORT (AP_NAME, STATE, COUNTRY, CNAME) VALUES('Chandigarh International Airport','Chandigarh','India','Chandigarh');
INSERT INTO AIRPORT (AP_NAME, STATE, COUNTRY, CNAME) VALUES('Dallas/Fort Worth International Airport','Texas','United States','Fort Worth');
INSERT INTO AIRPORT (AP_NAME, STATE, COUNTRY, CNAME) VALUES('Indira GandhiInternational Airport','Delhi','India','Delhi');
INSERT INTO AIRPORT (AP_NAME, STATE, COUNTRY, CNAME) VALUES('Chhatrapati Shivaji International Airport','Maharashtra','India','Mumbai');
INSERT INTO AIRPORT (AP_NAME, STATE, COUNTRY, CNAME) VALUES('San Francisco International Airport','California', 'United States','San Francisco');
INSERT INTO AIRPORT (AP_NAME, STATE, COUNTRY, CNAME) VALUES('Frankfurt Airport','Hesse','Germany','Frankfurt');
INSERT INTO AIRPORT (AP_NAME, STATE, COUNTRY, CNAME) VALUES('George Bush Intercontinental Airport','Texas','United States','Houston');
INSERT INTO AIRPORT (AP_NAME, STATE, COUNTRY, CNAME) VALUES('John F. Kennedy International Airport','New York','United States','New York City');
INSERT INTO AIRPORT (AP_NAME, STATE, COUNTRY, CNAME) VALUES('Tampa International Airport','Florida', 'United States','Tampa');


CREATE TABLE AIRLINE
(AIRLINEID VARCHAR(3) NOT NULL,
AL_NAME VARCHAR(50),
THREE_DIGIT_CODE VARCHAR(3),
PRIMARY KEY(AIRLINEID));


-- Insering values for Table: AIRLINE --

INSERT INTO AIRLINE (AIRLINEID, AL_NAME, THREE_DIGIT_CODE) VALUES('AA','American Airlines','001');
INSERT INTO AIRLINE (AIRLINEID, AL_NAME, THREE_DIGIT_CODE) VALUES('AI','Air India Limited','098');
INSERT INTO AIRLINE (AIRLINEID, AL_NAME, THREE_DIGIT_CODE) VALUES('LH','Lufthansa', '220');
INSERT INTO AIRLINE (AIRLINEID, AL_NAME, THREE_DIGIT_CODE) VALUES('BA','British Airways','125');
INSERT INTO AIRLINE (AIRLINEID, AL_NAME, THREE_DIGIT_CODE) VALUES('QR','Qatar Airways','157');
INSERT INTO AIRLINE (AIRLINEID, AL_NAME, THREE_DIGIT_CODE) VALUES('9W','Jet Airways','589');
INSERT INTO AIRLINE (AIRLINEID, AL_NAME, THREE_DIGIT_CODE) VALUES('EK','Emirates','176');
INSERT INTO AIRLINE (AIRLINEID, AL_NAME, THREE_DIGIT_CODE) VALUES('EY','Ethiad Airways','607');

CREATE TABLE CONTAINS
(AIRLINEID VARCHAR(3) NOT NULL,
AP_NAME VARCHAR(100) NOT NULL);

ALTER TABLE CONTAINS ADD CONSTRAINT FK1
FOREIGN KEY (AIRLINEID) REFERENCES AIRLINE(AIRLINEID);
ALTER TABLE CONTAINS ADD CONSTRAINT FK2
FOREIGN KEY (AP_NAME) REFERENCES AIRPORT(AP_NAME);

DESC CONTAINS;

-- Insering values into Table: Contains--

INSERT INTO CONTAINS (AIRLINEID, AP_NAME) VALUES('AA','Louisville International Airport');
INSERT INTO CONTAINS (AIRLINEID, AP_NAME) VALUES('AA','John F. Kennedy International Airport');
INSERT INTO CONTAINS (AIRLINEID, AP_NAME) VALUES('AA','George Bush Intercontinental Airport');
INSERT INTO CONTAINS (AIRLINEID, AP_NAME) VALUES('AA','San Francisco International Airport');
INSERT INTO CONTAINS (AIRLINEID, AP_NAME) VALUES('AA','Tampa International Airport');

INSERT INTO CONTAINS (AIRLINEID, AP_NAME) VALUES('AI','Chandigarh International Airport');
INSERT INTO CONTAINS (AIRLINEID, AP_NAME) VALUES('AI','Dallas/Fort Worth International Airport');
INSERT INTO CONTAINS (AIRLINEID, AP_NAME) VALUES('AI','Indira GandhiInternational Airport');
INSERT INTO CONTAINS (AIRLINEID, AP_NAME) VALUES('AI','Chhatrapati Shivaji International Airport');
INSERT INTO CONTAINS (AIRLINEID, AP_NAME) VALUES('AI','George Bush Intercontinental Airport');

INSERT INTO CONTAINS (AIRLINEID, AP_NAME) VALUES('LH','Chhatrapati Shivaji International Airport');
INSERT INTO CONTAINS (AIRLINEID, AP_NAME) VALUES('LH','Frankfurt Airport');
INSERT INTO CONTAINS (AIRLINEID, AP_NAME) VALUES('LH','John F. Kennedy International Airport');
INSERT INTO CONTAINS (AIRLINEID, AP_NAME) VALUES('LH','San Francisco International Airport');
INSERT INTO CONTAINS (AIRLINEID, AP_NAME) VALUES('LH','Dallas/Fort Worth International Airport');

INSERT INTO CONTAINS (AIRLINEID, AP_NAME) VALUES('BA','John F. Kennedy International Airport');
INSERT INTO CONTAINS (AIRLINEID, AP_NAME) VALUES('BA','Chhatrapati Shivaji International Airport');
INSERT INTO CONTAINS (AIRLINEID, AP_NAME) VALUES('BA','Chandigarh International Airport');
INSERT INTO CONTAINS (AIRLINEID, AP_NAME) VALUES('BA','Frankfurt Airport');
INSERT INTO CONTAINS (AIRLINEID, AP_NAME) VALUES('BA','San Francisco International Airport');

INSERT INTO CONTAINS (AIRLINEID, AP_NAME) VALUES('QR','Chhatrapati Shivaji International Airport');
INSERT INTO CONTAINS (AIRLINEID, AP_NAME) VALUES('QR','Dallas/Fort Worth International Airport');
INSERT INTO CONTAINS (AIRLINEID, AP_NAME) VALUES('QR','John F. Kennedy International Airport');
INSERT INTO CONTAINS (AIRLINEID, AP_NAME) VALUES('QR','Tampa International Airport');
INSERT INTO CONTAINS (AIRLINEID, AP_NAME) VALUES('QR','Louisville International Airport');

CREATE TABLE FLIGHT
(FLIGHT_CODE VARCHAR(10) NOT NULL,
SOURCE VARCHAR(3),
DESTINATION VARCHAR(3),
ARRIVAL VARCHAR(10),
DEPARTURE VARCHAR(10),
STATUS VARCHAR(10),
DURATION VARCHAR(30),
FLIGHTTYPE VARCHAR(10),
LAYOVER_TIME VARCHAR(30),
NO_OF_STOPS INT,
AIRLINEID VARCHAR(3),
PRIMARY KEY(FLIGHT_CODE)
);

ALTER TABLE FLIGHT ADD CONSTRAINT FK3
FOREIGN KEY (AIRLINEID) REFERENCES AIRLINE(AIRLINEID);

DESC FLIGHT;


INSERT INTO FLIGHT(FLIGHT_CODE, SOURCE, DESTINATION, ARRIVAL, DEPARTURE, STATUS, DURATION, FLIGHTTYPE, LAYOVER_TIME, NO_OF_STOPS, AIRLINEID)
VALUES('AI2014','BOM','DFW','02:10','03:15','On-time','24hr','Connecting',3,1,'AI');


INSERT INTO FLIGHT(FLIGHT_CODE, SOURCE, DESTINATION, ARRIVAL, DEPARTURE, STATUS, DURATION, FLIGHTTYPE, LAYOVER_TIME, NO_OF_STOPS, AIRLINEID)
VALUES('QR2305','BOM','DFW','13:00','13:55','Delayed','21hr','Non-stop',0,0,'QR');


INSERT INTO FLIGHT(FLIGHT_CODE, SOURCE, DESTINATION, ARRIVAL, DEPARTURE, STATUS, DURATION, FLIGHTTYPE, LAYOVER_TIME, NO_OF_STOPS, AIRLINEID)
VALUES('EY1234','JFK','TPA','19:20','20:05','On-time','16hrs','Connecting',5,2,'EY');


INSERT INTO FLIGHT(FLIGHT_CODE, SOURCE, DESTINATION, ARRIVAL, DEPARTURE, STATUS, DURATION, FLIGHTTYPE, LAYOVER_TIME, NO_OF_STOPS, AIRLINEID)
VALUES('LH9876','JFK','BOM','05:50','06:35','On-time','18hrs','Non-stop',0,0,'LH');


INSERT INTO FLIGHT(FLIGHT_CODE, SOURCE, DESTINATION, ARRIVAL, DEPARTURE, STATUS, DURATION, FLIGHTTYPE, LAYOVER_TIME, NO_OF_STOPS, AIRLINEID)
VALUES('BA1689','FRA','DEL','10:20','10:55','On-time','14hrs','Non-stop',0,0,'BA');


INSERT INTO FLIGHT(FLIGHT_CODE, SOURCE, DESTINATION, ARRIVAL, DEPARTURE, STATUS, DURATION, FLIGHTTYPE, LAYOVER_TIME, NO_OF_STOPS, AIRLINEID)
VALUES('AA4367','SFO','FRA','18:10','18:55','On-time','21hrs','Non-stop',0,0,'AA');


INSERT INTO FLIGHT(FLIGHT_CODE, SOURCE, DESTINATION, ARRIVAL, DEPARTURE, STATUS, DURATION, FLIGHTTYPE, LAYOVER_TIME, NO_OF_STOPS, AIRLINEID)
VALUES('QR1902','IXC','IAH','22:00','22:50','Delayed','28hrs','Non-stop',5,1,'QR');


INSERT INTO FLIGHT(FLIGHT_CODE, SOURCE, DESTINATION, ARRIVAL, DEPARTURE, STATUS, DURATION, FLIGHTTYPE, LAYOVER_TIME, NO_OF_STOPS, AIRLINEID)
VALUES('BA3056','BOM','DFW','02:15','02:55','On-time','29hrs','Connecting',3,1,'BA');


INSERT INTO FLIGHT(FLIGHT_CODE, SOURCE, DESTINATION, ARRIVAL, DEPARTURE, STATUS, DURATION, FLIGHTTYPE, LAYOVER_TIME, NO_OF_STOPS, AIRLINEID)
VALUES('EK3456','BOM','SFO','18:50','19:40','On-time','30hrs','Non-stop',0,0,'EK');


INSERT INTO FLIGHT(FLIGHT_CODE, SOURCE, DESTINATION, ARRIVAL, DEPARTURE, STATUS, DURATION, FLIGHTTYPE, LAYOVER_TIME, NO_OF_STOPS, AIRLINEID)
VALUES('9W2334','IAH','DEL','23:00','13:45','On-time','23hrs','Direct',0,0,'9W');


CREATE TABLE PASSENGER1
(PID INT NOT NULL,
PASSPORTNO VARCHAR(10) NOT NULL);

DROP TABLE PASSENGER1;
ALTER TABLE PASSENGER1 ADD CONSTRAINT PK1
PRIMARY KEY(PID);
ALTER TABLE PASSENGER1 DROP PRIMARY KEY;
DESC PASSENGER1;

SELECT * FROM PASSENGER1;
DELETE FROM PASSENGER1 WHERE PID IS NULL;

TRUNCATE PASSENGER1;
SELECT * FROM PASSENGER1;

-- Insering values in table: PASSENGER1--
INSERT INTO PASSENGER1(PID, PASSPORTNO) VALUES(1,'A1234568');
INSERT INTO PASSENGER1(PID, PASSPORTNO) VALUES(2,'B9876541');
INSERT INTO PASSENGER1(PID, PASSPORTNO) VALUES(3,'C2345698');
INSERT INTO PASSENGER1(PID, PASSPORTNO) VALUES(4,'D1002004');
INSERT INTO PASSENGER1(PID, PASSPORTNO) VALUES(5,'X9324666');
INSERT INTO PASSENGER1(PID, PASSPORTNO) VALUES(6,'B8765430');
INSERT INTO PASSENGER1(PID, PASSPORTNO) VALUES(7,'J9801235');
INSERT INTO PASSENGER1(PID, PASSPORTNO) VALUES(8,'A1122334');
INSERT INTO PASSENGER1(PID, PASSPORTNO) VALUES(9,'Q1243567');
INSERT INTO PASSENGER1(PID, PASSPORTNO) VALUES(10,'S1243269');
INSERT INTO PASSENGER1(PID, PASSPORTNO) VALUES(11,'E3277889');
INSERT INTO PASSENGER1(PID, PASSPORTNO) VALUES(12,'K3212322');
INSERT INTO PASSENGER1(PID, PASSPORTNO) VALUES(13,'P3452390');
INSERT INTO PASSENGER1(PID, PASSPORTNO) VALUES(14,'W7543336');
INSERT INTO PASSENGER1(PID, PASSPORTNO) VALUES(15,'R8990566');

SELECT * FROM PASSENGER1;


CREATE TABLE PASSENGER2
(PASSPORTNO VARCHAR(10) NOT NULL,
FNAME VARCHAR(20),
M VARCHAR(1),
LNAME VARCHAR(20),
ADDRESS VARCHAR(100),
PHONE INT,
AGE INT,
SEX VARCHAR(1),
PRIMARY KEY(PASSPORTNO));

ALTER TABLE PASSENGER2 DROP PRIMARY KEY;
DESC PASSENGER2;

ALTER TABLE PASSENGER2 ADD CONSTRAINT PK2
PRIMARY KEY (PASSPORTNO);

ALTER TABLE PASSENGER2 ADD CONSTRAINT FK7
FOREIGN KEY (PASSPORTNO) REFERENCES PASSENGER1(PASSPORTNO);

DESC PASSENGER2;

-- iNSERTING VALUES IN TABLE: PASSENGER2--
INSERT INTO PASSENGER2(PASSPORTNO,FNAME,M,LNAME,ADDRESS,PHONE,AGE,SEX)
VALUES('A1234568','ALEN','M','SMITH','2230 NORTHSIDE, APT 11, ALBANY, NY',808036729,30,'M');

INSERT INTO PASSENGER2(PASSPORTNO,FNAME,M,LNAME,ADDRESS,PHONE,AGE,SEX)
VALUES('B9876541','ANKITA','V','AHIR','3456 VIKAS APTS, APT 102,DOMBIVLI, INDIA',808036728,26,'F');

INSERT INTO PASSENGER2(PASSPORTNO,FNAME,M,LNAME,ADDRESS,PHONE,AGE,SEX)
VALUES('C2345698','KHYATI','A','MISHRA','7820 MCCALLUM COURTS, APT 234, AKRON, OH',808226728,30,'F');

INSERT INTO PASSENGER2(PASSPORTNO,FNAME,M,LNAME,ADDRESS,PHONE,AGE,SEX)
VALUES('D1002004','ANKITA','S','PATIL','7720 MCCALLUM BLVD, APT 1082, DALLAS, TX',908036726,23,'F');

INSERT INTO PASSENGER2(PASSPORTNO,FNAME,M,LNAME,ADDRESS,PHONE,AGE,SEX)
VALUES('X9324666','TEJASHREE','B','PANDIT','9082 ESTAES OF RICHARDSON, RICHARDSON, TX',900436012,28,'F');

INSERT INTO PASSENGER2(PASSPORTNO,FNAME,M,LNAME,ADDRESS,PHONE,AGE,SEX)
VALUES('B8765430','LAKSHMI','P','SHARMA','1110 FIR HILLS, APT 903, AKRON, OH',766619050,30,'F');

INSERT INTO PASSENGER2(PASSPORTNO,FNAME,M,LNAME,ADDRESS,PHONE,AGE,SEX)
VALUES('J9801235','AKHILESH','D','JOSHI','345 CHATHAM COURTS, APT 678, MUMBAI, INDIA',908036929,29,'M');

INSERT INTO PASSENGER2(PASSPORTNO,FNAME,M,LNAME,ADDRESS,PHONE,AGE,SEX)
VALUES('A1122334','MANAN','S','LAKHANI','5589 CHTHAM REFLECTIONS, APT 349 HOUSTON, TX',900433512,25,'F');

INSERT INTO PASSENGER2(PASSPORTNO,FNAME,M,LNAME,ADDRESS,PHONE,AGE,SEX)
VALUES('Q1243567','KARAN','M','MOTANI','4444 FRANKFORD VILLA, APT 77, GUILDERLAND, NY',972762664,22,'M');

INSERT INTO PASSENGER2(PASSPORTNO,FNAME,M,LNAME,ADDRESS,PHONE,AGE,SEX)
VALUES('S1243269','ROM','A','SOLANKI','7720 MCCALLUM BLVD, APT 2087, DALLAS, TX',900456890,60,'M');


INSERT INTO PASSENGER2(PASSPORTNO,FNAME,M,LNAME,ADDRESS,PHONE,AGE,SEX)
VALUES('E3277889','John','A','GATES','1234 BAKER APTS, APT 59, HESSE, GERMANY',972456998,10,'M');

INSERT INTO PASSENGER2(PASSPORTNO,FNAME,M,LNAME,ADDRESS,PHONE,AGE,SEX)
VALUES('K3212322','SARA','B','GOMES','6785 SPLITSVILLA, APT 34, MIAMI, FL',902456922,15,'F');

INSERT INTO PASSENGER2(PASSPORTNO,FNAME,M,LNAME,ADDRESS,PHONE,AGE,SEX)
VALUES('P3452390','ALIA','V','BHAT','548 MARKET PLACE, SAN Francisco, CA',973456780,10,'F');

INSERT INTO PASSENGER2(PASSPORTNO,FNAME,M,LNAME,ADDRESS,PHONE,AGE,SEX)
VALUES('W7543336','JOHN','P','SMITH','6666 ROCK HILL, APT 2902, TAMPA, FL',462456998,55,'M');

INSERT INTO PASSENGER2(PASSPORTNO,FNAME,M,LNAME,ADDRESS,PHONE,AGE,SEX)
VALUES('R8990566','RIA','T','GUPTA','3355 PALENCIA, APT 2065, MUMBAI, INDIA',472451234,10,'M');

CREATE TABLE EMPLOYEE1
(SSN INT NOT NULL,
FNAME VARCHAR(20),
M VARCHAR(1),
LNAME VARCHAR(20),
ADDRESS VARCHAR(100),
PHONE INT,
AGE INT,
SEX VARCHAR(1),
JOBTYPE VARCHAR(30),
ASTYPE VARCHAR(30),
ETYPE VARCHAR(30),
SHIFT VARCHAR(20),
POSITION VARCHAR(30),
AP_NAME VARCHAR(100),
PRIMARY KEY(SSN));

ALTER TABLE EMPLOYEE1 ADD CONSTRAINT FK4
FOREIGN KEY(AP_NAME) REFERENCES AIRPORT(AP_NAME);

DESC EMPLOYEE1;

INSERT INTO EMPLOYEE1(SSN, FNAME, M, LNAME, ADDRESS, PHONE, AGE, SEX, JOBTYPE, ASTYPE, ETYPE, SHIFT, POSITION, AP_NAME)
VALUES(123456789,'LINDA','M','GOODMAN','731 Fondren, Houston, TX',435678935, 35, 'F','ADMINISTRATIVE SUPPORT','RECEPTIONIST','','','','Louisville International Airport');

INSERT INTO EMPLOYEE1(SSN, FNAME, M, LNAME, ADDRESS, PHONE, AGE, SEX, JOBTYPE, ASTYPE, ETYPE, SHIFT, POSITION, AP_NAME)
VALUES(333445555,'JOHNY','N','PAUL','638 Voss, Houston, TX',983456195, 40, 'M','ADMINISTRATIVE SUPPORT','SECRETARY','','','','Louisville International Airport');

INSERT INTO EMPLOYEE1(SSN, FNAME, M, LNAME, ADDRESS, PHONE, AGE, SEX, JOBTYPE, ASTYPE, ETYPE, SHIFT, POSITION, AP_NAME)
VALUES(999887777,'JAMES','P','BOND','3321 Castle, Spring, TX',983466995, 50, 'M','ENGINEER','','RADIO ENGINEER','','','Louisville International Airport');


INSERT INTO EMPLOYEE1(SSN, FNAME, M, LNAME, ADDRESS, PHONE, AGE, SEX, JOBTYPE, ASTYPE, ETYPE, SHIFT, POSITION, AP_NAME)
VALUES(987654321,'SHERLOCK','A','HOLMES','123 TOP HILL, SAN Francisco,CA',808965421, 47, 'M','TRAFFIC MONITOR','','','DAY','','San Francisco International Airport');

INSERT INTO EMPLOYEE1(SSN, FNAME, M, LNAME, ADDRESS, PHONE, AGE, SEX, JOBTYPE, ASTYPE, ETYPE, SHIFT, POSITION, AP_NAME)
VALUES(666884444,'SHELDON','A','COOPER','345 CHERRY PARK, HESSE,GERMANY',125467903, 55, 'M','TRAFFIC MONITOR','','NIGHT','','','Frankfurt Airport');


INSERT INTO EMPLOYEE1(SSN, FNAME, M, LNAME, ADDRESS, PHONE, AGE, SEX, JOBTYPE, ASTYPE, ETYPE, SHIFT, POSITION, AP_NAME)
VALUES(453453453,'RAJ','B','SHARMA','345 FLOYDS, MUMBAI,INDIA',432679031, 35, 'M','AIRPORT AUTHORITY','','','','MANAGER','Chhatrapati Shivaji International Airport');


INSERT INTO EMPLOYEE1(SSN, FNAME, M, LNAME, ADDRESS, PHONE, AGE, SEX, JOBTYPE, ASTYPE, ETYPE, SHIFT, POSITION, AP_NAME)
VALUES(987987987,'NIKITA','C','PAUL','110 SYNERGY PARK, DALLAS,TX',567804325, 33, 'F','ENGINEER','','AIRPORT CIVIL ENGINEER','','','Dallas/Fort Worth International Airport');


INSERT INTO EMPLOYEE1(SSN, FNAME, M, LNAME, ADDRESS, PHONE, AGE, SEX, JOBTYPE, ASTYPE, ETYPE, SHIFT, POSITION, AP_NAME)
VALUES(888665555,'SHUBHAM','R','GUPTA','567 CHANDANI CHOWK, DELHI, INDIA',856778890, 39, 'M','ADMINISTRATIVE SUPPORT','DATA ENTRY WORKER','','','','Indira GandhiInternational Airport');

INSERT INTO EMPLOYEE1(SSN, FNAME, M, LNAME, ADDRESS, PHONE, AGE, SEX, JOBTYPE, ASTYPE, ETYPE, SHIFT, POSITION, AP_NAME)
VALUES(125478909,'PRATIK','T','GOMES','334 VITRUVIAN PARK, ALBANY, NY',444468903, 56, 'M','TRAFFIC MONITOR','','DAY','','','John F. Kennedy International Airport');

INSERT INTO EMPLOYEE1(SSN, FNAME, M, LNAME, ADDRESS, PHONE, AGE, SEX, JOBTYPE, ASTYPE, ETYPE, SHIFT, POSITION, AP_NAME)
VALUES(324567897,'ADIT','P','DESAI','987 SOMNATH, CHANDIGARH, INDIA',224468909, 36, 'M','TRAFFIC MONITOR','','DAY','','','Chandigarh International Airport');

CREATE TABLE TICKET1
(TICKET_NUMBER INT NOT NULL,
SOURCE VARCHAR(3),
DESTINATION VARCHAR(3),
DATE_OF_BOOKING DATE,
DATE_OF_TRAVEL DATE,
SEATNO VARCHAR(5),
CLASS VARCHAR(15),
DATE_OF_CANCELLATION DATE,
PID INT,
PASSPORTNO VARCHAR(10));

ALTER TABLE TICKET1 ADD CONSTRAINT FK5
FOREIGN KEY (PASSPORTNO) REFERENCES PASSENGER1(PASSPORTNO);

ALTER TABLE TICKET1 ADD CONSTRAINT FK6
FOREIGN KEY (PID) REFERENCES PASSENGER1(PID);

DESC TICKET1;

CREATE INDEX index_name ON PASSENGER1(PASSPORTNO);

-- INSERTING INTO TABLE: TICKET1--
INSERT INTO TICKET1(TICKET_NUMBER, SOURCE, DESTINATION, DATE_OF_BOOKING, DATE_OF_CANCELLATION, DATE_OF_TRAVEL, SEATNO, CLASS, PID, PASSPORTNO)
VALUES(00112341122,'BOM','DFW','2016-05-11',null,'2016-12-15','32A','ECONOMY',1,'A1234568');

INSERT INTO TICKET1(TICKET_NUMBER, SOURCE, DESTINATION, DATE_OF_BOOKING, DATE_OF_CANCELLATION, DATE_OF_TRAVEL, SEATNO, CLASS, PID, PASSPORTNO)
VALUES(0984562229,'JFK','BOM','2016-06-11','2016-12-10','2016-12-20','45D','ECONOMY',2,'B9876541');

INSERT INTO TICKET1(TICKET_NUMBER, SOURCE, DESTINATION, DATE_OF_BOOKING, DATE_OF_CANCELLATION, DATE_OF_TRAVEL, SEATNO, CLASS, PID, PASSPORTNO)
VALUES(1768913273,'IAH','DEL','2016-08-26',NULL,'2016-12-25','1A','BUSINESS',3,'C2345698');

INSERT INTO TICKET1(TICKET_NUMBER, SOURCE, DESTINATION, DATE_OF_BOOKING, DATE_OF_CANCELLATION, DATE_OF_TRAVEL, SEATNO, CLASS, PID, PASSPORTNO)
VALUES(589074464,'IXC','IAH','2016-08-10',NULL,'2017-01-12','20C','FIRST-CLASS',4,'D1002004');

INSERT INTO TICKET1(TICKET_NUMBER, SOURCE, DESTINATION, DATE_OF_BOOKING, DATE_OF_CANCELLATION, DATE_OF_TRAVEL, SEATNO, CLASS, PID, PASSPORTNO)
VALUES(157746646,'JFK','TPA','2016-06-13',NULL,'2016-12-10','54E','ECONOMY',5,'X9324666');

INSERT INTO TICKET1(TICKET_NUMBER, SOURCE, DESTINATION, DATE_OF_BOOKING, DATE_OF_CANCELLATION, DATE_OF_TRAVEL, SEATNO, CLASS, PID, PASSPORTNO)
VALUES(220654355,'BOM','DFW','2016-11-14',NULL,'2017-02-12','43B','ECONOMY',6,'B8765430');

INSERT INTO TICKET1(TICKET_NUMBER, SOURCE, DESTINATION, DATE_OF_BOOKING, DATE_OF_CANCELLATION, DATE_OF_TRAVEL, SEATNO, CLASS, PID, PASSPORTNO)
VALUES(706432737,'IAH','DEL','2016-11-07',NULL,'2016-12-25','27B','FIRST-CLASS',7,'J9801235');

INSERT INTO TICKET1(TICKET_NUMBER, SOURCE, DESTINATION, DATE_OF_BOOKING, DATE_OF_CANCELLATION, DATE_OF_TRAVEL, SEATNO, CLASS, PID, PASSPORTNO)
VALUES(113572116,'SFO','FRA','2016-10-15',NULL,'2016-12-18','34E','ECONOMY',8,'A1122334');

INSERT INTO TICKET1(TICKET_NUMBER, SOURCE, DESTINATION, DATE_OF_BOOKING, DATE_OF_CANCELLATION, DATE_OF_TRAVEL, SEATNO, CLASS, PID, PASSPORTNO)
VALUES(157049855,'IXC','IAH','2016-11-12',NULL,'2016-12-30','54C','ECONOMY',9,'Q1243567');

INSERT INTO TICKET1(TICKET_NUMBER, SOURCE, DESTINATION, DATE_OF_BOOKING, DATE_OF_CANCELLATION, DATE_OF_TRAVEL, SEATNO, CLASS, PID, PASSPORTNO)
VALUES(157928799,'BOM','SFO','2016-01-22',NULL,'2016-12-15','38A','ECONOMY',10,'S1243269');

INSERT INTO TICKET1(TICKET_NUMBER, SOURCE, DESTINATION, DATE_OF_BOOKING, DATE_OF_CANCELLATION, DATE_OF_TRAVEL, SEATNO, CLASS, PID, PASSPORTNO)
VALUES(125570707,'FRA','DEL','2016-10-19',NULL,'2016-12-30','57F','ECONOMY',11,'E3277889');

INSERT INTO TICKET1(TICKET_NUMBER, SOURCE, DESTINATION, DATE_OF_BOOKING, DATE_OF_CANCELLATION, DATE_OF_TRAVEL, SEATNO, CLASS, PID, PASSPORTNO)
VALUES(125134999,'IXC','IAH','2016-11-20',NULL,'2017-01-22','45D','ECONOMY',12,'K3212322');

INSERT INTO TICKET1(TICKET_NUMBER, SOURCE, DESTINATION, DATE_OF_BOOKING, DATE_OF_CANCELLATION, DATE_OF_TRAVEL, SEATNO, CLASS, PID, PASSPORTNO)
VALUES(125871490,'BOM','DFW','2016-05-16','2016-05-25','2016-12-15','37C','ECONOMY',13,'P3452390');

INSERT INTO TICKET1(TICKET_NUMBER, SOURCE, DESTINATION, DATE_OF_BOOKING, DATE_OF_CANCELLATION, DATE_OF_TRAVEL, SEATNO, CLASS, PID, PASSPORTNO)
VALUES(589114477,'FRA','DEL','2016-06-15',NULL,'2016-12-23','55C','ECONOMY',14,'W7543336');

INSERT INTO TICKET1(TICKET_NUMBER, SOURCE, DESTINATION, DATE_OF_BOOKING, DATE_OF_CANCELLATION, DATE_OF_TRAVEL, SEATNO, CLASS, PID, PASSPORTNO)
VALUES(589307667,'BOM','DFW','2016-08-12',NULL,'2016-12-22','33F','ECONOMY',15,'R8990566');

INSERT INTO TICKET1(TICKET_NUMBER, SOURCE, DESTINATION, DATE_OF_BOOKING, DATE_OF_CANCELLATION, DATE_OF_TRAVEL, SEATNO, CLASS, PID, PASSPORTNO)
VALUES(689307667,'BOM','DFW','2016-08-12',NULL,'2016-12-22','33F','ECONOMY',Null,'R8990566');

CREATE TABLE TICKET2
(DATE_OF_BOOKING DATE NOT NULL,
SOURCE VARCHAR(3) NOT NULL,
DESTINATION VARCHAR(3) NOT NULL,
CLASS VARCHAR(15) NOT NULL,
PRICE INT,
PRIMARY KEY(DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS));

ALTER TABLE TICKET2 ADD CONSTRAINT FK8
FOREIGN KEY (CLASS) REFERENCES TICKET1(CLASS);

CREATE INDEX index_name1 ON TICKET1(CLASS);

INSERT INTO TICKET2(DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS, PRICE) 
VALUES('2016-05-11','BOM','DFW','ECONOMY',95000);

INSERT INTO TICKET2(DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS, PRICE) 
VALUES('2016-06-11','JFK','BOM','ECONOMY',100000);

INSERT INTO TICKET2(DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS, PRICE) 
VALUES('2016-08-21','IAH','DEL','BUSINESS',200000);

INSERT INTO TICKET2(DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS, PRICE) 
VALUES('2016-08-10','IXC','IAH','FIRST-CLASS',150000);

INSERT INTO TICKET2(DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS, PRICE) 
VALUES('2016-06-13','JFK','TPA','ECONOMY',98000);

INSERT INTO TICKET2(DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS, PRICE) 
VALUES('2016-11-11','BOM','DFW','ECONOMY',125000);

INSERT INTO TICKET2(DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS, PRICE) 
VALUES('2016-11-15','IAH','DEL','FIRST-CLASS',195000);

INSERT INTO TICKET2(DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS, PRICE) 
VALUES('2016-10-15','SFO','FRA','ECONOMY',170000);

INSERT INTO TICKET2(DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS, PRICE) 
VALUES('2016-11-12','IXC','IAH','ECONOMY',140000);

INSERT INTO TICKET2(DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS, PRICE) 
VALUES('2016-01-21','BOM','SFO','ECONOMY',45000);

INSERT INTO TICKET2(DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS, PRICE) 
VALUES('2016-10-19','FRA','DEL','ECONOMY',100000);

INSERT INTO TICKET2(DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS, PRICE) 
VALUES('2016-11-10','IXC','IAH','ECONOMY',120000);

INSERT INTO TICKET2(DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS, PRICE) 
VALUES('2016-05-11','BOM','DFW','ECONOMY',65000);

INSERT INTO TICKET2(DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS, PRICE) 
VALUES('2016-06-21','FRA','DEL','ECONOMY',80000);

INSERT INTO TICKET2(DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS, PRICE) 
VALUES('2016-08-11','BOM','DFW','ECONOMY',98000);

CREATE TABLE EMPLOYEE2
(JOBTYPE VARCHAR(30) NOT NULL,
SALARY INT,
PRIMARY KEY(JOBTYPE));

ALTER TABLE EMPLOYEE2 ADD CONSTRAINT FK10
FOREIGN KEY (JOBTYPE) REFERENCES EMP_INFO(JOBTYPE);
CREATE INDEX index_name ON EMP_INFO(JOBTYPE);
-- INSERTING VALUES INTO TABLE: EMPLOYEE2--
INSERT INTO EMPLOYEE2(JOBTYPE, SALARY)VALUES('ADMINISTRATIVE SUPPORT',50000);
INSERT INTO EMPLOYEE2(JOBTYPE, SALARY)VALUES('ENGINEER',70000);
INSERT INTO EMPLOYEE2(JOBTYPE, SALARY)VALUES('TRAFFIC MONITOR',80000);
INSERT INTO EMPLOYEE2(JOBTYPE, SALARY)VALUES('AIRPORT AUTHORITY',90000);
-- **********************************************************************************************************************
USE AIRPORT;
SELECT * FROM PASSENGER2;
DROP TABLE TICKET1;


ALTER TABLE EMPLOYEE1 RENAME EMP_INFO;

SELECT * FROM TICKET1 WHERE DATE_OF_BOOKING BETWEEN '2016-06-11' AND '2016-11-20'; 
SELECT * FROM TICKET1;

UPDATE TICKET1 SET DATE_OF_CANCELLATION='2016-06-14' WHERE TICKET_NUMBER=157746646;
SELECT * FROM TICKET1  WHERE TICKET_NUMBER=157746646;

SELECT * FROM PASSENGER2;
SELECT CONCAT(FNAME,' ',M,' ',LNAME) AS FULLNAME FROM PASSENGER2;
SELECT lower(CONCAT(FNAME,' ',M,' ',LNAME)) AS FULLNAME FROM PASSENGER2;

SELECT * FROM EMP_INFO;
SELECT DISTINCT(JOBTYPE) FROM EMP_INFO;

SELECT JOBTYPE,COUNT((JOBTYPE)) FROM EMP_INFO GROUP BY JOBTYPE;

SELECT FNAME FROM PASSENGER2 WHERE FNAME LIKE '%A';

SELECT JOBTYPE,SALARY FROM EMPLOYEE2 WHERE SALARY>=50000 AND SALARY<85000;

SELECT E1.SSN,CONCAT(E1.FNAME,' ',E1.LNAME) AS FULLNAME,E1.JOBTYPE,E2.SALARY FROM EMP_INFO E1
JOIN EMPLOYEE2 E2
ON E1.JOBTYPE=E2.JOBTYPE;


SELECT E1.SSN,CONCAT(E1.FNAME,' ',E1.LNAME) AS FULLNAME,E1.JOBTYPE,E2.SALARY FROM EMP_INFO E1
JOIN EMPLOYEE2 E2
ON E1.JOBTYPE=E2.JOBTYPE
HAVING FULLNAME LIKE '%L'
AND SALARY >55000;

SELECT PASSPORTNO FROM PASSENGER1 ORDER BY PASSPORTNO DESC LIMIT 10;

SELECT * FROM TICKET1;
SELECT * FROM TICKET2;

-- SELECT T1.CLASS,COUNT(T1.CLASS) AS UNIQUE_CLASS,T2.PRICE FROM TICKET1 T1
-- JOIN TICKET2 T2
-- ON T1.CLASS=T2.CLASS
-- GROUP BY T1.CLASS,T2.PRICE
 -- HAVING T2.PRICE=(SELECT AVG(PRICE) AS TOTAL_PRICE FROM TICKET2);

SELECT 
T1.CLASS,
COUNT(T1.CLASS),
(SELECT MAX(T2.PRICE) 
	FROM TICKET2 T2 
	WHERE T1.CLASS = T2.CLASS
    ) AS MAX_PRICE
FROM 
TICKET1 T1
GROUP BY
T1.CLASS;

SELECT 
T1.CLASS,
COUNT(T1.CLASS),
(SELECT AVG(T2.PRICE) 
	FROM TICKET2 T2 
	WHERE T1.CLASS = T2.CLASS
    ) AS AVG_PRICE
FROM 
TICKET1 T1
GROUP BY
T1.CLASS;

SELECT * FROM EMPLOYEE2;
SELECT * FROM EMP_INFO;

SELECT
CONCAT(E.FNAME,' ',E.M,' ',E.LNAME),
E.JOBTYPE,E.POSITION,
(SELECT
	(E2.SALARY) 
    FROM EMPLOYEE2 E2
    WHERE E.JOBTYPE=E2.JOBTYPE
 ) AS SALARY
 FROM EMP_INFO E
 WHERE E.POSITION='MANAGER';

SELECT T1.TICKET_NUMBER,T1.SOURCE,T1.DESTINATION,T1.PASSPORTNO,
    CONCAT(P.FNAME,' ',P.LNAME) AS FULLNAME,
    T2.PRICE
    FROM TICKET1 T1
JOIN PASSENGER2 P
	ON T1.PASSPORTNO=P.PASSPORTNO
JOIN TICKET2 T2
ON T2.DATE_OF_BOOKING=T1.DATE_OF_BOOKING
ORDER BY T1.PASSPORTNO;

SELECT * FROM TICKET1;

SELECT TICKET_NUMBER,DATE_OF_TRAVEL,DATE_OF_BOOKING,
TIMESTAMPDIFF(MONTH,DATE_OF_BOOKING,DATE_OF_TRAVEL) AS DIFFERENCE
FROM TICKET1;

SELECT DATE_FORMAT(DATE_OF_BOOKING,'%D %M %Y'),
DATE_FORMAT(DATE_OF_TRAVEL,'%M/%d/%Y')
FROM
TICKET1;

SELECT AP_NAME,LENGTH(AP_NAME),
SUBSTR(AP_NAME,10,6) AS SUBSTRING
 FROM CONTAINS;
	
-- SELECT T1.*,T2.PRICE,
-- ROW_NUMBER() OVER(PARTITION BY T1.CLASS ORDER BY T2.PRICE DESC ) AS "RANK"
-- FROM TICKET1 T1
-- JOIN TICKET2 T2
-- ON T1.CLASS=T2.CLASS;