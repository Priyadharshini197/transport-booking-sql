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
      (5,2,3589.3),
      (2,4 ,456.09),
      (3,5, 345.87),
      (4,1 , 56.98);
