create database DidiTest;

create table DidiTest.Restaurant(
       restaurant_id varchar(16) primary key,
       genre_name varchar(100),
       area_name varchar(100),
       latitude varchar(15),
       longitude varchar(15)
);

create table DidiTest.Visitor(
       restaurant_id varchar(16),
       visit_datetime datetime not null,
       reserve_datetime datetime not null,
       reserve_visitors int not null,
       foreign key (restaurant_id)
       references Restaurant(restaurant_id)
);

create table DidiTest.JapaneseDate(
       calendar_date date not null,
       week_day varchar (10) not null,
       holiday_flag bit not null
);

