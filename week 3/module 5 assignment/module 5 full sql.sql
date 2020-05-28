-------Week3 Module5 Assignment Full Solve-------
----------All Problems' Solve is here--------
---------------ORACLE DATABASE---------


------- select problem 1 --------
SELECT EVENTREQUEST.EVENTNO, DATEHELD, COUNT(*) "Num of Plans"
FROM EVENTREQUEST, EVENTPLAN
WHERE WORKDATE BETWEEN TO_DATE('01-12-2018','DD-MM-YYYY') 			AND				 TO_DATE('31-12-2018', 'DD-MM-YYYY')
 AND EVENTPLAN.EVENTNO = EVENTREQUEST.EVENTNO
GROUP BY EVENTREQUEST.EVENTNO, DATEHELD
HAVING COUNT(*)>1;


--------select problem 2---------
SELECT EVENTPLAN.PLANNO, EVENTPLAN.EVENTNO, EVENTPLAN.WORKDATE, EVENTPLAN.ACTIVITY
FROM EVENTPLAN, FACILITY, EVENTREQUEST
WHERE WORKDATE BETWEEN TO_DATE('01-12-2018', 'dd-mm-yyyy') AND TO_DATE(								'31-12-2018', 'dd-mm-yyyy')
							 AND EVENTREQUEST.FACNO = FACILITY.FACNO
							 AND EVENTPLAN.EVENTNO = EVENTREQUEST.EVENTNO
							 AND FACILITY.FACNAME = 'Basketball arena';
							 

---------select problem 3-----------
SELECT eventrequest.eventno, dateheld, status, estcost
FROM eventrequest, employee, facility, eventplan
WHERE dateheld BETWEEN to_date('1/10/2018','dd/mm/yyyy') AND to_date('31/12/2018','dd/mm/yyyy')
  AND eventplan.empno = employee.empno AND eventrequest.facno = facility.facno
  AND facname = 'Basketball arena' AND empname = 'Mary Manager'
  AND eventrequest.eventno = eventplan.eventno;
	
	
---------select problem 4-----------
SELECT eventplan.planno, lineno, locname, resname, numberfld, timestart, timeend
FROM facility, eventplan, eventplanline, resourcetbl, location
WHERE eventplan.workdate BETWEEN '1-Oct-2018' AND '31-Dec-2018' 
  AND eventplan.planno = eventplanline.planno AND location.facno = facility.facno
  AND facname = 'Basketball arena' AND eventplanline.resno = resourcetbl.resno
  AND location.locno = eventplanline.locno 
  AND eventplan.activity = 'Operation';
	
	
	

---------Database Modification Problem 1-----------
	
INSERT INTO Facility ( FacNo, FacName )
VALUES ('F107', 'Swimming Pool');

---------Database Modification Problem 2-----------	
INSERT INTO Location ( LocNo, FacNo, LocName )
VALUES ('L107', 'F107', 'Door');

---------Database Modification Problem 3-----------
INSERT INTO Location ( LocNo, FacNo, LocName )
VALUES ('L108', 'F107', 'Locker Room');

---------Database Modification Problem 4-----------	
UPDATE Location SET LocName = 'Gate'
WHERE LocNo = 'L107'; 

---------Database Modification Problem 5-----------
DELETE Location
WHERE LocNo = 'L108';




-------------SQL Statements with Errors and Poor Formatting  1 ----------
SELECT eventrequest.eventno, dateheld, status, estcost
FROM eventrequest, employee, facility, eventplan
WHERE estaudience > 5000
  AND eventplan.empno = employee.empno 
  AND eventrequest.facno = facility.facno
  AND eventrequest.eventno = eventplan.eventno
  AND facname = 'Football stadium' 
  AND empname = 'Mary Manager';
	
	
-------------SQL Statements with Errors and Poor Formatting  2 ----------
SELECT DISTINCT eventrequest.eventno, dateheld, status, estcost
FROM eventrequest, eventplan
WHERE estaudience > 4000
  AND eventplan.eventno = eventrequest.eventno;
	
	
-------------SQL Statements with Errors and Poor Formatting  3 ----------
SELECT DISTINCT DISTeventrequest.eventno, dateheld, status, estcost
FROM eventrequest, facility, eventplan
WHERE estaudience > 5000
  AND eventrequest.facno = facility.facno
  AND eventplan.eventno = eventrequest.eventno 
  AND facname = 'Football stadium';


-------------SQL Statements with Errors and Poor Formatting  4 ----------
SELECT DISTINCT eventrequest.eventno, dateheld, status, estcost
FROM eventrequest, employee, eventplan
WHERE estaudience BETWEEN 5000 AND 10000
  AND eventplan.empno = employee.empno 
  AND eventrequest.eventno = eventplan.eventno
  AND empname = 'Mary Manager';


-------------SQL Statements with Errors and Poor Formatting  4 ----------
SELECT eventplan.planno, lineno, resname, numberfld, timestart, timeend
    FROM eventrequest, facility, eventplan, eventplanline, resourcetbl
    WHERE estaudience = 10000
      AND eventplan.planno = eventplanline.planno 
      AND eventrequest.facno = facility.facno
      AND facname = 'Basketball arena' 
      AND eventplanline.resno = resourcetbl.resno
      AND eventrequest.eventno = eventplan.eventno;
