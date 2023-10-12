use fumara_manager;

-- Câu 2 --
select * from nhan_vien
where ho_ten like "H%" or ho_ten like "T%" or ho_ten like "K%"
and length(ho_ten) <= 15;

-- Câu 3 --
select * from khach_hang
where datediff(current_date, ngay_sinh)/365.25 between 18 and 50
and (dia_chi like "%Đà Nẵng" or dia_chi like "%Quảng Trị");


