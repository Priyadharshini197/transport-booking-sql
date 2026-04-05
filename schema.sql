CREATE DATABASE transport_booking;
USE transport_booking;
CREATE TABLE Stations(station_id INT PRIMARY KEY auto_increment, station_name VARCHAR(50) NOT NULL ,
city VARCHAR(50) NOT NULL , state VARCHAR(50) NOT NULL);

CREATE TABLE Vehicles (vehicle_id INT PRIMARY KEY auto_increment , vehicle_number varchar(10) NOT NULL , 
type ENUM('bus' , 'train') , total_seats INT NOT NULL );

CREATE TABLE Routes (route_id INT PRIMARY KEY auto_increment , origin_station_id INT NOT NULL,
destination_station_id INT NOT NULL , distance_km decimal(8,2),
foreign key(origin_station_id) references Stations(station_id),
foreign key(destination_station_id) references Stations(station_id)
);

CREATE TABLE Schedules (schedule_id INT PRIMARY KEY auto_increment , 
route_id INT not null,
vehicle_id INT not null,
foreign key(route_id) references Routes(route_id),
foreign key(vehicle_id) references Vehicles(vehicle_id),
departure_time datetime,
arrival_time datetime,
fare decimal(6,2));