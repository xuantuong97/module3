-- Hiển thị các thông tin  gồm oID, oDate, oPrice 
select o_id, o_date, o_total from orders;

-- Hiển thị danh sách các khách hàng đã mua hàng

select c_name, p_name
from order_detail od
join orders o on od.o_id = o.o_id
join customer c on c.c_id = o.c_id
join product p on p.p_id = od.p_id;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào

select c_name
from customer c 
left join orders o on c.c_id = o.c_id
where o.c_id is null;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn

select o.o_id, o.o_date, sum(quantity*p_price) total
from order_detail od 
join orders o on od.o_id = o.o_id
join product p on od.p_id = p.p_id
group by o.o_id;



