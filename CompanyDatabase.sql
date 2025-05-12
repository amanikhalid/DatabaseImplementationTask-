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
Super_ssn int , 
Supper_ssn int, foreign key (Supper_ssn) references Employee(Ssn));

--create Department table
create table Department (
Dnumber int Not Null PRIMARY KEY identity(1,1),
Dname VARCHAR(20) Not Null,
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
Hours Time,
Primary Key (Essn,Pno));

--create Dependent table
create table Dependent (
Dependent_name VARCHAR(20) Not Null,
Essn int, foreign key (Essn) references Employee(Ssn),
Sex VARCHAR (20) Not Null,
Bdate DATE,
Relationship VARCHAR (50) Not Null,
Primary Key (Essn, Dependent_name)); 
