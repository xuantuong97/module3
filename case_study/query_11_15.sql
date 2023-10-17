use fumara_manager;

-- cau 11
select dvdk.*
from hop_dong_chi_tiet hdct
join dich_vu_di_kiem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
join hop_dong hd on hdct.ma_hop_dong = hd.ma_hop_dong
join khach_hang kh on hd.ma_khach_hang = kh.ma_khach_hang
join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
where ten_loai_khach = "diamond"
and (dia_chi like '%Vinh' or dia_chi like '%Quảng Ngãi');

-- cau 12


select hd.ma_hop_dong, nv.ho_ten, kh.ho_ten, kh.so_dien_thoai ,ten_dich_vu,
sum(ifnull(so_luong,0)) as so_luong, tien_dat_coc
from hop_dong hd
join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
join nhan_vien nv on hd.ma_nhan_vien = nv.ma_nhan_vien
join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong 
where year(ngay_lam_hop_dong) = '2020' and quarter(ngay_lam_hop_dong) = '4'
and ten_dich_vu not in (
select ten_dich_vu 
from hop_dong hd
join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
where year(ngay_lam_hop_dong) = '2021' and quarter(ngay_lam_hop_dong) in ('1','2')
)
group by hd.ma_hop_dong;


-- cau 13
with t1 as (
select sum(so_luong) so_luong, ma_dich_vu_di_kem 
from hop_dong_chi_tiet
group by ma_dich_vu_di_kem
)
select dvdk.* 
from dich_vu_di_kiem dvdk 
join t1 on dvdk.ma_dich_vu_di_kem = t1.ma_dich_vu_di_kem
where so_luong = ( select max(so_luong) 
				   from t1)
;








