--create database

create database Airline;

--use database
use Airline;

--create Airport table
create table Airport (
Airport_Code int Not Null PRIMARY KEY identity(1,1),
City VARCHAR(50) Not Null,
State VARCHAR(50) Not Null,
Name VARCHAR(50) Not Null);

--create AirplaneType table 
create table AirplaneType (
Type_Name int Not Null PRIMARY KEY identity(1,1),
Company VARCHAR(50) Not Null,
Max_Seats VARCHAR(50) Not Null,
Airport_Code int, foreign key (Airport_Code) references Airport(Airport_Code));


--create Airplane_Airport table
create table Airplane_Airport (
Airport_Code int, foreign key (Airport_Code) references Airport(Airport_Code),
Type_Name int, foreign key (Type_Name) references AirplaneType(Type_Name),
PRIMARY KEY ( Airport_Code , Type_Name)); 

--create Airplane table
create table Airplane (
Airplane_ID int Not Null PRIMARY KEY identity(1,1),
Total_No_Of_Seats VARCHAR(50) Not Null,
Type_Name int, foreign key (Type_Name) references AirplaneType(Type_Name));

--create LegInstance table
create table LegInstance (
LegDate Date Not Null PRIMARY KEY,
No_Of_Avail_Seats int Not Null,
Dep_Time Time Not Null,
Arr_Time Time Not Null,
Airport_Code int, foreign key (Airport_Code) references Airport(Airport_Code));

--create Seats table
create table Seats (
Seat_No int Not Null PRIMARY KEY identity(1,1),
No_Of_Avail_Seats int Not Null,
LegDate Date Not Null, foreign key (LegDate) references LegInstance(LegDate));

--create Reservation table 
create table Reservation (
Seat_No int, foreign key (Seat_No) references Seats(Seat_No),
RDate Date Not Null,
Customer_name VARCHAR(50) Not Null,
Cphone VARCHAR(20) Not Null,
LegDate Date Not Null, foreign key (LegDate) references LegInstance(LegDate),
PRIMARY KEY ( Seat_No , LegDate));

--create FlightLeg table
create table FlightLeg (
Leg_No int Not Null PRIMARY KEY identity(1,1),
Scheduled_dep_time Time Not Null,
Scheduled_arr_time Time Not Null,
Airport_Code int, foreign key (Airport_Code) references Airport(Airport_Code));

--create Flight table
create table Flight (
Number int Not Null PRIMARY KEY identity(1,1),
Airline VARCHAR(50) Not Null,
Weekdays int Not Null CHECK (weekdays BETWEEN 1 AND 7));

--create Fare table
create table Fare (
Code int Not Null PRIMARY KEY identity(1,1),
Amount Float(5)Not Null,
Relations VARCHAR(20) Not Null,
Number int Not Null, foreign key (Number) references Flight(Number));

---------------------------------------------

--add Leg_No as a foreign key to LegInstance table
alter table LegInstance
add Leg_No int, foreign key (Leg_No) references FlightLeg(Leg_No)

--add Number as a foreign key to FlightLeg table
alter table FlightLeg
add Number int Not Null, foreign key (Number) references Flight(Number)

-- Change VARCHAR seat fields to INT
ALTER TABLE AirplaneType ALTER COLUMN Max_Seats INT;
ALTER TABLE Airplane ALTER COLUMN Total_No_Of_Seats INT;

-- Add Leg_No to LegInstance for uniqueness
ALTER TABLE LegInstance DROP CONSTRAINT PK__LegInstance;  -- Only if the constraint is named
-- Then:
ALTER TABLE LegInstance ADD PRIMARY KEY (Leg_No, LegDate);


-- If keeping INT, rename Type_Name to Type_ID
EXEC sp_rename 'AirplaneType.Type_Name', 'Type_ID', 'COLUMN';
EXEC sp_rename 'Airplane.Type_Name', 'Type_ID', 'COLUMN';
EXEC sp_rename 'Airplane_Airport.Type_Name', 'Type_ID', 'COLUMN';

-----------------------------------------------

INSERT INTO Airport (City, State, Name) VALUES
('Muscat', 'Muscat', 'Muscat International Airport'),
('Dubai', 'Dubai', 'Dubai International Airport'),
('Doha', 'Doha', 'Hamad International Airport');


INSERT INTO AirplaneType (Company, Max_Seats, Airport_Code) VALUES
('Boeing', 180, 1),
('Airbus', 220, 2),
('Embraer', 120, 3);



INSERT INTO Airplane (Total_No_Of_Seats, Type_ID) VALUES
(180, 1),
(220, 2),
(120, 3);


INSERT INTO Airplane_Airport (Airport_Code, Type_ID) VALUES
(1, 1),
(2, 2),
(3, 3),
(1, 2),
(2, 3);


INSERT INTO Flight (Airline, Weekdays) VALUES
('Oman Air', 1),
('Emirates', 3),
('Qatar Airways', 5);



INSERT INTO FlightLeg (Scheduled_dep_time, Scheduled_arr_time, Airport_Code, Number) VALUES
('07:00:00', '09:00:00', 1, 1), -- Muscat
('10:00:00', '12:30:00', 2, 2), -- Dubai
('14:00:00', '16:30:00', 3, 3); -- Doha



INSERT INTO LegInstance (LegDate, No_Of_Avail_Seats, Dep_Time, Arr_Time, Airport_Code, Leg_No) VALUES
('2025-06-10', 160, '07:00:00', '09:00:00', 1, 1),
('2025-06-11', 200, '10:00:00', '12:30:00', 2, 2),
('2025-06-12', 100, '14:00:00', '16:30:00', 3, 3);


INSERT INTO Seats (No_Of_Avail_Seats, LegDate) VALUES
(160, '2025-06-10'),
(200, '2025-06-11'),
(100, '2025-06-12');

INSERT INTO Reservation (Seat_No, RDate, Customer_name, Cphone, LegDate) VALUES
(1, '2025-06-01', 'Alaa Al Zadjali', '968-90123456', '2025-06-10'),
(2, '2025-06-02', 'Khalid Al Mazrouei', '971-502345678', '2025-06-11'),
(3, '2025-06-03', 'Fatma Al Mamari', '968-33112233', '2025-06-12');


INSERT INTO Fare (Amount, Relations, Number) VALUES
(150.00, 'Economy', 1),
(250.00, 'Business', 2),
(300.00, 'First', 3);

