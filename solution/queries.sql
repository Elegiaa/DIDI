-- SQL queries

--Obtengo los restaurantes que abrieron
select Restaurant.restaurant_id, Restaurant.latitude, Restaurant.longitude, visit_datetime, holiday_flag  from Restaurant inner join Visitor on Restaurant.restaurant_id = Visitor.restaurant_id inner join JapaneseDate on date(Visitor.visit_datetime) = JapaneseDate.calendar_date where holiday_flag =0x01;

-- Sumo para tener únicas fechas
select Restaurant.restaurant_id, Restaurant.latitude, Restaurant.longitude, visit_datetime, holiday_flag, sum(reserve_visitors) as total_visitors  from Restaurant inner join Visitor on Restaurant.restaurant_id = Visitor.restaurant_id inner join JapaneseDate on date(Visitor.visit_datetime) = JapaneseDate.calendar_date where holiday_flag =0x01 group by restaurant_id, visit_datetime;

-- quito date time
select Restaurant.restaurant_id, Restaurant.latitude, Restaurant.longitude, holiday_flag, sum(reserve_visitors) as total_visitors  from Restaurant inner join Visitor on Restaurant.restaurant_id = Visitor.restaurant_id inner join JapaneseDate on date(Visitor.visit_datetime) = JapaneseDate.calendar_date where holiday_flag =0x01 group by restaurant_id;

-- 1) Proper answer
-- Write the SQL queries necessary to generate a list of the five restaurants that have
-- the highest average number of visitors on holidays. The result table should also contain
-- that average per restaurant.
select Restaurant.restaurant_id,
       Restaurant.genre_name,
       Restaurant.area_name,
       Restaurant.latitude,
       Restaurant.longitude,
       sum(reserve_visitors) as total_visitors
       from Restaurant
       inner join Visitor
       on Restaurant.restaurant_id = Visitor.restaurant_id
       inner join JapaneseDate
       on date(Visitor.visit_datetime) = JapaneseDate.calendar_date
       where holiday_flag =0x01
       group by restaurant_id
       order by total_visitors desc
       limit 5;



-- Number of days of the week in dates
select JapaneseDate.week_day, count(JapaneseDate.week_day) from JapaneseDate group by JapaneseDate.week_day;

-- 2) Proper answer
-- Use SQL to discover which day of the week there are usually more visitors on
-- average in restaurants
select JapaneseDate.week_day,
       sum(Visitor.reserve_visitors) as total_visitors,
       sum(Visitor.reserve_visitors)/74 as average
       from JapaneseDate
       inner join Visitor
       on date(Visitor.visit_datetime) = JapaneseDate.calendar_date
       group by JapaneseDate.week_day order by average desc;


-- 3) solution
-- How was the percentage of growth of the amount of visitors week over week for the
-- last four weeks of the data
select week(Visitor.visit_datetime) as Week,
      sum(Visitor.reserve_visitors) as Total_Visitors,
      (sum(Visitor.reserve_visitors) / LAG(sum(Visitor.reserve_visitors))
      over (order by week(visit_datetime) asc) - 1)* 100
      from Visitor group by week(Visitor.visit_datetime) order by Week desc limit 4;
