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
insert into Schedules(route_id , vehicle_id , departure_time, arrival_time, fare)
values(4,3,'2026-04-10 10:30:00', '2026-04-10 20:00:00' , 455.80),
      (5,2,'2026-04-11 11:30:00', '2026-04-11 21:00:00' , 500.0),
      (1,5,'2026-05-10 08:30:00', '2026-05-10 18:00:00' , 875.80),
      (2,4,'2026-06-11 21:30:00', '2026-06-12 05:00:00' , 445.50),
      (3,1,'2026-08-19 09:30:00', '2026-08-19 20:00:00' , 2455.80);

