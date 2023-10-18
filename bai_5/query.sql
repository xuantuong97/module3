create database demo;
use demo;

create table products (
id int primary key auto_increment,
product_code varchar(20),
product_name varchar(30),
product_price float,
product_amount int,
product_description text,
product_status text);

insert into products values 
(1, 'A', 'sp1', 2000, 10, 'type A', 'in stock'),
(2, 'B', 'sp2', 3000, 10, 'type A', 'in stock'),
(3, 'C', 'sp3', 1000, 10, 'type A', 'in stock'),
(4, 'D', 'sp4', 7000, 10, 'type A', 'in stock'),
(5, 'E', 'sp4', 8000, 10, 'type C', 'in stock'),
(6, 'F', 'sp4', 4000, 10, 'type I', 'in stock');

-- buoc 3
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
alter table products add unique index i_product_code ( product_code);
explain select * from products where product_code = 'A';

-- Tạo Composite Index trên bảng Products
alter table products add index i_composite (product_name, product_price);
explain select * from products where product_name = 'sp2' and product_price = 3000;

-- Nhận xét: sau khi sử dụng index, số lượng rows giảm từ 6 xuống 1. Khi tạo index phức hợp
-- tìm kiếm với điều kiện dùng product_name hoặc product_name and product_price, số lượng rows là 1,
-- tìm kiếm = product_price cho rows là 6.

-- buoc 4
-- tao view 
create view view_1 as 
select product_code, product_name, product_price, product_status
from products;

-- sua doi view
alter view view_1 as
select product_code, product_name
from products;
-- xoa view
drop view view_1;

-- buoc 5
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure get_all()
begin
select * from products;
end //
delimiter ;

-- Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure add_new_product( 
product_code varchar(20),
product_name varchar(30),
product_price float,
product_amount int,
product_description text,
product_status text)
begin 
insert into products (product_code,
product_name,
product_price,
product_amount,
product_description,
product_status) 
values (product_code, product_name, product_price, product_amount, product_description, product_status);
end //
delimiter ;

call add_new_product('P', 'sp9', 9000, 8, 'type V', 'in stock');
select * from products;

-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
create procedure update_status( id int, product_status text)
begin
update products set product_status = product_status
where products.id = id;
end //
delimiter ;

call update_status(1, 'only 3 left');
select * from products;

-- Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure remove_product(id int)
begin
delete from products where products.id = id;
end //
delimiter ;

call remove_product(1);
select * from products;









