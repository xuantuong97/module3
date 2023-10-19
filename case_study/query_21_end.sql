use fumara_manager;

-- cau 21
create view v_21 as
select kh.* 
from hop_dong hd
join khach_hang kh on hd.ma_khach_hang = kh.ma_khach_hang
where ngay_lam_hop_dong = '2021-01-14'
and dia_chi like '%Gia Lai';

-- cau 22
update v_21
set dia_chi = replace(dia_chi,'Gia Lai','Hải Châu');

-- cau 23
delimiter //
create procedure p_remove_customer(id int)
begin
create table rm_mhd ( mhd int);

insert into rm_mhd
select ma_hop_dong
from hop_dong where ma_khach_hang = id;

delete from hop_dong_chi_tiet
where ma_hop_dong in (select * from rm_mhd);

delete from hop_dong
where ma_hop_dong in (select * from rm_mhd);

delete from khach_hang
where ma_khach_hang = id;

drop table rm_mhd;
end //
delimiter ;

-- cau 24

delimiter //
create procedure add_hop_dong ( id int, ngay_bat_dau date, ngay_ket_thuc date, 
dat_coc double, mnv int, mkh int, mdv int)
begin 
declare err_msg varchar(150);
if id is null or ngay_bat_dau is null or ngay_ket_thuc is null or mnv is null
or mkh is null or mdv is null
then set err_msg = 'Input data can not be null';
signal sqlstate '45000' set message_text = err_msg;

elseif exists (select * from hop_dong where ma_hop_dong = id) then
set err_msg = 'Mã hợp đồng đã tồn tại';
signal sqlstate '45001' set message_text = err_msg;

elseif not exists (select * from nhan_vien where ma_nhan_vien = mnv) then
set err_msg = 'Mã nhân viên không hợp lệ, nhân viên không tồn tại';
signal sqlstate '45002' set message_text = err_msg;

elseif not exists (select * from khach_hang where ma_khach_hang = mkh) then
set err_msg = 'Mã khách hàng không hợp lệ, khách hàng không tồn tại';
signal sqlstate '45003' set message_text = err_msg;

elseif not exists (select * from dich_vu where ma_dich_vu = mdv) then
set err_msg = 'Mã dịch vụ không hợp lệ, dịch vụ không tồn tại';
signal sqlstate '45004' set message_text = err_msg;

else 
insert into hop_dong values (
id , ngay_bat_dau , ngay_ket_thuc , 
dat_coc , mnv , mkh , mdv );
end if;
 
 end //
 delimiter ;

-- 25
create table if not exists log_hop_dong (
so_hop_dong_con_lai int, thoi_gian date);

delimiter //
create trigger tr_xoa_hop_dong after delete on hop_dong
for each row
begin
declare count_hop_dong int;
select count(*) into count_hop_dong from hop_dong;
insert into log_hop_dong values
(count_hop_dong, current_date());
end //
delimiter ;


-- cau 26
delimiter //
create trigger check_update_date before update on hop_dong
for each row 
begin 
declare err_msg1 varchar(150);
if datediff(new.ngay_ket_thuc, new.ngay_lam_hop_dong) < 2 then
set err_msg1 = 'Ngày làm hoặc kết thúc hợp đồng không hợp lệ';
signal sqlstate '45005' set message_text = err_msg1;
end if;
end //
delimiter ;

update hop_dong 
set ngay_ket_thuc = '2021-01-15'
where ma_hop_dong = 4;

-- cau 27 









