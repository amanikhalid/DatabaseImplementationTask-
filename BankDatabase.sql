--create database
create database Banking; 

--use database
use Banking; 

--create Branch table
create table Branch (
Branch_ID int Not Null PRIMARY KEY identity(1,1),
Address VARCHAR(50) Not Null);

--create BranchPhone table
create table BranchPhone (
Branch_ID int, foreign key (Branch_ID) references Branch(Branch_ID),
Phone VARCHAR(20) Not Null,
Primary key (Branch_ID, Phone));

--create Employee table 
create table Employee (
Employee_ID int Not Null PRIMARY KEY identity(1,1),
Name VARCHAR(20) Not Null,
Position VARCHAR(50) Not Null,
Branch_ID int, foreign key (Branch_ID) references Branch(Branch_ID));

--create Loan table 
create table Loan (
Loan_ID int Not Null PRIMARY KEY identity(1,1),
Amount Float(7)Not Null,
LType VARCHAR(50) Not Null,
Issue_Date Date Not Null,
Employee_ID int, foreign key (Employee_ID) references Employee(Employee_ID)); 

--create Customers table
create table Customers (
Customer_ID int Not Null PRIMARY KEY identity(1,1),
Name VARCHAR(20) Not Null,
Date_Of_Birth Date Not Null,
Issue_Date Date Not Null,
Action_Type VARCHAR(50) Not Null,
Loan_ID int, foreign key (Loan_ID) references Loan(Loan_ID),
Employee_ID int, foreign key (Employee_ID) references Employee(Employee_ID));

--create CustomersPhone table
create table CustomersPhone (
Customer_ID int, foreign key (Customer_ID) references Customers(Customer_ID),
Phone VARCHAR(20) Not Null,
Primary key (Customer_ID, Phone));

--create Accounts table 
create table Accounts (
Account_Number int Not Null PRIMARY KEY identity(1,1), 
Balance Float(7) Not Null,
AType VARCHAR(50) Not Null,
Date_Of_Creation DATE Not Null,
Customer_ID int, foreign key (Customer_ID) references Customers(Customer_ID));

--create Transaction table
create table Transactions (
Transaction_ID int Not Null PRIMARY KEY identity(1,1), 
TDate DATE Not Null, 
Amount Float(7) Not Null,
Account_Number int, foreign key (Account_Number) references Accounts(Account_Number));

--create TransactionType table
create table TransactionType (
Transaction_ID int, foreign key (Transaction_ID) references Transactions(Transaction_ID),
TType VARCHAR(50) Not Null,
Primary key (Transaction_ID, TType));

----------------------------

--add Customer_ID as a foreign key in Loan table
alter table Loan 
add Customer_ID int, foreign key (Customer_ID) references Customers(Customer_ID)



