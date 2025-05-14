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

-----------------------------

INSERT INTO Branch (Address) VALUES
('Muscat, Ruwi'),
('Salalah, City Center'),
('Sohar, Corniche Road');

INSERT INTO BranchPhone (Branch_ID, Phone) VALUES
(1, '968-24567890'),
(2, '968-23211234'),
(3, '968-26889900');


INSERT INTO Employee (Name, Position, Branch_ID) VALUES
('Aisha Al Riyami', 'Loan Officer', 1),
('Fahad Al Amri', 'Teller', 2),
('Noura Al Hinai', 'Branch Manager', 3);

INSERT INTO Loan (Amount, LType, Issue_Date, Employee_ID) VALUES
(15000.00, 'Personal', '2024-12-10', 1),
(32000.00, 'Car Loan', '2025-01-20', 2),
(50000.00, 'Home Loan', '2025-03-05', 3);

INSERT INTO Customers (Name, Date_Of_Birth, Issue_Date, Action_Type, Loan_ID, Employee_ID) VALUES
('Khalid Al Balushi', '1990-04-15', '2025-01-10', 'Opened Account', 1, 1),
('Laila Al Farsi', '1987-08-09', '2025-01-25', 'Loan Approval', 2, 2),
('Salem Al Zadjali', '1995-02-20', '2025-03-10', 'Opened Account', 3, 3);

INSERT INTO CustomersPhone (Customer_ID, Phone) VALUES
(1, '968-91111222'),
(2, '968-92222333'),
(3, '968-93333444');

INSERT INTO Accounts (Balance, AType, Date_Of_Creation, Customer_ID) VALUES
(3000.00, 'Savings', '2025-01-11', 1),
(7000.00, 'Checking', '2025-01-26', 2),
(1500.00, 'Savings', '2025-03-11', 3);

INSERT INTO Transactions (TDate, Amount, Account_Number) VALUES
('2025-04-01', 500.00, 1),
('2025-04-03', 700.00, 2),
('2025-04-05', 200.00, 3);

INSERT INTO TransactionType (Transaction_ID, TType) VALUES
(1, 'Deposit'),
(2, 'Withdrawal'),
(3, 'Deposit');

UPDATE Loan SET Customer_ID = 1 WHERE Loan_ID = 1;
UPDATE Loan SET Customer_ID = 2 WHERE Loan_ID = 2;
UPDATE Loan SET Customer_ID = 3 WHERE Loan_ID = 3;


