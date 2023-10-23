
use bai_tap_them;

create table computer (
ma_may int primary key,
hang_san_xuat varchar(50),
gia_su_dung double,
vi_tri int unique);

create table loai_khach_hang (
ma_loai_khach int primary key,
ten_loai_khach varchar(50));

create table khach_hang (
ma_khach_hang int primary key,
ten varchar(50) not null,
sdt varchar(15),
email varchar(30),
loai_khach_hang int,
foreign key (loai_khach_hang) references loai_khach_hang(ma_loai_khach));

create table dich_vu_di_kem (
ma_dich_vu_di_kem int primary key,
ten varchar(50),
gia double );

create table quan_ly_dich_vu (
ma_dich_vu int primary key auto_increment,
ma_may int,
ma_khach_hang int,
thoi_gian_bat_dau datetime,
thoi_gian_ket_thuc datetime,
foreign key (ma_may) references computer(ma_may),
foreign key (ma_khach_hang) references khach_hang(ma_khach_hang));

create table quan_ly_dich_vu_di_kem (
id int primary key auto_increment,
ma_dich_vu int,
ma_dich_vu_di_kem int,
so_luong int,
foreign key (ma_dich_vu) references quan_ly_dich_vu(ma_dich_vu),
foreign key (ma_dich_vu_di_kem) references dich_vu_di_kem(ma_dich_vu_di_kem));



















