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

-- cau 14
with t1 as (
select dvdk.ma_dich_vu_di_kem
from hop_dong_chi_tiet hdct 
join dich_vu_di_kiem dvdk
on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by dvdk.ma_dich_vu_di_kem
having count(dvdk.ma_dich_vu_di_kem) = 1)

select hdct.ma_hop_dong,ten_loai_dich_vu, ten_dich_vu_di_kem, 1 so_lan
from t1 
join hop_dong_chi_tiet hdct 
on hdct.ma_dich_vu_di_kem = t1.ma_dich_vu_di_kem
join dich_vu_di_kiem dvdk
on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
join hop_dong hd
on hd.ma_hop_dong = hdct.ma_hop_dong
join dich_vu dv
on dv.ma_dich_vu = hd.ma_dich_vu
join loai_dich_vu ldv
on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu;


-- cau 15 
select nv.ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi 
from hop_dong hd
join nhan_vien nv
on hd.ma_nhan_vien = nv.ma_nhan_vien
join trinh_do td
on td.ma_trinh_do = nv.ma_trinh_do
join bo_phan bp
on bp.ma_bo_phan = nv.ma_bo_phan
group by hd.ma_nhan_vien
having count(ma_hop_dong) <= 3;








