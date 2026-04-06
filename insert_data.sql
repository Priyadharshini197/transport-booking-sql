insert into Stations ( station_name , city , state) 
values ('Melur' , 'Madurai' , 'Tamilnadu'),
       ('Attukulam' ,'Sivagangai' , 'Tamilnadu'),
       ('KCBT' , 'Chennai' , 'Tamilnadu'),
       ('KK Nagar' , 'Bangalore' , 'Karnataka'),
       ('Tambaram' , 'Chennai' , 'Tamilnadu');
insert into Vehicles(vehicle_number , type , total_seats)
values('TN0203','bus',40),
	  ('12121' , 'train', 80),
      ('TN098' , 'bus' , 75),
      ('0202' , 'train' , 100),
      ('TN100' , 'bus' , 50);
insert into routes(origin_station_id , destination_station_id , distance_km)
values(1 , 3 , 405.68),
      (5,2,358.3),
      (2,4 ,456.09),
      (3,5, 345.87),
      (4,1 , 56.98);

insert into Schedules(route_id, vehicle_id, departure_time, arrival_time, fare)
values(4,3,'2026-04-10 10:30:00','2026-04-10 20:00:00',455.80),
      (5,2,'2026-04-11 11:30:00','2026-04-11 21:00:00',500.00),
      (1,5,'2026-05-10 08:30:00','2026-05-10 18:00:00',875.80),
      (2,4,'2026-06-11 21:30:00','2026-06-12 05:00:00',445.50),
      (3,1,'2026-08-19 09:30:00','2026-08-19 20:00:00',2455.80),
      (1,2,'2026-04-15 06:00:00','2026-04-15 15:30:00',875.80),
      (2,3,'2026-05-20 14:00:00','2026-05-20 23:00:00',445.50),
      (3,4,'2026-06-25 07:00:00','2026-06-25 17:00:00',2455.80),
      (4,1,'2026-07-10 09:00:00','2026-07-10 18:30:00',455.80),
      (5,5,'2026-08-05 16:00:00','2026-08-06 02:00:00',500.00);

insert into Passengers(name, email, phone, age)
values('Priya','priya19@gmail.com','9876543210',22),
      ('Dharshini','dharshini@gmail.com','9576432134',23),
      ('Mangai','mangai@gmail.com','8765432291',32),
      ('Karuppiah','karuppiah@gmail.com','9624567899',42),
      ('Sai','sai@gmail.com','9876245690',27),
      ('Baba','baba@gmail.com','9876546789',35),
      ('Ravi','ravi@gmail.com','9786453210',29),
      ('Meena','meena@gmail.com','9654321870',45),
      ('Arjun','arjun@gmail.com','9543218760',31),
      ('Kavya','kavya@gmail.com','9432187650',26),
      ('Muthu','muthu@gmail.com','9321876540',38),
      ('Selvi','selvi@gmail.com','9218765430',33);
      
insert into Bookings(schedule_id, passenger_id, seat_number, booking_date, status)
values(3,2,'23A','2026-04-10 08:30:00','confirmed'),
      (4,3,'26B','2026-05-10 09:30:00','confirmed'),
      (5,1,'45B','2026-04-11 20:30:00','cancelled'),
      (2,4,'67A','2026-06-10 23:30:00','confirmed'),
      (1,5,'12U','2026-02-10 07:30:00','cancelled'),
      (1,6,'14A','2026-04-15 07:00:00','confirmed'),
      (2,7,'18B','2026-05-20 10:00:00','confirmed'),
      (3,8,'22C','2026-06-25 06:00:00','cancelled'),
      (4,9,'31A','2026-07-10 08:00:00','confirmed'),
      (5,10,'42B','2026-08-05 15:00:00','confirmed'),
      (6,11,'11A','2026-04-15 05:30:00','confirmed'),
      (6,12,'15C','2026-04-15 05:45:00','cancelled'),
      (7,1,'21B','2026-05-20 13:00:00','confirmed'),
      (7,2,'25A','2026-05-20 13:15:00','confirmed'),
      (8,3,'33C','2026-06-25 06:30:00','confirmed'),
      (8,4,'37A','2026-06-25 06:45:00','cancelled'),
      (9,5,'41B','2026-07-10 08:30:00','confirmed'),
      (9,6,'44A','2026-07-10 08:45:00','confirmed'),
      (10,7,'52C','2026-08-05 15:30:00','cancelled'),
      (10,8,'55A','2026-08-05 15:45:00','confirmed'),
      (1,9,'61B','2026-02-10 07:00:00','confirmed'),
      (2,10,'63A','2026-06-11 21:00:00','cancelled'),
      (3,11,'71C','2026-08-19 09:00:00','confirmed'),
      (4,12,'74A','2026-04-10 10:00:00','confirmed'),
      (5,1,'81B','2026-04-11 20:00:00','cancelled');

