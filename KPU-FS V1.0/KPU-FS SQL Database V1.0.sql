-- ---------Create the Database----------

drop database KPUFSDatabase;
create database KPUFSDatabase;

-- -----Select thet database for use-----

use KPUFSDatabase;

-- ---------Create the tables------------

create table LoginInfo(
  LoginUser varchar(30) NOT NULL,
  LoginPassword varchar(30) NOT NULL,
  PRIMARY KEY (LoginUser)
  );
  
  
create table Course(
  CourseID varchar(10) NOT NULL,
  CourseName varchar(40) NOT NULL DEFAULT "",
  YearToBeTaken varchar(10) NOT NULL DEFAULT "",
  Program varchar(30) NOT NULL DEFAULT "",
  ComputersNeeded boolean NOT NULL DEFAULT FALSE,
  PRIMARY KEY (CourseID)
  );


create table Location(
  Campus varchar(20) DEFAULT "",
  RoomNo varchar(30) DEFAULT "",
  ComputersAvalible boolean NOT NULL DEFAULT FALSE,
  PRIMARY KEY (Campus, RoomNo)
  );
  
  
create table Times(
  DayOfWeek varchar(15) NOT NULL,
  TimeSlot varchar(15) NOT NULL,
  PRIMARY KEY (DayOfWeek, TimeSlot)
  );
  
  
create table Semester(
  SemYear varchar(6) NOT NULL,
  Season varchar(15) NOT NULL DEFAULT "",
  PRIMARY KEY (SemYear, Season)
  );


create table Teacher(
  KPUID varchar(10) DEFAULT "",
  FirstName varchar(30) NOT NULL DEFAULT "",
  LastName varchar(30) NOT NULL DEFAULT "",
  PRIMARY KEY (KPUID)
  );
        
  
create table KPUSection(
  CRNID varchar(12) NOT NULL,
  SectionID varchar(4) NOT NULL,
  
  CourseID varchar(8) NOT NULL DEFAULT "",
  
  Campus varchar(30) NULL,
  RoomNo varchar(30) NULL,
  
  SemYear varchar(4) NOT NULL DEFAULT "",
  Season varchar(10) NOT NULL DEFAULT "",
  
  KPUID varchar(9) NULL,
  
  DayOfWeek varchar(25) NULL,
  TimeSlot varchar(25) NULL,
  PRIMARY KEY (CRNID),
  FOREIGN KEY (CourseID)
		REFERENCES Course (CourseID)
        ON UPDATE CASCADE 
        ON DELETE CASCADE,
  FOREIGN KEY (Campus, RoomNo)
		REFERENCES Location (Campus, RoomNo)
        ON UPDATE CASCADE 
        ON DELETE CASCADE,
  FOREIGN KEY (SemYear, Season)
		REFERENCES Semester (SemYear, Season)
        ON UPDATE CASCADE 
        ON DELETE CASCADE,
  FOREIGN KEY (KPUID)
		REFERENCES Teacher (KPUID)
        ON UPDATE CASCADE 
        ON DELETE CASCADE,
  FOREIGN KEY (DayOfWeek, TimeSlot)
		REFERENCES Times (DayOfWeek, TimeSlot)
		ON UPDATE CASCADE 
		ON DELETE CASCADE
);
  

create table TeacherAvalibleCourses(
  KPUID varchar(9) NOT NULL,
  TeachableCoursesID varchar(20) NOT NULL,
  PRIMARY KEY (KPUID, TeachableCoursesID),
  FOREIGN KEY (KPUID)
		REFERENCES Teacher (KPUID)
        ON UPDATE CASCADE 
        ON DELETE CASCADE,
  FOREIGN KEY (TeachableCoursesID)
		REFERENCES Course (CourseID)
        ON UPDATE CASCADE 
        ON DELETE CASCADE
);


create table TeacherSchedule(
  CRNID varchar(12) NOT NULL,
  
  KPUID varchar(10) NOT NULL,
  
  
  TeachingCourseID varchar(20) NOT NULL,
  PRIMARY KEY (CRNID),
  FOREIGN KEY (CRNID)
		REFERENCES KPUSection (CRNID)
        ON UPDATE CASCADE 
        ON DELETE CASCADE,
  FOREIGN KEY (KPUID)
		REFERENCES Teacher (KPUID)
        ON UPDATE CASCADE 
        ON DELETE CASCADE,
  FOREIGN KEY (TeachingCourseID)
		REFERENCES Course (CourseID)
        ON UPDATE CASCADE 
        ON DELETE CASCADE
);




-- ---------Filling the tables------------
  
  
insert into LoginInfo( LoginUser,		LoginPassword)
  values (			'user', 	'pass'),
         (			'1', 		'1'),
         (			'test', 	'test');
  
  
insert into Teacher( KPUID,		FirstName,			LastName)
  values (			'100100100', 	'John',	 		'Doe' 		),
         (			'100100101', 	'Emily',	 	'Nuehold' 	),
         (			'100100102', 	'Richard',	 	'Johanson' 	),
         (			'100100103', 	'Joey',	 		'Tribiani'	),
         (			'100100104', 	'Simon',	 	'Gilmount' 	),
         (			'100100105', 	'Cadence',	 	'Holding' 	),
         (			'100100106', 	'Clay',	 		'Bartlett' 	),
         (			'100100107', 	'Arif',	 		'Booth' 	),
         (			'100100108', 	'Esa',	 		'Wallis' 	),
         (			'100100109', 	'Kyan',	 		'Harwood' 	),
         (			'100100110', 	'Archie',	 	'Wagstaff' 	),
         (			'100100111', 	'Alysia',	 	'Appleton' 	),
         (			'100100112', 	'Kavan',	 	'Fritz' 	),
         (			'100100113', 	'Evelyn',	 	'Higgs' 	),
         (			'100100114', 	'Devante ',	 	'Simmons' 	);
  

insert into Course( CourseID,		CourseName,			YearToBeTaken, 	Program, 					ComputersNeeded)
  values (			'INFO1111', 	'Programming 1', 	'Year 1' ,			'Information Technology', 	TRUE),
         (			'INFO1112', 	'Programming 2', 	'Year 2', 			'Information Technology',	TRUE),
         (			'INFO1113', 	'Network 1' , 		'Year 1', 			'Information Technology',	TRUE),
         (			'INFO1114', 	'Network 2' , 		'Year 2', 			'Information Technology',	TRUE),
         (			'INFO2101', 	'Computers 1' , 	'Year 2', 			'Information Technology',	TRUE),
         (			'INFO2102', 	'Computers 2' , 	'Year 2', 			'Information Technology',	TRUE),
         (			'INFO2103', 	'Databases 1' , 	'Year 2', 			'Information Technology',	TRUE),
         (			'INFO2104', 	'Databases 2' , 	'Year 2', 			'Information Technology',	TRUE),
         (			'INFO2105', 	'Java 1' , 			'Year 3', 			'Information Technology',	TRUE),
         (			'INFO2106', 	'Java 2' , 			'Year 3', 			'Information Technology',	TRUE),
         (			'INFO2107', 	'Moblie 1' , 		'Year 3', 			'Information Technology',	TRUE),
         (			'INFO2108', 	'Moblie 2' , 		'Year 3', 			'Information Technology',	TRUE),
         (			'INFO2109', 	'Hardware 2' , 		'Year 3', 			'Information Technology',	FALSE),
         (			'INFO2200', 	'Hardware 1' , 		'Year 1', 			'Information Technology',	FALSE);
         
         
insert into Location(Campus, 			RoomNo, 		ComputersAvalible)
  values (				'Surrey', 		'Cedar 1010',   True ),
		 (				'Surrey', 		'Cedar 1020',   True ),
         (				'Surrey', 		'Cedar 1030',   True ),
		 (				'Surrey', 		'Cedar 1040',   True ),
         (				'Surrey', 		'Cedar 1045',   True ),
		 (				'Surrey', 		'Cedar 1050',   True ),
         (				'Surrey', 		'Cedar 2010',   True ),
		 (				'Surrey', 		'Cedar 2025',   True ),
         (				'Surrey', 		'Cedar 2035',   True ),
		 (				'Surrey', 		'Cedar 2040',   True ),
         (				'Surrey', 		'Cedar 2045',   True ),
		 (				'Surrey', 		'Cedar 2050',   True ),
         (				'Surrey', 		'Fir 100',     	True ),
         (				'Surrey', 		'Fir 120',     	True ),
         (				'Surrey', 		'Fir 140',     	True ), 
         (				'Surrey', 		'Fir 160',     	True ),
         (				'Surrey', 		'Fir 220',     	False ),
         (				'Surrey', 		'Fir 240',     	False ),
		 (				'Surrey', 		'Birch 1010',   False ),
         (				'Surrey', 		'Birch 1020',   False ),
         (				'Surrey', 		'Birch 1030',   False ),
         (				'Surrey', 		'Birch 2010',   False ),
         (				'Surrey', 		'Birch 2020',   False ),
         (				'Surrey', 		'Birch 2030',   False ),
         
		 (				'Langley', 		'Room 1110',   	False ),
         (				'Langley', 		'Room 1145',   	False ),
         (				'Langley', 		'Room 1220',   	False ),
         (				'Langley', 		'Room 1280',   	False ),
         (				'Langley', 		'Room 1290',   	False ),
         (				'Langley', 		'Room 1320',   	True ),
         (				'Langley', 		'Room 1330',   	True ),
         (				'Langley', 		'Room 1340',   	True ),
         (				'Langley', 		'Room 1360',   	True ),
         (				'Langley', 		'Room 1400',   	False ),
         
         (				'Cloverdale', 	'Room 1010',    False ),
         (				'Cloverdale', 	'Room 1020',    False ),
         (				'Cloverdale', 	'Room 1030',    False ),
         (				'Cloverdale', 	'Room 1040',    False ),
         (				'Cloverdale', 	'Room 1045',    False ),
         (				'Cloverdale', 	'Room 2020',    True ),
         (				'Cloverdale', 	'Room 2040',    True ),
		
         (				'Richmond', 	'Room 1000',   	False ),
         (				'Richmond', 	'Room 1010',    False ),
         (				'Richmond', 	'Room 1020',    False ),
         (				'Richmond', 	'Room 1030',    False ),
         (				'Richmond', 	'Room 1040',    False ),
         (				'Richmond', 	'Room 1045',    False ),
         (				'Richmond', 	'Room 2020',    True ),
         (				'Richmond', 	'Room 2040',    True );
        
        
insert into Times(DayOfWeek,			TimeSlot)
  values (			'Monday', 			'7am - 9:50am'),
		(			'Monday', 			'10am - 12:50pm'),
		(			'Monday', 			'1pm - 3:50pm'),
		(			'Monday', 			'4pm - 6:50pm'),
        (			'Monday', 			'7pm - 9:50pm'),
        
		(			'Tuesday', 			'7am - 9:50am'),
		(			'Tuesday', 			'10am - 12:50pm'),
		(			'Tuesday', 			'1pm - 3:50pm'),
		(			'Tuesday', 			'4pm - 6:50pm'),
        (			'Tuesday', 			'7pm - 9:50pm'),
        
        (			'Wednesday', 		'7am - 9:50am'),
		(			'Wednesday', 		'10am - 12:50pm'),
		(			'Wednesday', 		'1pm - 3:50pm'),
		(			'Wednesday', 		'4pm - 6:50pm'),
        (			'Wednesday', 		'7pm - 9:50pm'),
        
        (			'Thursday', 		'7am - 9:50am'),
		(			'Thursday', 		'10am - 12:50pm'),
		(			'Thursday', 		'1pm - 3:50pm'),
		(			'Thursday', 		'4pm - 6:50pm'),
        (			'Thursday', 		'7pm - 9:50pm'),
        
        (			'Friday', 			'7am - 9:50am'),
		(			'Friday', 			'10am - 12:50pm'),
		(			'Friday', 			'1pm - 3:50pm'),
		(			'Friday', 			'4pm - 6:50pm'),
        (			'Friday', 			'7pm - 9:50pm');


insert into Semester(SemYear,			Season)
  values (				'2017', 		'Spring'),
		(				'2017', 		'Summer'),
		(				'2017', 		'Fall'),
        
        (				'2018', 		'Spring'),
		(				'2018', 		'Summer'),
		(				'2018', 		'Fall'),
        
        (				'2019', 		'Spring'),
		(				'2019', 		'Summer'),
		(				'2019', 		'Fall'); 
        
        
insert into KPUSection(CRNID,  		SectionID, 	CourseID,   	Campus, 		RoomNo, 		SemYear,  	Season,  	KPUID,  		TimeSlot, 			DayOfWeek)
  values (			'100222001', 	'S10', 		'INFO1111',		'Surrey', 		'Cedar 2045', 	'2018',		'Summer',	100100100,		'7am - 9:50am',				'Monday'),
         (			'100222002', 	'S20', 		'INFO1111', 	'Surrey',		'Cedar 2045',	'2018',		'Summer',	100100100,		'10am - 12:50pm',				'Monday'),
         (			'100222003', 	'S10', 		'INFO1111', 	'Cloverdale',	'Room 1020',	'2018',		'Summer',	100100101,		'7pm - 9:50pm',				'Monday'),
         (			'100222004', 	'S50', 		'INFO1111', 	null,	null,	'2018',		'Summer',	null,		null,		 		null),
         (			'100222005', 	'S20', 		'INFO1111', 	null,	null,	'2018',		'Summer',	null,		null,		 		null),
         (			'100222006', 	'S20', 		'INFO1111', 	null,	null,	'2018',		'Summer',	null,		null,		 		null),
         (			'100222007', 	'S30', 		'INFO1112', 	null,	null,	'2018',		'Summer',	null,		null,		 		null),
         (			'100222008', 	'S30', 		'INFO1112', 	null,	null,	'2018',		'Summer',	null,		null,		 		null),
         (			'100222009', 	'S30', 		'INFO1112', 	null,	null,	'2018',		'Summer',	null,		null,		 		null),
         (			'100222010', 	'S30', 		'INFO1112', 	null,	null,	'2018',		'Summer',	null,		null,		 		null),
         (			'100225555', 	'S30', 		'INFO1112', 	null,	null,	'2018',		'Summer',	null,		null,		 		null),
         (			'100222050', 	'S30', 		'INFO1112', 	null,	null,	'2018',		'Summer',	null,		null,		 		null),
         (			'100283005', 	'S40', 		'INFO1112', 	null,	null,	'2018',		'Summer',	null,		null,		 		null),
         (			'21289005', 	'S40', 		'INFO1113', 	null,	null,	'2018',		'Summer',	null,		null,		 		null),
         (			'218932005', 	'S40', 		'INFO1113', 	null,	null,	'2018',		'Summer',	null,		null,		 		null),
         (			'210582005', 	'S40', 		'INFO1113', 	null,	null,	'2018',		'Summer',	null,		null,		 		null),
         (			'215527005', 	'S40', 		'INFO1113', 	null,	null,	'2018',		'Summer',	null,		null,		 		null),
         (			'219952005', 	'S50', 		'INFO1114', 	null,	null,	'2018',		'Summer',	null,		null,		 		null),
         (			'210265105', 	'S50', 		'INFO1114', 	null,	null,	'2018',		'Summer',	null,		null,		 		null),
         (			'200222865', 	'S50', 		'INFO1114', 	null,	null,	'2018',		'Summer',	null,		null,		 		null),
         (			'200222088', 	'S50', 		'INFO1114', 	null,	null,	'2018',		'Summer',	null,		null,		 		null),
         (			'209952005', 	'S50', 		'INFO1114', 	null,	null,	'2018',		'Summer',	null,		null,		 		null),
         (			'230265105', 	'S50', 		'INFO1114', 	null,	null,	'2018',		'Summer',	null,		null,		 		null),
         (			'230222865', 	'S50', 		'INFO1114', 	null,	null,	'2018',		'Summer',	null,		null,		 		null),
         (			'230222088', 	'S50', 		'INFO1114', 	null,	null,	'2018',		'Summer',	null,		null,		 		null);


        
insert into TeacherAvalibleCourses(KPUID,			TeachableCoursesID)
  values (				'100100100', 				'INFO1111'),
		 (				'100100100', 				'INFO1112'),
		 (				'100100101', 				'INFO1113'),
		 (				'100100101', 				'INFO1114');
           

-- ---------DDL changes------------

-- SELECT Teacher.KPUID, Teacher.FirstName, Teacher.LastName, TeacherAvalibleCourses.TeachableCoursesID FROM Teacher LEFT OUTER JOIN  TeacherAvalibleCourses ON Teacher.KPUID = TeacherAvalibleCourses.KPUID;
-- INSERT INTO KPUSection(CRNID, SectionID, CourseID, Campus, RoomNo, SemYear, Season, KPUID, TimeSlot, DayOfWeek) VALUES ('100222020', 'S10', 'INFO1111', 'Surrey', 'Cedar 2045', '2018', 'Summer', '100100100', '4pm - 6:50pm', 'Monday');
-- INSERT INTO KPUSection(CRNID, SectionID, CourseID, Campus, RoomNo, SemYear, Season, KPUID, TimeSlot, DayOfWeek) VALUES('" + CRNID + "', '" + SectionID + "', '" + CourseID + "', '" + SectionLocationCampusIDArray.get(SectionLocationList.getSelectedIndex()) + "', '" + SectionLocationRoomIDArray.get(SectionLocationList.getSelectedIndex()) + "', '" + SectionSemesterYearIDArray.get(SectionSemesterList.getSelectedIndex()) + "', '" + SectionSemesterSeasonIDArray.get(SectionSemesterList.getSelectedIndex()) + "', '" + SectionTeacherIDArray.get(SectionTeacherList.getSelectedIndex()) + "', '" + TimeRBSelection + "', '" + DayOfTheWeek + "')");

SELECT * FROM LoginInfo WHERE LoginUser = "test" AND LoginPassword = "test";

SELECT * FROM LoginInfo WHERE LoginUser = 'test' AND LoginPassword = 'test';

error

  SHOW DATABASES;
  SELECT KPUFSDatabase();
  SELECT DATABASE();
  SHOW TABLES;


 
  DROP TABLE Course;
  DROP TABLE Semester;
  DROP TABLE Location;
 
-- ---------Common SQL searches------------
  
-- Specific searches

-- Looking for Johns
  SELECT *
  FROM TeacherAvalibleCourses;
  
-- Products sold as instore pickup
  SELECT *
  FROM Teacher;

  
-- List of employyes sorted by salery and grouped by position
  select employeeID, firstname, lastname, EmployeeSalary 
  from Employees
  order by EmployeeSalary DESC;
  
-- transactions made by customers named Joey
  select transactionID, productID 
  from TransactionRecord
  where customerID = ( SELECT customerID FROM Customer WHERE firstName = 'Joey');
  
-- Products name  and the supplier name  whose orders are recived
  select  supplierName,  productName, orderID 
  from Orders,Supplier, Products 
  where orderRecived = true AND Orders.supplierID = Supplier.supplierID AND Orders.productID = Products.productID;
  
-- For each branch with more than 1 member of staff,find number of staff in each branch and sum of their salaries.
  Select branchID, COUNT(employeeID) AS staffCount, SUM(EmployeeSalary) AS SalarySum
  from Employees
  group by branchID
  HAVING COUNT(employeeID) > 1
  ORDER BY branchID;

-- Monthly salary payments as a chain

  SELECT SUM(EmployeeSalary)
  FROM Employees;
  
-- Monthly salary payments as a Branch 3

  SELECT SUM(EmployeeSalary)
  FROM Employees 
  Where branchID = 'B003';
  