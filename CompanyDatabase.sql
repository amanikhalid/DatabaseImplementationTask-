--create database
create database company;
--use database
use company;
--create Employee table
create table Employee (
Ssn int Not Null PRIMARY KEY identity(1,1),
Fname VARCHAR(15) Not Null,
Lname VARCHAR(15) Not Null,
Minit VARCHAR(15) Not Null,
Bdate DATE Not Null,
Address VARCHAR(50) Not Null,
Sex VARCHAR(15) Not Null,
Salary int Constraint CheckEmployeeSalary CHECK (Salary between 500 and 2000),
Supper_ssn int, foreign key (Supper_ssn) references Employee(Ssn));

--create Department table
create table Department (
Dnumber int Not Null PRIMARY KEY identity(1,1),
Dname VARCHAR(20) Not Null UNIQUE,
Mgr_ssn int, foreign key (Mgr_ssn) references Employee(Ssn),
Mgr_Start_Date DATE );

--create Dept_Locations table
create table Dept_Location (
Dnumber int, foreign key (Dnumber) references Department(Dnumber),
Dlocation VARCHAR(50) Not Null,
Primary key (Dnumber, Dlocation));

--create Project table
create table Project (
Pnumber int Not Null PRIMARY KEY identity(1,1),
Pname VARCHAR(20) Not Null,
Plocation VARCHAR(50) Not Null,
Dnum int, foreign key (Dnum) references Department(Dnumber));

--create Work_On table
create table Work_On (
Essn int, foreign key (Essn) references Employee(Ssn),
Pno int, foreign key (Pno) references Project(Pnumber),
Hours DECIMAL(4,2) CHECK (Hours BETWEEN 0 AND 24),
Primary Key (Essn,Pno));

--create Dependent table
create table Dependent (
Dependent_name VARCHAR(20) Not Null,
Essn int, foreign key (Essn) references Employee(Ssn),
Sex VARCHAR (20) Not Null,
Bdate DATE,
Relationship VARCHAR (50) Not Null,
Primary Key (Essn, Dependent_name)); 


--------------------------

--Insert Employees
Insert Into Employee (Fname, Lname, Minit, Bdate, Address, Sex, Salary, Super_ssn) VALUES
('Amani' , 'Khalid' , 'A' , '1999-11-02', '123 Main St' , 'F' , 1500 , 1), 
('Reema' , 'Sulaiman' , 'B' , '1998-03-17', '565 Elm St' , 'F' , 1000 , 1), 
('Farid' , 'Sameer' , 'C' , '1999-09-02', '406 Main St' , 'M' , 2000 , 1), 
('Thanyia' , 'Salim' , 'D' , '1987-09-12', '89 Maple St' , 'F' , 2000 , 2), 
('Somou' , 'Husni' , 'E' , '1996-12-12', '229 Pine St' , 'F' , 1900 , 2);

-- Insert Departments
INSERT INTO Department (Dname, Mgr_ssn, Mgr_Start_Date)
VALUES
('HR', 1, '2023-09-11'),
('IT', 2, '2021-06-15'),
('Finance', 3, '2022-03-23');

-- Insert Dept_Locations
INSERT INTO Dept_Location (Dnumber, Dlocation)
VALUES
(1, 'Muscat'),
(2, 'Suhar'),
(3, 'Salalah'),
(3, 'Sur');

-- Insert Projects
INSERT INTO Project (Pname, Plocation, Dnum)
VALUES
('Recruitment System', 'Muscat', 1),
('Website Redesign', 'Suhar', 2),
('Budget Planning', 'Salalah', 3),
('Payroll System', 'Sur', 3);

-- Insert Work_On
INSERT INTO Work_On (Essn, Pno, Hours)
VALUES
(1, 1, '05:00'),
(2, 2, '07:30'),
(3, 2, '04:00'),
(4, 3, '06:00'),
(5, 4, '08:00');

-- Insert Dependents
INSERT INTO Dependent (Dependent_name, Essn, Sex, Bdate, Relationship)
VALUES
('Razan', 1, 'F', '2010-05-15', 'Daughter'),
('Fahad', 2, 'M', '2012-08-22', 'Son'),
('Dana', 3, 'F', '2011-03-18', 'Spouse'),
('Warda', 4, 'F', '2015-07-30', 'Daughter'),
('Tariq', 5, 'M', '2008-10-10', 'Son');