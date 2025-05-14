-- Create database
create database hotel;

-- use database
use Hotel;

-- create Customers table
create table Customer(
C_ID int NOT NULL PRIMARY KEY identity(1,1),
C_Name VARCHAR(20) NOT NULL ,
Email VARCHAR(50) NOT NULL);

-- create CustomersPhone table
create table CustomersPhone(
C_ID int NOT NULL, foreign key (C_ID) references Customer(C_ID),
Phone VARCHAR(20) NOT NULL ,
Primary key (C_ID,Phone));

-- create Staff table
create table Staff(
S_ID int NOT NULL PRIMARY KEY identity(1,1),
S_Name VARCHAR(20) NOT NULL ,
Job_Title VARCHAR(50) NOT NULL ,
Salary int Constraint Ck_Emp_Sal CHECK (Salary > 0));

-- create Branch table
create table Branch (
Branch_ID int NOT NULL PRIMARY KEY identity(1,1),
B_Name  VARCHAR(20) NOT NULL ,
Location VARCHAR(50) NOT NULL ,
S_ID int NOT NULL , foreign key (S_ID) references Staff(S_ID));

-- create Booking table 
create table Booking (
Booking_ID int NOT NULL PRIMARY KEY identity(1,1),
Check_In_Date Date NOT NULL,
Check_Out_Date Date NOT NULL,
C_ID int NOT NULL, foreign key (C_ID) references Customer(C_ID),
S_ID int NOT NULL , foreign key (S_ID) references Staff(S_ID));


-- create Room table
create table Room (
Room_Number int NOT NULL PRIMARY KEY identity(1,1),
R_Type VARCHAR(20) NOT NULL ,
Nightly_rate int Not null CHECK (Nightly_rate BETWEEN 1 AND 5),
CheckAvailability nvarchar(10) check (CheckAvailability In ('Available','NotAvailable')),
Branch_ID int NOT NULL ,foreign key (Branch_ID) references Branch(Branch_ID),
C_ID int NOT NULL, foreign key (C_ID) references Customer(C_ID),
Booking_ID int NOT NULL,foreign key (Booking_ID) references Booking(Booking_ID));