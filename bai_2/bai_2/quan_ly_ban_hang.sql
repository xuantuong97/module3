create database quan_ly_ban_hang;
use quan_ly_ban_hang;

create table customer(
c_id int primary key,
c_name varchar(50),
c_age int
);

create table orders(
o_id int primary key,
c_id int,
o_date date,
o_total float,
foreign key (c_id) references customer(c_id)
);

create table product(
p_id int primary key,
p_name varchar(50),
p_price float
);

create table order_detail(
o_id int,
p_id int,
quantity int,
primary key (o_id, p_id),
foreign key (o_id) references orders(o_id),
foreign key (p_id) references product(p_id)
);


