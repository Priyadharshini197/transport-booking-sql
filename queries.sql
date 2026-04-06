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

create view route_revenue as
select s.station_name as origin,
    s2.station_name as destination,
    sum(sc.fare) as  revenue
from Schedules sc 
join Routes r on sc.route_id = r.route_id
join Stations s on r.origin_station_id = s.station_id
join Stations s2 on r.destination_station_id = s2.station_id
group by s.station_name , s2.station_name
order by revenue DESC;
select * from route_revenue;

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

###### 6.Available seats per schedule

create view schedule_availability as
select sc.schedule_id,
    s.station_name as origin,
    s2.station_name as destination,
    v.total_seats,
    count(b.booking_id) as booked_seats,
    (v.total_seats - count(b.booking_id)) as available_seats
from Schedules sc
join Routes r on sc.route_id = r.route_id
join Stations s on r.origin_station_id = s.station_id
join Stations s2 on r.destination_station_id = s2.station_id
join vehicles v on sc.vehicle_id = v.vehicle_id
left join Bookings b on sc.schedule_id = b.schedule_id
GROUP BY sc.schedule_id, s.station_name, s2.station_name, v.total_seats;
select * from schedule_availability;

###### 7.Top Spending Passenger 

select p.name ,
    sum(sc.fare) as total_spent
from Passengers p 
join Bookings b on p.passenger_id = b.passenger_id
join Schedules sc on b.schedule_id = sc.schedule_id
group by p.name
order by total_spent desc
limit 1 ;

##### 8.Ranking routes by revenue using window function 

select s.station_name as origin ,
    s2.station_name as destination,
    sum(sc.fare) as total_revenue,
    rank() over (order by sum(sc.fare) desc) as revenue_rank
from Schedules sc 
join Routes r on sc.route_id = r.route_id
join Stations s on r.origin_station_id = s.station_id
join stations s2 on r.destination_station_id = s2.station_id
group by s.station_name , s2.station_name
order by revenue_rank;

##### 9.Passenger booking summary

create view passenger_booking_summary as 
select p.name,
    count(b.booking_id) as total_bookings,
    sum(sc.fare) as total_spent
from Passengers p
join Bookings b on p.passenger_id = b.passenger_id
join Schedules sc on sc.schedule_id = b.schedule_id
group by p.name;
select * from passenger_booking_summary

####### 10. Stored procedure example query (given a passenger name show all their bookings with route and fare details)

DELIMITER //
create procedure get_passenger_bookings(in p_name varchar(40))
begin
    select p.name,
        s.station_name as origin,
        s2.station_name as destination,
        sc.fare,
        b.status
    from Passengers p
    join Bookings b on p.passenger_id = b.passenger_id
    join Schedules sc on b.schedule_id = sc.schedule_id
    join Routes r on sc.route_id = r.route_id
    join Stations s on r.origin_station_id = s.station_id
    join Stations s2 on r.destination_station_id = s2.station_id
    where p.name = p_name;
end //
 DELIMITER ;
 Call get_passenger_bookings('Priya');


##### 11. Indexes practice
create index idx_booking_passenger
on bookings(passenger_id);

##### 12.Find routes where revenue is ABOVE average revenue(CTE)
with route_revenue_cte AS (
    select s.station_name as origin,
           s2.station_name as destination,
           SUM(sc.fare) as total_revenue
    from Schedules sc
    join Routes r on sc.route_id = r.route_id
    join Stations s on r.origin_station_id = s.station_id
    join Stations s2 on r.destination_station_id = s2.station_id
    group by s.station_name, s2.station_name
)
select *
from route_revenue_cte
where total_revenue > (select avg(total_revenue) FROM route_revenue_cte)
order by total_revenue DESC;






