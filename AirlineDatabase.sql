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

--add Leg_No as a foreign key to LegInstance table
alter table LegInstance
add Leg_No int, foreign key (Leg_No) references FlightLeg(Leg_No)

--add Number as a foreign key to FlightLeg table
alter table FlightLeg
add Number int Not Null, foreign key (Number) references Flight(Number)
