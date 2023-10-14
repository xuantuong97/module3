use fumara_manager;

-- Câu 2 --
select * from nhan_vien
where ho_ten like "H%" or ho_ten like "T%" or ho_ten like "K%"
and length(ho_ten) <= 15;

-- Câu 3 --
select * from khach_hang
where datediff(current_date, ngay_sinh)/365.25 between 18 and 50
and (dia_chi like "%Đà Nẵng" or dia_chi like "%Quảng Trị");

-- Cau 4

select kh.ma_khach_hang, ho_ten, count(ma_hop_dong) as so_lan
from hop_dong hd
join khach_hang kh on hd.ma_khach_hang = kh.ma_khach_hang
join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
where ten_loai_khach = 'Diamond'
group by ma_khach_hang
order by so_lan;

-- Cau 5


with t1 as (
select ma_hop_dong, sum(so_luong * gia) tong
from hop_dong_chi_tiet hdct 
join dich_vu_di_kiem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by ma_hop_dong
)

select kh.ma_khach_hang,ho_ten, hd.ma_hop_dong, ten_dich_vu,
ngay_lam_hop_dong, ngay_ket_thuc,
(ifnull(chi_phi_thue, 0) + ifnull(tong,0)) tong_tien
from khach_hang kh
left join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
left join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
left join t1 on t1.ma_hop_dong = hd.ma_hop_dong;


























