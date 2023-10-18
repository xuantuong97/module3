use fumara_manager;

-- cau 16
with t1 as ( select distinct ma_nhan_vien 
from hop_dong
where year(ngay_lam_hop_dong) between 2019 and 2021 )
delete from nhan_vien
where ma_nhan_vien not in (select * from t1);

-- cau 17
with t1 as ( select ma_hop_dong, sum(so_luong * gia) tong
from hop_dong_chi_tiet hdct
join dich_vu_di_kiem dvdk
on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by ma_hop_dong),
t2 as (
 select hd.ma_khach_hang
 from hop_dong hd
 join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
 join t1 on t1.ma_hop_dong = hd.ma_hop_dong
 join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
 join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
 where year(ngay_lam_hop_dong) = '2021' and ten_loai_khach = 'Platinium'
 group by ma_khach_hang
 having sum(chi_phi_thue + ifnull(tong, 0)) > 1000000)
 
 update khach_hang
 set ma_loai_khach = 1
 where ma_khach_hang in (select * from t2);
 
 -- cau 18

create table remove_mhd(
ma_hop_dong int);


create table remove_mkh (
ma_khach_hang int);

insert into remove_mkh
select distinct ma_khach_hang 
from hop_dong 
where year(ngay_lam_hop_dong) < 2021;



insert into remove_mhd 
select  ma_hop_dong from hop_dong 
where ma_khach_hang in ( select * from remove_mkh);


delete from hop_dong_chi_tiet
where ma_hop_dong in (select * from remove_mhd);

delete from hop_dong 
where ma_hop_dong in (select * from remove_mhd);

delete from khach_hang 
where ma_khach_hang in (select * from remove_mkh);

-- cau 19

with t1 as (
select ma_dich_vu_di_kem
from hop_dong_chi_tiet hdct 
join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
where year(ngay_lam_hop_dong) = '2020'
group by ma_dich_vu_di_kem
having sum(so_luong) > 10)

update dich_vu_di_kiem
set gia = gia * 2
where ma_dich_vu_di_kem in ( select * from t1);

-- cau 20
select ma_nhan_vien id, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
from nhan_vien
union all 
select ma_khach_hang id, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
from khach_hang;




 
 
 
 
 
 
 
 



