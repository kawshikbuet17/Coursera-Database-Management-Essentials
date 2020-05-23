---------COURSERA DATABASE MANAGEMENT ESSENTIALS 
-------------WEEK-2 - MODULE-3 ASSIGNMENT 
-------RUN it on Navicat to get all the tables and data

--NOTE:
	--chailei sob table delete/drop kore dewa jabena jodi oi table er konokisu onno table e connected thake. delete manually korleo delete hobena. neutral table age remove korte hobe.
	--ek nam er constraint dui jaygay use kora jabena, even alada table eo na
	--character gula case sensitive na.
	--eksathe onek gula table run korale error dile particular part alada sql e run koraye check korte hobe error ki eta bojhar jonno.


---------------EMPLOYEE--------------------

CREATE TABLE Employee
(
EmpNo VARCHAR2(8) CONSTRAINT employee_empnoCon NOT NULL,
EmpName VARCHAR2(20) CONSTRAINT EmpNameCon NOT NULL,
Department VARCHAR2(20) CONSTRAINT DeptCon NOT NULL,
Email VARCHAR2(30) CONSTRAINT EmailCon NOT NULL, 
Phone VARCHAR2(10) CONSTRAINT PhoneCon NOT NULL,
CONSTRAINT PKEmployee PRIMARY KEY(EmpNo),
CONSTRAINT UniqueMail UNIQUE(Email),
CONSTRAINT UniquePhone UNIQUE(Phone)
);

Insert into EMPLOYEE (EMPNO,EMPNAME,DEPARTMENT,EMAIL,PHONE) values ('E100','Chuck Coordinator','Administration','chuck@colorado.edu','3-1111');
Insert into EMPLOYEE (EMPNO,EMPNAME,DEPARTMENT,EMAIL,PHONE) values ('E101','Mary Manager','Football','mary@colorado.edu','5-1111');
Insert into EMPLOYEE (EMPNO,EMPNAME,DEPARTMENT,EMAIL,PHONE) values ('E102','Sally Supervisor','Planning','sally@colorado.edu','3-2222');
Insert into EMPLOYEE (EMPNO,EMPNAME,DEPARTMENT,EMAIL,PHONE) values ('E103','Alan Administrator','Administration','alan@colorado.edu','3-3333');


SELECT *
FROM Employee;



---------------RESOURCETBL------------

CREATE TABLE RESOURCETBL 
(
resno VARCHAR2(8) CONSTRAINT resCon NOT NULL,
resname VARCHAR2(20) CONSTRAINT resnameCon NOT NULL,
rate FLOAT(4) CONSTRAINT rateCon NOT NULL,
CONSTRAINT PKres PRIMARY KEY(resno),
CONSTRAINT ratecheck CHECK(rate>0)
);

Insert into RESOURCETBL (RESNO,RESNAME,RATE) values ('R100','attendant',10);
Insert into RESOURCETBL (RESNO,RESNAME,RATE) values ('R101','police',15);
Insert into RESOURCETBL (RESNO,RESNAME,RATE) values ('R102','usher',10);
Insert into RESOURCETBL (RESNO,RESNAME,RATE) values ('R103','nurse',20);
Insert into RESOURCETBL (RESNO,RESNAME,RATE) values ('R104','janitor',15);
Insert into RESOURCETBL (RESNO,RESNAME,RATE) values ('R105','food service',10);

SELECT *
FROM RESOURCETBL;



-------------------CUSTOMER---------------

CREATE TABLE Customer 
(CustNo VARCHAR2(8) CONSTRAINT CustNoNotNull NOT NULL, 
 CustName VARCHAR2(30) CONSTRAINT CustNameNotNull NOT NULL, 
 Address VARCHAR2(50) CONSTRAINT AddressNotNull NOT NULL, 
 Internal CHAR(1) CONSTRAINT InternalNotNull NOT NULL, 
 Contact VARCHAR2(35) CONSTRAINT ContractNotNull NOT NULL, 
 Phone VARCHAR2(11) CONSTRAINT CPhoneNotNull NOT NULL, 
 City VARCHAR2(30) CONSTRAINT CityNotNull NOT NULL,
 State VARCHAR2(2) CONSTRAINT StateNotNull NOT NULL, 
 Zip VARCHAR2(10) CONSTRAINT zipNotNull NOT NULL,
  CONSTRAINT PK_CUSTOMER PRIMARY KEY (CustNo) ) ;
	
Insert into CUSTOMER (CUSTNO,CUSTNAME,ADDRESS,INTERNAL,CONTACT,PHONE,CITY,STATE,ZIP) values ('C100','Football','Box 352200','Y','Mary Manager','6857100','Boulder','CO','80309');
Insert into CUSTOMER (CUSTNO,CUSTNAME,ADDRESS,INTERNAL,CONTACT,PHONE,CITY,STATE,ZIP) values ('C101','Men''s Basketball','Box 352400','Y','Sally Supervisor','5431700','Boulder','CO','80309');
Insert into CUSTOMER (CUSTNO,CUSTNAME,ADDRESS,INTERNAL,CONTACT,PHONE,CITY,STATE,ZIP) values ('C103','Baseball','Box 352020','Y','Bill Baseball','5431234','Boulder','CO','80309');
Insert into CUSTOMER (CUSTNO,CUSTNAME,ADDRESS,INTERNAL,CONTACT,PHONE,CITY,STATE,ZIP) values ('C104','Women''s Softball','Box 351200','Y','Sue Softball','5434321','Boulder','CO','80309');
Insert into CUSTOMER (CUSTNO,CUSTNAME,ADDRESS,INTERNAL,CONTACT,PHONE,CITY,STATE,ZIP) values ('C105','High School Football','123 AnyStreet','N','Coach Bob','4441234','Louisville','CO','80027');

SELECT *
FROM Customer;



----------------FACILITY----------------

CREATE TABLE Facility
(FacNo VARCHAR2(8) CONSTRAINT FacNoNotNull NOT NULL, 
 FacName VARCHAR2(30) CONSTRAINT FacNameNotNull NOT NULL,
   CONSTRAINT PK_FACILITY PRIMARY KEY (FacNo) );


Insert into FACILITY (FACNO,FACNAME) values ('F100','Football stadium');
Insert into FACILITY (FACNO,FACNAME) values ('F101','Basketball arena');
Insert into FACILITY (FACNO,FACNAME) values ('F102','Baseball field');
Insert into FACILITY (FACNO,FACNAME) values ('F103','Recreation room');

SELECT *
FROM Facility;




-------------LOCATION-----------------

CREATE TABLE Location
(LocNo VARCHAR2(8) CONSTRAINT LocNoNotNull NOT NULL, 
 FacNo VARCHAR2(8), 
 LocName VARCHAR2(30) CONSTRAINT LocNameNotNull NOT NULL,
   CONSTRAINT PK_LOCATION PRIMARY KEY (LocNo),
   CONSTRAINT FK_FACNO FOREIGN KEY (FacNo) 
       REFERENCES FACILITY (FacNo) );


Insert into LOCATION (LOCNO,FACNO,LOCNAME) values ('L100','F100','Locker room');
Insert into LOCATION (LOCNO,FACNO,LOCNAME) values ('L101','F100','Plaza');
Insert into LOCATION (LOCNO,FACNO,LOCNAME) values ('L102','F100','Vehicle gate');
Insert into LOCATION (LOCNO,FACNO,LOCNAME) values ('L103','F101','Locker room');
Insert into LOCATION (LOCNO,FACNO,LOCNAME) values ('L104','F100','Ticket Booth');
Insert into LOCATION (LOCNO,FACNO,LOCNAME) values ('L105','F101','Gate');
Insert into LOCATION (LOCNO,FACNO,LOCNAME) values ('L106','F100','Pedestrian gate');

SELECT *
FROM Location;





----------------EVENTREQUEST-------------

CREATE TABLE EventRequest
(
eventno VARCHAR2(8) CONSTRAINT eventnoCon NOT NULL,
custno VARCHAR2(8) CONSTRAINT custnoCon NOT NULL,
facno VARCHAR2(8) CONSTRAINT factnoCon NOT NULL,
dateheld DATE CONSTRAINT dateheldCon NOT NULL,
datereq DATE CONSTRAINT datereqCon NOT NULL,
dateauth DATE ,
status VARCHAR2(20) CONSTRAINT statusCon NOT NULL,
estcost DECIMAL(8, 2) CONSTRAINT estcostCon NOT NULL,
estaudience INTEGER CONSTRAINT estaudiCon NOT NULL,
budno VARCHAR2(10),
CONSTRAINT statuscheck CHECK(status IN('Pending', 'Denied', 'Approved')),
CONSTRAINT PK_eventreq PRIMARY KEY(eventno),
CONSTRAINT FK_eventreq_facno FOREIGN KEY(facno) REFERENCES Facility(facno),
CONSTRAINT FK_eventreq_custno FOREIGN KEY(custno) REFERENCES Customer(custno),
CONSTRAINT estaudcheck CHECK(estaudience>0)
);

Insert into EVENTREQUEST (EVENTNO,DATEHELD,DATEREQ,CUSTNO,FACNO,DATEAUTH,STATUS,ESTCOST,ESTAUDIENCE,BUDNO) values ('E100',to_date('25-OCT-18','DD-MON-RR'),to_date('06-JUN-18','DD-MON-RR'),'C100','F100',to_date('08-JUN-18','DD-MON-RR'),'Approved',5000,80000,'B1000');
Insert into EVENTREQUEST (EVENTNO,DATEHELD,DATEREQ,CUSTNO,FACNO,DATEAUTH,STATUS,ESTCOST,ESTAUDIENCE,BUDNO) values ('E101',to_date('26-OCT-18','DD-MON-RR'),to_date('28-JUL-18','DD-MON-RR'),'C100','F100',null,'Pending',5000,80000,'B1000');
Insert into EVENTREQUEST (EVENTNO,DATEHELD,DATEREQ,CUSTNO,FACNO,DATEAUTH,STATUS,ESTCOST,ESTAUDIENCE,BUDNO) values ('E103',to_date('21-SEP-18','DD-MON-RR'),to_date('28-JUL-18','DD-MON-RR'),'C100','F100',to_date('01-AUG-18','DD-MON-RR'),'Approved',5000,80000,'B1000');
Insert into EVENTREQUEST (EVENTNO,DATEHELD,DATEREQ,CUSTNO,FACNO,DATEAUTH,STATUS,ESTCOST,ESTAUDIENCE,BUDNO) values ('E102',to_date('14-SEP-18','DD-MON-RR'),to_date('28-JUL-18','DD-MON-RR'),'C100','F100',to_date('31-JUL-18','DD-MON-RR'),'Approved',5000,80000,'B1000');
Insert into EVENTREQUEST (EVENTNO,DATEHELD,DATEREQ,CUSTNO,FACNO,DATEAUTH,STATUS,ESTCOST,ESTAUDIENCE,BUDNO) values ('E104',to_date('03-DEC-18','DD-MON-RR'),to_date('28-JUL-18','DD-MON-RR'),'C101','F101',to_date('31-JUL-18','DD-MON-RR'),'Approved',2000,12000,'B1000');
Insert into EVENTREQUEST (EVENTNO,DATEHELD,DATEREQ,CUSTNO,FACNO,DATEAUTH,STATUS,ESTCOST,ESTAUDIENCE,BUDNO) values ('E105',to_date('05-DEC-18','DD-MON-RR'),to_date('28-JUL-18','DD-MON-RR'),'C101','F101',to_date('01-AUG-18','DD-MON-RR'),'Approved',2000,10000,'B1000');
Insert into EVENTREQUEST (EVENTNO,DATEHELD,DATEREQ,CUSTNO,FACNO,DATEAUTH,STATUS,ESTCOST,ESTAUDIENCE,BUDNO) values ('E106',to_date('12-DEC-18','DD-MON-RR'),to_date('28-JUL-18','DD-MON-RR'),'C101','F101',to_date('31-JUL-18','DD-MON-RR'),'Approved',2000,10000,'B1000');
Insert into EVENTREQUEST (EVENTNO,DATEHELD,DATEREQ,CUSTNO,FACNO,DATEAUTH,STATUS,ESTCOST,ESTAUDIENCE,BUDNO) values ('E107',to_date('23-NOV-18','DD-MON-RR'),to_date('28-JUL-18','DD-MON-RR'),'C105','F100',to_date('31-JUL-18','DD-MON-RR'),'Denied',10000,5000,null);


SELECT *
FROM EventRequest;




----------------EVENTPLAN-----------------

CREATE TABLE EventPlan
(
planno VARCHAR2(8) CONSTRAINT plannoCon NOT NULL,
eventno VARCHAR2(8) CONSTRAINT eventno_eventplan_Con NOT NULL,
workdate DATE CONSTRAINT workdateCon NOT NULL,
notes VARCHAR2(60),
activity VARCHAR2(10) CONSTRAINT activityCon NOT NULL,
empno VARCHAR2(8),
CONSTRAINT PK_eventplan PRIMARY KEY(planno),
CONSTRAINT FK_eventplan_eventno FOREIGN KEY(eventno) REFERENCES EventRequest(eventno),
CONSTRAINT FK_eventplan_empno FOREIGN KEY(empno) REFERENCES Employee(empno)
);

Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P100','E100',to_date('25-OCT-18','DD-MON-RR'),'Standard operation','Operation','E102');
Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P101','E104',to_date('03-DEC-18','DD-MON-RR'),'Watch for gate crashers','Operation','E100');
Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P102','E105',to_date('05-DEC-18','DD-MON-RR'),'Standard operation','Operation','E102');
Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P103','E106',to_date('12-DEC-18','DD-MON-RR'),'Watch for seat switching','Operation',null);
Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P104','E101',to_date('26-OCT-18','DD-MON-RR'),'Standard cleanup','Cleanup','E101');
Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P105','E100',to_date('25-OCT-18','DD-MON-RR'),'Light cleanup','Cleanup','E101');
Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P199','E102',to_date('10-DEC-18','DD-MON-RR'),'ABC','Operation','E101');
Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P299','E101',to_date('26-OCT-18','DD-MON-RR'),null,'Operation','E101');
Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P349','E106',to_date('12-DEC-18','DD-MON-RR'),null,'Setup','E101');
Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P85','E100',to_date('25-OCT-18','DD-MON-RR'),'Standard operation','Cleanup','E102');
Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P95','E101',to_date('26-OCT-18','DD-MON-RR'),'Extra security','Cleanup','E102');


SELECT *
FROM EventPlan;





---------------EVENTPLANLINE-------------------

CREATE TABLE EventPlanLine
(
planno VARCHAR2(8) CONSTRAINT tpl_plannoCon NOT NULL,
lineno VARCHAR2(8) CONSTRAINT tpl_linenoCon NOT NULL,
timestart DATE CONSTRAINT timestartCon NOT NULL,
timeend DATE CONSTRAINT timeendCon NOT NULL,
numberfld INTEGER CONSTRAINT numberfldCon NOT NULL,
locno VARCHAR2(8) CONSTRAINT tpl_locnoCon NOT NULL,
resno VARCHAR2(8) CONSTRAINT tpl_resnoCon NOT NULL,
CONSTRAINT PK_eventplanline PRIMARY KEY(planno, lineno),
CONSTRAINT FK_eventplanline_planno FOREIGN KEY(planno) REFERENCES EventPlan(planno),
CONSTRAINT FK_eventplanline_resno FOREIGN KEY(resno) REFERENCES ResourceTbl(resno),
CONSTRAINT startend CHECK(timestart<timeend)
);

Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P100',1, to_date('25-OCT-18 8:00:00','DD-MON-RR HH24:MI:SS'), to_date('25-OCT-18 17:00:00','DD-MON-RR HH24:MI:SS'),2,'L100','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P100',2, to_date('25-OCT-18 12:00:00','DD-MON-RR HH24:MI:SS'),to_date('25-OCT-18 17:00:00','DD-MON-RR HH24:MI:SS'), 2,'L101','R101');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P100',3, to_date('25-OCT-18 7:00:00','DD-MON-RR HH24:MI:SS'), to_date('25-OCT-18 16:30:00','DD-MON-RR HH24:MI:SS'), 1,'L102','R102');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P100',4, to_date('25-OCT-18 18:00:00','DD-MON-RR HH24:MI:SS'),to_date('25-OCT-18 22:00:00','DD-MON-RR HH24:MI:SS'),2,'L100','R102');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P101',1, to_date('3-DEC-18 18:00:00','DD-MON-RR HH24:MI:SS'),to_date('3-DEC-18 20:00:00','DD-MON-RR HH24:MI:SS'),2,'L103','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P101',2, to_date('3-DEC-18 18:30:00','DD-MON-RR HH24:MI:SS'),to_date('3-DEC-18 19:00:00','DD-MON-RR HH24:MI:SS'),4,'L105','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P101',3, to_date('3-DEC-18 19:00:00','DD-MON-RR HH24:MI:SS'),to_date('3-DEC-18 20:00:00','DD-MON-RR HH24:MI:SS'),2,'L103','R103');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P102',1, to_date('5-DEC-18 18:00:00','DD-MON-RR HH24:MI:SS'),to_date('5-DEC-18 19:00:00','DD-MON-RR HH24:MI:SS'),2,'L103','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P102',2, to_date('5-DEC-18 18:00:00','DD-MON-RR HH24:MI:SS'),to_date('5-DEC-18 21:00:00','DD-MON-RR HH24:MI:SS'),4,'L105','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P102',3, to_date('5-DEC-18 19:00:00','DD-MON-RR HH24:MI:SS'),to_date('5-DEC-18 22:00:00','DD-MON-RR HH24:MI:SS'),2,'L103','R103');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P103',1, to_date('12-DEC-18 18:00:00','DD-MON-RR HH24:MI:SS'),to_date('12-DEC-18 21:00:00','DD-MON-RR HH24:MI:SS'),2,'L103','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P103',2, to_date('12-DEC-18 18:00:00','DD-MON-RR HH24:MI:SS'),to_date('12-DEC-18 21:00:00','DD-MON-RR HH24:MI:SS'),4,'L105','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P103',3, to_date('12-DEC-18 19:00:00','DD-MON-RR HH24:MI:SS'),to_date('12-DEC-18 22:00:00','DD-MON-RR HH24:MI:SS'),2,'L103','R103');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P104',1, to_date('26-OCT-18 18:00:00','DD-MON-RR HH24:MI:SS'),to_date('26-OCT-18 22:00:00','DD-MON-RR HH24:MI:SS'),4,'L101','R104');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P104',2, to_date('26-OCT-18 18:00:00','DD-MON-RR HH24:MI:SS'),to_date('26-OCT-18 22:00:00','DD-MON-RR HH24:MI:SS'),4,'L100','R104');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P105',1, to_date('25-OCT-18 18:00:00','DD-MON-RR HH24:MI:SS'),to_date('25-OCT-18 22:00:00','DD-MON-RR HH24:MI:SS'),4,'L101','R104');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P105',2, to_date('25-OCT-18 18:00:00','DD-MON-RR HH24:MI:SS'),to_date('25-OCT-18 22:00:00','DD-MON-RR HH24:MI:SS'),4,'L100','R104');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P199',1, to_date('10-DEC-18 8:00:00','DD-MON-RR HH24:MI:SS'), to_date('10-DEC-18 12:00:00','DD-MON-RR HH24:MI:SS'),1,'L100','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P349',1, to_date('12-DEC-18 12:00:00','DD-MON-RR HH24:MI:SS'),to_date('12-DEC-18 15:30:00','DD-MON-RR HH24:MI:SS'),1,'L103','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P85',1,  to_date('25-OCT-18 9:00:00','DD-MON-RR HH24:MI:SS'), to_date('25-OCT-18 17:00:00','DD-MON-RR HH24:MI:SS'),5,'L100','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P85',2,  to_date('25-OCT-18 8:00:00','DD-MON-RR HH24:MI:SS'), to_date('25-OCT-18 17:00:00','DD-MON-RR HH24:MI:SS'),2,'L102','R101');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P85',3, to_date('25-OCT-18 10:00:00','DD-MON-RR HH24:MI:SS'), to_date('25-OCT-18 15:00:00','DD-MON-RR HH24:MI:SS'),3,'L104','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P95',1, to_date('26-OCT-18 8:00:00','DD-MON-RR HH24:MI:SS'),  to_date('26-OCT-18 17:00:00','DD-MON-RR HH24:MI:SS'),4,'L100','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P95',2, to_date('26-OCT-18 9:00:00','DD-MON-RR HH24:MI:SS'),  to_date('26-OCT-18 17:00:00','DD-MON-RR HH24:MI:SS'),4,'L102','R101');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P95',3, to_date('26-OCT-18 10:00:00','DD-MON-RR HH24:MI:SS'), to_date('26-OCT-18 15:00:00','DD-MON-RR HH24:MI:SS'),4,'L106','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P95',4, to_date('26-OCT-18 13:00:00','DD-MON-RR HH24:MI:SS'), to_date('26-OCT-18 17:00:00','DD-MON-RR HH24:MI:SS'),2,'L100','R103');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P95',5, to_date('26-OCT-18 13:00:00','DD-MON-RR HH24:MI:SS'), to_date('26-OCT-18 17:00:00','DD-MON-RR HH24:MI:SS'),2,'L101','R104');

SELECT *
FROM EventPlanLine;*/












