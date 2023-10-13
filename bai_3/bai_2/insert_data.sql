use quan_ly_ban_hang;

insert into customer values
(1, 'Minh quan', '10'),
(2, 'Ngoc oanh', '20'),
(3, 'Hong ha', '50');

insert into product values 
(1, 'May giat', '3'),
(2, 'Tu Lanh', '5'),
(3, 'Dieu hoa', '7'),
(4, 'Quat', '1'),
(5, 'Bep dien', '2');

insert into orders values
(1,1,"2006-03-21",null),
(2,2,"2006-03-23",null),
(3,1,"2006-03-16",null);
insert into order_detail values 
(1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),
(3, 1, 8),
(2, 5, 4),
(2, 3, 3);

