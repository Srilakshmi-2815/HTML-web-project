CREATE database FDS;
use FDS;
create table customers(customer_id int,customer_name varchar(100),
email varchar(100) unique,phone_no bigint,password varchar(100),created_at datetime,primary key(customer_id));
INSERT INTO customers (customer_id, customer_name, email, phone_no, password, created_at) VALUES
(102, 'Guna Reddy', 'guna.reddy@gmail.com', 9876543210, 'Guna@123', '2026-01-12 09:15:00'),
(101, 'Virat Kohli', 'virat.kohli@gmail.com', 9876543219, 'Virat@123', '2026-10-14 07:50:00'),
(103, 'Lavanya Reddy', 'lavanya.reddy@gmail.com', 9876543211, 'Lavanya@123', '2026-02-08 10:30:00'),
(104, 'Shivatmika', 'shivatmika@gmail.com', 9876543212, 'Shiva@123', '2026-03-19 14:20:00'),
(107, 'Chandra Shekhar', 'chandra.shekhar@gmail.com', 9876543213, 'Chandra@123', '2026-04-05 16:45:00'),
(106, 'Sri Lakshmi', 'srilakshmi@gmail.com', 9876543214, 'Sri@123', '2026-05-11 08:10:00'),
(109, 'Anil Kumar', 'anilkumar@gmail.com', 9876543215, 'Anil@123', '2026-06-22 11:55:00'),
(110, 'Yamuna', 'yamuna@gmail.com', 9876543216, 'Yamuna@123', '2026-07-03 13:40:00'),
(108, 'Gopi', 'gopi@gmail.com', 9876543217, 'Gopi@123', '2026-08-17 17:25:00'),
(105, 'Devendra', 'devandra@gmail.com', 9876543218, 'Dev@123', '2026-09-28 19:30:00');
select * from customers;
select count(*) from customers;
Create table customer_address(customer_address_id int primary key,
customer_id int,foreign key(customer_id) references customers(customer_id),
house_no int,street varchar(100),city varchar(100),state varchar(100),pincode bigint);
insert into customer_address values(1, 102, 12, 'MG Road', 'Bengaluru', 'Karnataka', 560001),
(2, 101, 45, 'Ring Road', 'Hyderabad', 'Telangana', 500081),
(3, 103, 78, 'Anna Nagar', 'Chennai', 'Tamil Nadu', 600040),
(4, 104, 23, 'Beach Road', 'Visakhapatnam', 'Andhra Pradesh', 530002),
(5, 107, 101, 'Lalbagh Road', 'Mysuru', 'Karnataka', 570001),
(6, 106, 56, 'Park Street', 'Kolkata', 'West Bengal', 700016),
(7, 109, 89, 'Civil Lines', 'Nagpur', 'Maharashtra', 440001),
(8, 110, 34, 'Nehru Street', 'Coimbatore', 'Tamil Nadu', 641001),
(9, 108, 67, 'Gandhi Road', 'Vijayawada', 'Andhra Pradesh', 520010),
(10, 105, 90, 'Station Road', 'Pune', 'Maharashtra', 411001);
select * from customer_address;
create table Restaurants(restaurant_id int primary key,
restaurant_name varchar(100),phone_no bigint,address varchar(100),
city varchar(100),state varchar(100),pincode int,rating decimal(10,2));
insert into Restaurants values
(201, 'Bengaluru Bites', 9876500001, '15 MG Road', 'Bengaluru', 'Karnataka', 560001, 4.50),
(202, 'Hyderabad Paradise', 9876500002, '48 Ring Road', 'Hyderabad', 'Telangana', 500081, 2.80),
(203, 'Chennai Dosa House', 9876500003, '82 Anna Nagar', 'Chennai', 'Tamil Nadu', 600040, 3.60),
(204, 'Vizag Seafood', 9876500004, '25 Beach Road', 'Visakhapatnam', 'Andhra Pradesh', 530002, 4.20),
(205, 'Mysore Spice', 9876500005, '105 Lalbagh Road', 'Mysuru', 'Karnataka', 570001, 1.90),
(206, 'Kolkata Flavours', 9876500006, '60 Park Street', 'Kolkata', 'West Bengal', 700016, 3.20),
(207, 'Nagpur Tadka', 9876500007, '92 Civil Lines', 'Nagpur', 'Maharashtra', 440001, 2.50),
(208, 'Coimbatore Cafe', 9876500008, '36 Nehru Street', 'Coimbatore', 'Tamil Nadu', 641001, 4.80),
(209, 'Vijayawada Kitchen', 9876500009, '70 Gandhi Road', 'Vijayawada', 'Andhra Pradesh', 520010, 3.90),
(210, 'Pune Spice Hub', 9876500010, '95 Station Road', 'Pune', 'Maharashtra', 411001, 4.90);
select * from restaurants;
create table Menu_items(item_id int primary key,restaurant_id int,
foreign key(restaurant_id) references restaurants(restaurant_id),
name varchar(100),price int,status varchar(100));
insert into Menu_items values
(301, 201, 'Chicken Biryani', 280, 'Available'),
(302, 202, 'Mutton Biryani', 350, 'Available'),
(303, 203, 'Masala Dosa', 120, 'Available'),
(304, 204, 'Fish Fry', 320, 'Out of Stock'),
(305, 205, 'Veg Meals', 180, 'Available'),
(306, 206, 'Chicken Roll', 150, 'Available'),
(307, 207, 'Paneer Butter Masala', 240, 'Out of Stock'),
(308, 208, 'Idli Sambar', 90, 'Available'),
(309, 209, 'Prawn Curry', 380, 'Available'),
(310, 210, 'Special Thali', 300, 'Available');
select * from menu_items;
create table orders(order_id int primary key,customer_id int,
foreign key(customer_id) references customers(customer_id),restaurant_id int,
foreign key(restaurant_id) references restaurants(restaurant_id),
address_id int,foreign key(address_id) references customer_address(customer_address_id),
order_date date,status varchar(100),total_amount int,payment_status varchar(100));
insert into orders values
(401, 102, 201, 1, '2026-07-01', 'Delivered', 560, 'Paid'),
(402, 101, 202, 2, '2026-07-02', 'On the Way', 350, 'Paid'),
(403, 103, 203, 3, '2026-07-02', 'Placed', 240, 'Pending'),
(404, 104, 204, 4, '2026-07-03', 'Cancelled', 320, 'Failed'),
(405, 107, 205, 5, '2026-07-03', 'Delivered', 180, 'Paid'),
(406, 106, 206, 6, '2026-07-04', 'On the Way', 450, 'Paid'),
(407, 109, 207, 7, '2026-07-04', 'Placed', 480, 'Pending'),
(408, 110, 208, 8, '2026-07-05', 'Cancelled', 90, 'Failed'),
(409, 108, 209, 9, '2026-07-05', 'Delivered', 760, 'Paid'),
(410, 105, 210, 10, '2026-07-06', 'On the Way', 600, 'Pending');
select * from orders;
create table order_items(order_item_id int primary key,order_id int,foreign key(order_id) references orders(order_id),
item_id int,foreign key(item_id) references menu_items(item_id),quantity int,price_at_time int,total_price int);
insert into Order_Items VALUES
(501, 401, 301, 2, 280, 560),
(502, 402, 302, 1, 350, 350),
(503, 403, 303, 2, 120, 240),
(504, 404, 304, 1, 320, 320),
(505, 405, 305, 1, 180, 180),
(506, 406, 306, 3, 150, 450),
(507, 407, 307, 2, 240, 480),
(508, 408, 308, 1, 90, 90),
(509, 409, 309, 2, 380, 760),
(510, 410, 310, 2, 300, 600);
create table payments(payment_id int primary key,order_id int,foreign key(order_id) references orders(order_id),amount int,payment_method varchar(100),transaction_id bigint unique,payment_status varchar(100),payment_date datetime);
insert into payments values
(601, 401, 560, 'UPI',    100000000001, 'Paid',    '2026-07-01 12:15:30'),
(602, 402, 350, 'Card',   100000000002, 'Paid',    '2026-07-02 09:45:10'),
(603, 403, 240, 'Wallet', 100000000003, 'Pending', '2026-07-02 18:20:45'),
(604, 404, 320, 'UPI',    100000000004, 'Failed',  '2026-07-03 11:05:20'),
(605, 405, 180, 'COD',    100000000005, 'Paid',    '2026-07-03 13:40:55'),
(606, 406, 450, 'Card',   100000000006, 'Paid',    '2026-07-04 17:25:30'),
(607, 407, 480, 'Wallet', 100000000007, 'Pending', '2026-07-04 19:10:15'),
(608, 408, 90,  'UPI',    100000000008, 'Failed',  '2026-07-05 08:50:40'),
(609, 409, 760, 'Card',   100000000009, 'Paid',    '2026-07-05 14:30:25'),
(610, 410, 600, 'COD',    100000000010, 'Pending', '2026-07-06 10:15:00');
create table delivery_partners(partner_id int primary key,name varchar(100),
phone_no bigint unique,vechile_type varchar(100),vechile_number varchar(100),is_active varchar(100));
insert into delivery_partners values
(701, 'Ravi Kumar', 9876501001, 'Bike', 'TS09AB1234', 'Yes'),
(702, 'Suresh Reddy', 9876501002, 'Scooter', 'AP16CD5678', 'Yes'),
(703, 'Kiran Kumar', 9876501003, 'Bike', 'KA01EF2345', 'No'),
(704, 'Ajay Sharma', 9876501004, 'Bike', 'TN10GH6789', 'Yes'),
(705, 'Mahesh Babu', 9876501005, 'Scooter', 'MH12JK3456', 'Yes'),
(706, 'Praveen Kumar', 9876501006, 'Bike', 'WB20LM7890', 'No'),
(707, 'Rahul Verma', 9876501007, 'Bike', 'AP39NP4567', 'Yes'),
(708, 'Arjun Singh', 9876501008, 'Scooter', 'KA05QR8901', 'Yes'),
(709, 'Naveen Reddy', 9876501009, 'Bike', 'TS08ST2345', 'Yes'),
(710, 'Vikram Patel', 9876501010, 'Bike', 'MH14UV6789', 'Yes');
drop table delivery_partners;
create table delivery_partners(partner_id int primary key,app_name varchar(100),website varchar(100),service_type varchar(100),is_active varchar(100));
insert into delivery_partners VALUES
(701, 'Swiggy', 'www.swiggy.com', 'Food Delivery', 'Yes'),
(702, 'Zomato', 'www.zomato.com', 'Food Delivery', 'Yes'),
(703, 'Uber Eats', 'www.ubereats.com', 'Food Delivery', 'No'),
(704, 'Foodpanda', 'www.foodpanda.com', 'Food Delivery', 'No'),
(705, 'Domino''s', 'www.dominos.co.in', 'Restaurant Delivery', 'Yes'),
(706, 'Pizza Hut', 'www.pizzahut.co.in', 'Restaurant Delivery', 'Yes'),
(707, 'EatSure', 'www.eatsure.com', 'Food Delivery', 'Yes'),
(708, 'Magicpin', 'www.magicpin.in', 'Food & Grocery Delivery', 'Yes'),
(709, 'Blinkit', 'www.blinkit.com', 'Quick Commerce', 'Yes'),
(710, 'Zepto Cafe', 'www.zeptonow.com', 'Quick Commerce', 'Yes');
create table deliveries(delivery_id int primary key,order_id int,foreign key(order_id) references orders(order_id),
partner_id int,foreign key(partner_id) references delivery_partners(partner_id),delivery_boy_name varchar(100),
phone_no bigint,assigned_at time,pickup_time time,delivered_at time,status varchar(100));
insert into deliveries values
(801, 401, 701, 'Ravi Kumar',    9876502001, '12:00:00', '12:10:00', '12:45:00', 'Delivered'),
(802, 402, 702, 'Kiran Reddy',   9876502002, '09:15:00', '09:25:00', NULL,        'On the Way'),
(803, 403, 703, 'Suresh Kumar',  9876502003, '18:00:00', NULL,        NULL,        'Assigned'),
(804, 404, 704, 'Ajay Sharma',   9876502004, '10:45:00', NULL,        NULL,        'Cancelled'),
(805, 405, 705, 'Mahesh Babu',   9876502005, '13:20:00', '13:30:00', '14:05:00', 'Delivered'),
(806, 406, 706, 'Naveen Reddy',  9876502006, '17:10:00', '17:20:00', '18:00:00', 'Delivered'),
(807, 407, 707, 'Arjun Singh',   9876502007, '19:00:00', NULL,        NULL,        'Assigned'),
(808, 408, 708, 'Vikram Patel',  9876502008, '08:40:00', NULL,        NULL,        'Cancelled'),
(809, 409, 709, 'Rahul Verma',   9876502009, '14:00:00', '14:10:00', '14:55:00', 'Delivered'),
(810, 410, 710, 'Praveen Kumar', 9876502010, '10:00:00', '10:10:00', NULL,        'On the Way');
create table reviews(review_id int,customer_id int,restaurant_id int,
rating decimal(10,2),comment varchar(200),review_date date,
foreign key(customer_id) references customers(customer_id),foreign key(restaurant_id) references restaurants(restaurant_id));
insert into reviews values
(901, 102, 201, 5, 'Excellent food and quick delivery.', '2026-07-02'),
(902, 101, 202, 2, 'Food was cold and delivery was delayed.', '2026-07-03'),
(903, 103, 203, 4, 'Tasty food and reasonable price.', '2026-07-03'),
(904, 104, 204, 3, 'Average taste but fresh seafood.', '2026-07-04'),
(905, 107, 205, 1, 'Very poor quality and bad service.', '2026-07-04'),
(906, 106, 206, 4, 'Loved the chicken roll.', '2026-07-05'),
(907, 109, 207, 2, 'Food was okay but delivery was very late.', '2026-07-05'),
(908, 110, 208, 5, 'Best breakfast and excellent service.', '2026-07-06'),
(909, 108, 209, 4, 'Delicious food with good packaging.', '2026-07-06'),
(910, 105, 210, 5, 'Amazing taste and highly recommended.', '2026-07-07');
drop table reviews;
use fds;
alter table reviews add column delivery_boy_rating varchar(100);
update reviews set delivery_boy_rating = case review_id 
when 901 then "4.0"
when 902 then "3.5"
when 903 then "4.0"
when 904 then "4.0"
when 905 then "5.0"
when 906 then "4.8"
when 907 then "4.9"
when 908 then "3.8"
when 909 then "3.7"
when 910 then "4.3"
else delivery_boy_rating
END;
Select * from reviews;
select * from order_items;
select quantity  from order_items where  quantity is null;
select * from menu_items;
select m.name,o.quantity from menu_items m inner join order_items o on m.item_id=o.item_id;