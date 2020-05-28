---------COURSERA DATABASE MANAGEMENT ESSENTIALS 


---------------EMPLOYEE--------------------

CREATE TABLE Employee
( 	EmpNo 	 	VARCHAR2(8),
  	EmpFirstName    VARCHAR2(20) CONSTRAINT EmpFirstNameRequired NOT NULL,
	EmpLastName     VARCHAR2(30) CONSTRAINT EmpLastNameRequired NOT NULL,
	EmpPhone        VARCHAR2(15),
	EmpEMail        VARCHAR2(50) CONSTRAINT EmpEMailRequired NOT NULL,
   	SupEmpNo 	VARCHAR2(8),
        EmpCommRate	DECIMAL(3,3),
CONSTRAINT PKEmployee PRIMARY KEY (EmpNo),
CONSTRAINT UniqueEMail UNIQUE(EmpEMail),
CONSTRAINT FKSupEmpNo FOREIGN KEY (SupEmpNo) REFERENCES Employee );




---------------RESOURCETBL------------

CREATE TABLE RESOURCETBL 
(
resno VARCHAR2(8) CONSTRAINT resCon NOT NULL,
resname VARCHAR2(20) CONSTRAINT resnameCon NOT NULL,
rate FLOAT(4) CONSTRAINT rateCon NOT NULL,
CONSTRAINT PKres PRIMARY KEY(resno),
CONSTRAINT ratecheck CHECK(rate>0)
);



-------------------CUSTOMER---------------

CREATE TABLE Customer
( 	CustNo 	        VARCHAR2(8),
        CustFirstName    VARCHAR2(20) CONSTRAINT CustFirstNameRequired NOT NULL,
        CustLastName     VARCHAR2(30) CONSTRAINT CustLastNameRequired NOT NULL,
	CustStreet	VARCHAR2(50),
	CustCity	VARCHAR2(30),
   	CustState	VARCHAR2(2),
	CustZip		VARCHAR2(10),
	CustBal		DECIMAL(12,2) DEFAULT 0,
 CONSTRAINT PKCustomer PRIMARY KEY (CustNo)  );



----------------FACILITY----------------

CREATE TABLE Facility
(FacNo VARCHAR2(8) CONSTRAINT FacNoNotNull NOT NULL, 
 FacName VARCHAR2(30) CONSTRAINT FacNameNotNull NOT NULL,
   CONSTRAINT PK_FACILITY PRIMARY KEY (FacNo) );




-------------LOCATION-----------------

CREATE TABLE Location
(LocNo VARCHAR2(8) CONSTRAINT LocNoNotNull NOT NULL, 
 FacNo VARCHAR2(8), 
 LocName VARCHAR2(30) CONSTRAINT LocNameNotNull NOT NULL,
   CONSTRAINT PK_LOCATION PRIMARY KEY (LocNo),
   CONSTRAINT FK_FACNO FOREIGN KEY (FacNo) 
       REFERENCES FACILITY (FacNo) );




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



-------------------- Product --------------------------------

CREATE TABLE Product
( 	ProdNo 	         VARCHAR2(8),
  	ProdName	 VARCHAR2(50) CONSTRAINT ProdNameRequired NOT NULL,
	ProdMfg	         VARCHAR2(20) CONSTRAINT ProdMfgRequired NOT NULL,
	ProdQOH	         INTEGER,
	ProdPrice        DECIMAL(12,2),
        ProdNextShipDate DATE,
 CONSTRAINT PKProduct PRIMARY KEY (ProdNo)  );


-------------------- OrderTbl --------------------------------

CREATE TABLE OrderTbl
( 	OrdNo 	   VARCHAR2(8),
  	OrdDate	   DATE    CONSTRAINT OrdDateRequired NOT NULL,
	CustNo	   VARCHAR2(8) CONSTRAINT CustNoRequired NOT NULL,
        EmpNo	   VARCHAR2(8),
        OrdName    VARCHAR2(50),
        OrdStreet  VARCHAR2(50),
        OrdCity    VARCHAR2(30),
        OrdState   VARCHAR2(2),
        OrdZip     VARCHAR2(10),
CONSTRAINT PKOrderTbl PRIMARY KEY (OrdNo),
CONSTRAINT FKCustNo FOREIGN KEY (CustNo) REFERENCES Customer,
CONSTRAINT FKEmpNo FOREIGN KEY (EmpNo) REFERENCES Employee  );


-------------------- OrdLine --------------------------------

CREATE TABLE OrdLine
( 	OrdNo 	VARCHAR2(8),
  	ProdNo	VARCHAR2(8),
	Qty		INTEGER DEFAULT 1,
CONSTRAINT PKOrdLine PRIMARY KEY (OrdNo, ProdNo), 
CONSTRAINT FKOrdNo FOREIGN KEY (OrdNo) REFERENCES OrderTbl
  ON DELETE CASCADE, 
CONSTRAINT FKProdNo FOREIGN KEY (ProdNo) REFERENCES Product  );













