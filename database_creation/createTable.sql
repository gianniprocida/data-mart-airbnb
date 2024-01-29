create database data_mart_airbnb;

use data_mart_airbnb;


create table if not exists User_addresses (id int not null,street_name varchar(200),house_number int not null,city varchar(100),
country varchar(100), zip_code int not null);

create table if not exists Listing_addresses (id int not null,street_name varchar(100),house_number int not null,city varchar(50),
country varchar(50), zip_code int not null);


create table if not exists Users (id int not null,first_name varchar(100),last_name varchar(100),email varchar(100),phone_number varchar(100),
DoB date,gender enum('Male','Female'),country varchar(100),user_type enum('host','guest'));


create table if not exists Listings (id int not null, user_id int not null,title varchar(200),property_type varchar(100),
room_type varchar(100),accommodates int not null, bedrooms int not null, bathrooms int not null,
price_per_night decimal(8,4), address_id int not null);

create table if not exists Reviews (id int not null,listing_id int not null,user_id int not null, content varchar(150),
review_date date,rating int not null,host_response varchar(100));

create table if not exists Amenities (id int not null,listing_id int not null,name varchar(150),
description varchar(200));

/*unfortunately, this version of mysql coesn't support this : check (sender_id <> recipient_id)*/
create table if not exists Messages (id int not null,sender_id int not null,recipient_id int not null, content varchar(200),date_sent date);

create table if not exists Payments (id int not null,payment_method varchar(100),payment_date date,amount decimal(12,4));

create table if not exists Reservations (id int not null,guest_id int not null,listing_id int not null, check_in_date date,check_out_date date,total_cost decimal(8,4));

create table if not exists ListingsAmenities (id int not null,listing_id int not null,amenities_id int not null);


