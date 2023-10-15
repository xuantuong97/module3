use fumara_manager;
-- cau 6

select dv.ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu 
from dich_vu dv
join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
where ma_dich_vu not in (
select distinct ma_dich_vu
from hop_dong
where ngay_lam_hop_dong between '2021-01-01' and '2021-03-31');

-- cau 7
with t1 as (select dv.ma_dich_vu
from dich_vu dv
join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
where ma_dich_vu not in (
select distinct ma_dich_vu
from hop_dong
where year(ngay_lam_hop_dong) ='2021'))

select dv.ma_dich_vu, ten_dich_vu, dien_tich,so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu 
from dich_vu dv
join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
where ma_dich_vu in (
select distinct ma_dich_vu
from hop_dong
where year(ngay_lam_hop_dong) ='2020')
and ma_dich_vu in (select distinct ma_dich_vu from t1);

-- cau 8

select distinct ho_ten 
from khach_hang;

select ho_ten
from khach_hang
group by ho_ten;

with t1 as (select ho_ten,
row_number() over (partition by ho_ten order by ho_ten) row_num
from khach_hang
)
select ho_ten from t1
where row_num = 1;

-- cau 9 

select month(ngay_lam_hop_dong) `month`, count(ma_hop_dong)  so_luong
from hop_dong
where year(ngay_lam_hop_dong) = '2021'
group by month
order by month;

-- cau 10

select hd.ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, 
sum(ifnull(so_luong,0)) so_luong_dich_vu_di_kem 
from hop_dong_chi_tiet hdct
right join  hop_dong hd
on hd.ma_hop_dong = hdct.ma_hop_dong
group by hd.ma_hop_dong;

 








