####### 1.To find most booked routes

select s.station_name as origin,
s2.station_name as destination,
count(b.booking_id)as total_bookings
from bookings b 
join Schedules sc on b.schedule_id = sc.schedule_id
join Routes r on sc.route_id = r.route_id
join Stations s on r.origin_station_id = s.station_id
join Stations s2 on r.destination_station_id = s2.station_id
group by s.station_name , s2.station_name
order by total_bookings desc;

####### 2.Revenue per route

select s.station_name as origin,
s2.station_name as destination,
sum(sc.fare) as  revenue
from Schedules sc 
join Routes r on sc.route_id = r.route_id
join Stations s on r.origin_station_id = s.station_id
join Stations s2 on r.destination_station_id = s2.station_id
group by s.station_name , s2.station_name
order by revenue DESC;

###### 3.Busy travel month

select MONTHNAME(b.booking_date)as month,
count(booking_id) as total_bookings
from Bookings b 
group by month
order by total_bookings DESC;

###### 4.Passengers who never booked

select p.name,p.email
from passengers p
left join Bookings b on p.passenger_id = b.passenger_id
where b.booking_id is null;

###### 5.Cancellation rate per vehicle 

select v.vehicle_number , v.type,
count(b.booking_id) as total_bookings,
sum(case when b.status = 'cancelled' then 1 else 0 end)as cancellations,
round(sum(case when b.status = 'cancelled' then 1 else 0 end) * 100.0 / count(b.booking_id) , 2) as cancellation_rate
from Bookings b
join Schedules sc on b.schedule_id = sc.schedule_id
join Vehicles v on sc.vehicle_id = v.vehicle_id
group by v.vehicle_number , v.type
order by cancellation_rate desc;


