--I--
/*Tạo cơ sở dữ liệu CuaHangVIWOOD*/
CREATE DATABASE G03LTHoaBillVNROYAL0
GO
USE G03LTHoaBillVNROYAL0
GO

--II--
/*****************1. Tạo các bảng********************/

/*1. Tạo bảng nhân viên*/
create table NhanVien
(
 MaNV Varchar (20) primary key,
 HoTen nvarchar (100) NOT NULL,
 GioiTinh nvarchar (10) NOT NULL,
 SDT nvarchar (15) NOT NULL,
 Email nvarchar (150) NOT NULL,
 MaCV varchar (20) Not null,
)
go

/*2.Tạo bảng chức vụ*/
create table ChucVu
(
 MaCV varchar (20) primary key,
 TenCV nvarchar (50) NOT NULL,
 MoTa nvarchar(200) NOT NULL,
 Luong Float NOT NULL,
)
go

/*3. Tạo bảng nhóm*/
create table Nhom
(
 MaNhom varchar (20) primary key,
 TenNhom nvarchar (100) NOT NULL,
)
go

/*4.Tạo bảng sản phẩm*/
create table SanPham
(
MaSP varchar(10) primary key,
TeSanPham nvarchar(100) NOT NULL,
SoLuong int NOT NULL,
GiaBan float NOT NULL,
NgayNhap date NOT NULL,
MoTa nvarchar (300) NOT NULL,
MaNhom varchar (20) NOT NULL,
MaChatLieu varchar (20) NOT NULL,
MaMS varchar (20) NOT NULL,
)
go

/*5. Tạo bảng màu sắc*/
create table MauSac
(
 MaMS varchar (20) primary key,
 TenMauSac nvarchar (100) NOT NULL,
)
go

/*6. Tạo bảng chất liệu*/
create table ChatLieu
(
 MaChatLieu varchar (20) primary key,
 TenChatLieu nvarchar (100) NOT NULL,
)
go

/*7.Tạo bảng khách hàng*/
create table KhachHang
(
MaKH varchar(20) primary key,
HoTenKH nvarchar(100) NOT NULL,
DiaChiKH nvarchar(100) NOT NULL,
SDTKH nvarchar(12) NOT NULL,
EmailKH nvarchar(50) NOT NULL,
GioiTinhKH nvarchar(10) NOT NULL,
)
go

/*8.Tạo bảng hóa đơn*/
create table HoaDon
(
MaHoaDon varchar(20) primary key,
NgayLap date NOT NULL,
TriGiaHD bigint,
MaNV varchar (20) NOT NULL,
MaKH varchar (20) NOT NULL,
)
go


/*9.Bảng số lượng tồn */
create table SoLuongTon
(
MaSP varchar(10) ,
SoLuongTon int ,
)
go


/*10.Tạo bảng nhà cung cấp*/
create table NhaCungCap
(
MaNCC varchar(20)  primary key,
TenNCC nvarchar(50) NOT NULL,
DiaChiNCC nvarchar(100) NOT NULL,
DienThoaiNCC varchar(12) NOT NULL,
FaxNCC nvarchar(12) NOT NULL,
EmailNCC nvarchar(100) NOT NULL,
)
go

/*11.Tạo bảng nhập hàng*/
create table NhapHang
(
MaNhapHang varchar(20)  primary key,
NgayNhapHang date NOT NULL,
MaNV varchar (20) NOT NULL,
MaNCC varchar (20) NOT NULL,
)
go


/*12.Tạo bảng chi tiết nhập hàng*/
create table CTNhapHang
(
MaNhapHangCT  varchar(20)  primary key,
MaSP varchar(10) NOT NULL,
MaNhapHang varchar(20) NOT NULL,
SoLuong int Not Null,
)
go


/*13.Tạo bảng báo cáo*/
create table BaoCao
(
MaBC varchar(20) primary key,
TenBC Nvarchar(200) NOT NULL,
NgayBC date NOT NULL,
MaNV varchar (20) NOT NULL,
)
go


/*14.Tạo bảng đơn đặt hàng*/
create table DonDatHang
(
MaDonDat varchar(20) primary key,
MaKH varchar(20) NOT NULL,
NgayLap date,
NgayGiao date,
DiaChiGiao Nvarchar(100) NOT NULL,
TinhTrang nvarchar (30) NOT NULL,
GhiChu Nvarchar(100)  NULL,
)
go


/*15.Tạo bảng chi tiết đơn đặt hàng*/
create table CTDonDatHang
(
MaDonDat varchar(20),
MaSP varchar(10) ,
SoLuongDat int NOT NULL,
DonGia Float NOT NULL,
)
go
/*16.Tạo bảng chi tiết hóa đơn*/


/************2.Lệnh Alter*****************/


/*1. Tạo ràng khóa ngoại của bảng nhân viên mã chức vụ tham chiếu đến
mã chức vụ của bảng chức vụ*/
ALTER TABLE NhanVien
ADD CONSTRAINT fk_mcv FOREIGN KEY (MaCV) REFERENCES ChucVu(MaCV);

/*2. Tạo ràng buộc khóa ngoại khóa ngoại của bảng Sản phẩm gồm mã nhóm, mã chất liệu, mã màu sắc 
tham chiếu đến lần lượt các bảng nhóm, chất liệu, màu sắc.*/
alter table SanPham
add constraint fk_MaNhom foreign key (MaNhom) references Nhom(MaNhom);
alter table SanPham
add constraint fk_MaChatLieu foreign key (MaChatLieu) references ChatLieu(MaChatLieu);
alter table SanPham
add constraint fk_MaMS foreign key (MaMS) references MauSac(MaMS);

/*3. Tạo ràng buộc khóa ngoại của bảng hóa đơn là mã nhân viên tham 
chiếu đến bảng nhân viên.*/
alter table HoaDon
add constraint fk_hd_MaNV foreign key (MaNV) references NhanVien(MaNV);
alter table HoaDon
add constraint fk_hd_MaKH foreign key (MaKH) references KhachHang(MaKH);

/*4. Tạo ràng buộc khóa ngoại của bảng nhập hàng gồm mã nhân viên , mã nhà cung cấp 
tham chiếu đến lần lượt các bảng nhân viên, nhà cung cấp.*/
alter table NhapHang
add constraint fk_nh_MaNV foreign key (MaNV) references NhanVien(MaNV);
alter table NhapHang
add constraint fk_nh_MaNCC foreign key (MaNCC) references NhaCungCap(MaNCC);

/*5. Tạo ràng buộc khóa ngoại của bảng chi tiết nhập hàng gồm 
mã sản phẩm , mã nhập hàng tham chiếu đến lần lượt các sản phẩm, nhập hàng.*/
alter table CTNhapHang
add constraint fk_ctnh_MaNhapHang foreign key (MaNhapHang) references NhapHang(MaNhapHang);
alter table CTNhapHang
add constraint fk_ctnh_MaSP foreign key (MaSP) references SanPham(MaSP);

/*6. Tạo ràng buộc khóa ngoại của bảng báo cáo là mã nhân viên tham 
chiếu đến bảng nhân viên.*/
alter table BaoCao
add constraint fk_bc_MaNV foreign key (MaNV) references NhanVien(MaNV);


/*7. Tạo ràng buộc khóa ngoại của bảng số lượng tông là mã sản phẩm tham 
chiếu đến bảng sản phẩm.*/
alter table SoLuongTon
add constraint fk_slt_MaSP foreign key (MaSP ) references SanPham(MaSP );

/*8. Tạo ràng buộc khóa ngoại của bảng đơn đặt hàng là mã khách hàng tham 
chiếu đến bảng khachhang.*/
alter table DonDatHang
add constraint fk_ddh_MaKH foreign key (MaKH ) references KhachHang(MaKH );

/*9.Tạo ràng buộc khóa ngoại của bảng chi tiết đơn đặt hàng là mã sản phẩm tham 
chiếu đến bảng sản phẩm.*/
alter table CTDonDatHang
add constraint fk_ctddh_MaSP foreign key (MaSP ) references SanPham(MaSP );
/*10.*/
alter table BaoCao
add constraint fk_bc_MaNV foreign key (MaNV) references NhanVien(MaNV);


--III--
/*TẠO TRIGGER*/


/*1. Giới tính nhân viên có giá trị nam hoặc nữ*/
create trigger tg_GioiTinh
on NhanVien1
for insert, update
as 
if  not exists(
select *
from inserted
where GioiTinh = N'NAM' or GioiTinh=N'NỮ'
)
begin
print N'giới tính nhân viên phải là Nam hoặc Nữ'
rollback tran
end

/*2. giá bán của sản phẩm phải lớn hơn 0*/

create trigger tg_GiaBan
on SanPham4
for insert, update
as 
if   exists(
select *
from inserted
where inserted.GiaBan<=0
)
begin
print N'giá bán của sản phẩm phải lớn hơn 0'
rollback tran
end

/*3.Ngày đặt hàng không được lớn hơn ngày đăng ký nhân hàng*/
CREATE TRIGGER tg_CHECK_NGAYDAT --Tên Trigger
ON DONDATHANG6
FOR UPDATE,INSERT
AS
    IF ( UPDATE(MaDonDat)or UPDATE (NgayDKNH))--Kiểm tra việc cập nhật trên cột
    IF  exists(
	select *
	from inserted i
	where i.NgayDat> i.NgayDKNH
	)
	begin
        PRINT 'NgayDat PHAI LON HON NgayDKNH'
        ROLLBACK TRAN -- Câu lệnh quay lui khi thực hiện biến cố không thành công
        END

--IV--
/*--------------------INSERT DỮ LIỆU----------------*/

	

