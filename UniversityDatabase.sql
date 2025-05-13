--create database
create database university;

--use database
use university;

--create faculty table
create table faculty(
F_ID int Not Null PRIMARY KEY identity(1,1),
Name VARCHAR(15) Not Null,
Department VARCHAR(50) Not Null,
Salary int Constraint CheckFacultySalary CHECK (Salary between 100 and 500),
Department_ID int, foreign key (Department_ID) references faculty(F_ID));

--create FacultyMobile table
create table FacultyMobile(
F_ID int, foreign key (F_ID) references faculty(F_ID),
Mobile_NO VARCHAR(20) Not Null,
Primary key (F_ID, Mobile_NO));

--create subjects table
create table Subjects(
Subject_ID int Not Null PRIMARY KEY identity(1,1), 
Subject_Name VARCHAR(50) Not Null,
F_ID int, foreign key (F_ID) references faculty(F_ID));

--create student table
create table Student(
S_ID int Not Null PRIMARY KEY identity(1,1),
Fname VARCHAR(20) Not Null,
Lname VARCHAR(20) Not Null, 
F_ID int, foreign key (F_ID) references faculty(F_ID));



--create StudentPhone table
create table StudentPhone(
S_ID int, foreign key (S_ID) references Student(S_ID),
Mobile_NO VARCHAR(20) Not Null,
Primary key (S_ID, Mobile_NO));

--create Address table
create table Address(
S_ID int, foreign key (S_ID) references Student(S_ID),
City VARCHAR(50) Not Null,
State VARCHAR(50) Not Null,
Pin_Code VARCHAR(20) Not Null,
PRIMARY KEY ( S_ID , City , State , Pin_Code));

--create Hostel table
create table Hostel (
Hostel_ID int Not Null PRIMARY KEY identity(1,1),
Hostel_Name VARCHAR(50) Not Null,
No_Of_Seats int Not Null);

--create StudentCourse table
create table StudentCourse(
S_ID int, foreign key (S_ID) references Student(S_ID));


--create Course table
create table Course (
Course_ID int Not Null PRIMARY KEY identity(1,1), 
Duration TIME Not Null,
Course_Name VARCHAR(50) Not Null,
S_ID int, foreign key (S_ID) references Student(S_ID));


--create exams table
create table Exams(
Exam_Code int Not Null PRIMARY KEY identity(1,1), 
Room VARCHAR(20) Not Null,
Date DATE Not Null,
Time TIME Not Null);

--create Department table
create table Department(
Department_ID int Not Null PRIMARY KEY identity(1,1), 
D_Name VARCHAR(50) Not Null);

---------------------------------------

-- add Hostel_ID as foreign key in Student table
alter table Student
add Hostel_ID int, foreign key (Hostel_ID) references Hostel(Hostel_ID)

--add Course_ID as foreign key in Student table 
alter table Student
add Course_ID int, foreign key (Course_ID) references Course(Course_ID)

--add Course_ID as a foreign key in StudentCourse table
alter table StudentCourse
add Course_ID int, foreign key (Course_ID) references Course(Course_ID)

--add Department_ID as a foreign key in Course table 
alter table Course
add Department_ID int, foreign key (Department_ID) references Department(Department_ID)

--add Department_ID as a foreign key in Exams table
alter table Exams
add Department_ID int, foreign key (Department_ID) references Department(Department_ID)