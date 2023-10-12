create database product_manager;
use product_manager;

create table phieu_xuat(
so_px int primary key,
ngay_xuat date not null
);

create table phieu_nhap(
so_pn int primary key,
ngay_nhap date not null
);

create table nha_cc(
ma_ncc int primary key,
ten_ncc varchar(50) not null,
dia_chi varchar(50) not null
);

create table sdt_ncc(
ma_ncc int,
sdt varchar(15),
foreign key (ma_ncc) references nha_cc(ma_ncc)
);

create table don_dh(
so_dh int primary key,
ngay_dh date,
ma_ncc int,
foreign key (ma_ncc) references nha_cc(ma_ncc)
);

create table vat_tu(
ma_vt int primary key,
ten_vt varchar(50)
);

create table chi_tiet_phieu_xuat(
so_px int,
ma_vt int,
dg_xuat float,
sl_xuat int,
primary key (so_px, ma_vt),
foreign key (so_px) references phieu_xuat(so_px),
foreign key (ma_vt) references vat_tu(ma_vt)
);

create table chi_tiet_phieu_nhap(
so_pn int,
ma_vt int,
dg_nhap float,
sl_nhap int,
primary key (so_pn, ma_vt),
foreign key (so_pn) references phieu_nhap(so_pn),
foreign key (ma_vt) references vat_tu(ma_vt)

);

create table chi_tiet_don_dat_hang(
so_dh int,
ma_vt int,
dg_dat float,
sl_dat int,
primary key (so_dh, ma_vt),
foreign key (so_dh) references don_dh(so_dh),
foreign key (ma_vt) references vat_tu(ma_vt)
);





