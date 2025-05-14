--create database
create database university;

--use database
use university;

--create faculty table
create table faculty(
F_ID int Not Null PRIMARY KEY identity(1,1),
Name VARCHAR(15) Not Null,
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
S_ID int, foreign key (S_ID) references Student(S_ID),
Primary Key (S_ID, Course_ID)); 


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

-----------------------------------------

-- Insert Departments
INSERT INTO Department (D_Name) VALUES 
('Computer Science'),
('Mathematics'),
('Physics');

-- Insert Faculty
INSERT INTO faculty (Name, Salary, Department_ID) VALUES
('Amani', 300, 1),
('Fahad', 350, 2),
('Reem', 400, 3),
('Tariq', 320, 1),
('Amal', 450, 2);

-- Insert Hostels
INSERT INTO Hostel (Hostel_Name, No_Of_Seats) VALUES
('A-Block', 100),
('B-Block', 80),
('C-Block', 60);

-- Insert Students
INSERT INTO Student (Fname, Lname, F_ID, Hostel_ID, Course_ID)
VALUES 
('Ahmed', 'Jamal', 1, 1, NULL),
('Layan', 'Mohammed', 2, 2, NULL),
('Saeed', 'Ahmed', 3, 1, NULL),
('Sara', 'Daoud', 1, 3, NULL),
('Saud', 'Mohammed', 4, 2, NULL);

-- Insert FacultyMobile
INSERT INTO FacultyMobile (F_ID, Mobile_NO) VALUES
(1, '5551112222'),
(1, '5553334444'),
(2, '5552223333'),
(3, '5554445555'),
(4, '5556667777');

-- Insert Subjects
INSERT INTO Subjects (Subject_Name, F_ID) VALUES
('Data Structures', 1),
('Calculus', 2),
('Quantum Physics', 3),
('Algorithms', 4),
('Statistics', 5);

-- Insert StudentPhone
INSERT INTO StudentPhone (S_ID, Mobile_NO) VALUES
(1, '9991112222'),
(2, '9992223333'),
(3, '9993334444'),
(4, '9994445555'),
(5, '9995556666');

-- Insert Address
INSERT INTO Address (S_ID, City, State, Pin_Code) VALUES
(1, 'Musact', 'MCT', '10001'),
(2, 'Suhar', 'SUH', '90001'),
(3, 'Salalah', 'SLL', '60601'),
(4, 'Duqm', 'DQ', '77001'),
(5, 'Barka', 'BK', '85001');

-- Insert Courses
INSERT INTO Course (Duration, Course_Name, Department_ID) VALUES
('01:00:00', 'BSc Computer Science', 1),
('01:30:00', 'BSc Mathematics', 2),
('02:00:00', 'BSc Physics', 3);

-- Update Students with Course_ID
UPDATE Student SET Course_ID = 1 WHERE S_ID IN (1, 4);
UPDATE Student SET Course_ID = 2 WHERE S_ID IN (2, 5);
UPDATE Student SET Course_ID = 3 WHERE S_ID = 3;

-- Insert StudentCourse
INSERT INTO StudentCourse (S_ID, Course_ID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 1),
(5, 2);

-- Insert Exams
INSERT INTO Exams (Room, Date, Time, Department_ID) VALUES
('R101', '2025-06-01', '09:00:00', 1),
('R202', '2025-06-02', '10:00:00', 2),
('R303', '2025-06-03', '11:00:00', 3);