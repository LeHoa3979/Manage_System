
---------------------I. TẠO DATABASE-----------------------------
/*Tạo cơ sở dữ liệu CuaHangVIWOOD*/
CREATE DATABASE G03LTHoaBillVNROYAL0
GO
USE G03LTHoaBillVNROYAL0
GO


--------------------II. TẠO CÁC BẢNG----------------------------
/*****************1. Tạo các bảng********************/

/*1. Tạo bảng nhân viên*/
create table NhanVien1
(
 MaNV nvarchar (10) primary key,
 MaCM nvarchar (10) NOT NULL,
 HoTenNV nvarchar (100) NOT NULL,
 NgaySinh datetime,
 GioiTinh nvarchar (20) NOT NULL,
 DiaChi nvarchar (150) NOT NULL,
 Email nvarchar (50) NOT NULL,
 sdtNV nvarchar (30) Not null,
 TaiKhoan nvarchar(20) Not null,
 Matkhau nvarchar(20) Not null,
)
go

/*2.Tạo bảng chuyên môn*/
create table ChuyenMon2
(
 MaCM nvarchar (10) primary key,
 TenCM nvarchar (50) NOT NULL,
)
go

/*3. Tạo bảng nhóm sản phẩm*/
create table NhomSanPham3
(
 MaNhomSP nvarchar (10) primary key,
 TenNhomSP nvarchar (100) NOT NULL,
)
go

/*4.Tạo bảng sản phẩm*/
create table SanPham4
(
MaSP nvarchar (10) primary key,
TenSP nvarchar(100) NOT NULL,
SLT int NOT NULL,
GiaBan float NOT NULL,
dvt nvarchar (10) NOT NULL,
MoTa nvarchar (250) NOT NULL,
MaNSX nvarchar (10) NOT NULL,
MaNhomSP nvarchar (10) NOT NULL,
KhuyenMai int NOT NULL,
)
go


/*5.Tạo bảng khách hàng*/
create table KhachHang5
(
MaKH nvarchar (10) primary key,
TenKH nvarchar(100) NOT NULL,
DiaChiKH nvarchar(100) NOT NULL,
SDTKH nvarchar(12) NOT NULL,
EmailKH nvarchar(150) NOT NULL,
MaSTKH nvarchar(150) NOT NULL,
)
go


/*6.Tạo bảng đơn đặt hàng*/
create table DonDatHang6
(
MaDonDat nvarchar (10) primary key,
MaKH nvarchar (10) NOT NULL,
MaNV nvarchar (10) NOT NULL,
NgayDat date not null,
NgayDKNH date not null,
DiaChiGiao Nvarchar(100) NOT NULL,
TinhTrang nvarchar (30) NOT NULL,
GhiChu Nvarchar(250)  NOT NULL,
)
go


/*7.Tạo bảng chi tiết đơn đặt hàng*/
create table CTDonDatHang7
(
MaDonDat nvarchar (10) NOT NULL,
MaSP nvarchar(10) NOT NULL,
SoLuong int NOT NULL,
primary key (MaDonDat, MaSP),
)
go


/*8.Tạo bảng nhà cung cấp*/
create table NhaSanXuat8
(
MaNSX nvarchar(10)  primary key,
TenNSX nvarchar(50) NOT NULL,
Nuoc nvarchar(20) NOT NULL,
)
go



/************2.Lệnh Alter*****************/

/*1. Tạo ràng khóa ngoại của bảng NhanVien1 : fk_MaCM tham chiếu đến
mã chuyên môn của bảng chuyên môn*/
ALTER TABLE NhanVien1
ADD CONSTRAINT fk_MaCM FOREIGN KEY (MaCM) REFERENCES ChuyenMon2(MaCM);

/*2. Tạo ràng buộc khóa ngoại khóa ngoại của bảng SanPham4: gồm MaNSX, MaNhom
tham chiếu đến lần lượt các bảng NhomSanPham3, NhaSanXuat8.*/
alter table SanPham4
add constraint fk_MaNhomSP foreign key (MaNhomSP) references NhomSanPham3(MaNhomSP);

alter table SanPham4
add constraint fk_MaNSX foreign key (MaNSX) references NhaSanXuat8(MaNSX);

/*3. Tạo ràng buộc khóa ngoại của bảng DonDatHang6: là MaKH, MaNV tham 
chiếu đến bảng KhachHang5, NhanVien1.*/
alter table DonDatHang6
add constraint fk_ddh_MaNV foreign key (MaNV) references NhanVien1(MaNV);
alter table DonDatHang6
add constraint fk_ddh_MaKH foreign key (MaKH) references KhachHang5(MaKH);


/*4.Tạo ràng buộc khóa ngoại của bảng chi tiết đơn đặt hàng là mã sản phẩm tham 
chiếu đến bảng sản phẩm.*/
alter table CTDonDatHang7
add constraint fk_ctddh_MaSP foreign key (MaSP ) references SanPham4(MaSP );
alter table CTDonDatHang7
add constraint fk_ctddh_MaDDH foreign key (MaDonDat ) references DonDatHang6(MaDonDat );


--------------------III. INSERT DATA----------------------------

/*1th*/
INSERT into ChuyenMon2  VALUES (N'CM01', N'Nhân viên Phụ trách bộ phận bán hàng')
INSERT into ChuyenMon2  VALUES (N'CM02', N'Quản lý')

/*2th*/
INSERT into NhanVien1  VALUES  (N'NV01', N'CM02', N'Châu Nhuận Phát',CAST(N'1979-04-01' AS Date), N'NAM', N'Nha Trang', N'Phat@gmail.com', N'0123476868',N'PhatQL',N'QL123')
INSERT into NhanVien1  VALUES  (N'NV02', N'CM01', N'Trân Thi Thu',CAST(N'1991-02-01' AS Date), N'NỮ', N'Thu Duc', N'ThuThu@gmail.com', N'0123477878',N'ThuNV',N'NV123')
INSERT into NhanVien1  VALUES  (N'NV03', N'CM01', N'Nguyễn Thùy Trang',CAST(N'1995-08-09' AS Date), N'NỮ', N'Ha Noi', N'ThuyTrang@gmail.com', N'0112577878',N'TrangNV',N'NV123')
INSERT into NhanVien1  VALUES  (N'NV04', N'CM01', N'Nguyễn Thùy Dương',CAST(N'1993-03-01' AS Date), N'NỮ', N'Hue', N'ThuyDuong@gmail.com', N'0156977878',N'DuongNV',N'NV123')

/*3th*/
INSERT into NhomSanPham3 VALUES (N'NSP01', N'Dụng cụ y tế')
INSERT into NhomSanPham3 VALUES (N'NSP02', N'Kim các loại')
INSERT into NhomSanPham3 VALUES (N'NSP03', N'Thực phẩm chức năng')
INSERT into NhomSanPham3 VALUES (N'NSP04', N'Thuốc')

/*4th*/
INSERT into NhaSanXuat8 VALUES (N'NSX01',N'Medal corporation',N'Italy')
INSERT into NhaSanXuat8 VALUES (N'NSX02',N'công ty DeRoyal USA',N'Hoa Kỳ')
INSERT into NhaSanXuat8 VALUES (N'NSX03',N'TRƯỜNG THỌ',N'Việt Nam')
INSERT into NhaSanXuat8 VALUES (N'NSX04',N'GOOD HEALTH',N'New Zealand')
INSERT into NhaSanXuat8 VALUES (N'NSX05',N'PIKDARE S.P.A',N'Italy')
INSERT into NhaSanXuat8 VALUES (N'NSX06',N'VINAHANKOOK',N'Việt Nam')
INSERT into NhaSanXuat8 VALUES (N'NSX07',N'OMRON HEALTHCARE LTD CO.,LTD',N'Nhật Bản')
INSERT into NhaSanXuat8 VALUES (N'NSX08',N'SHENZHEN PANGO MEDICAL ELECTRONICS CO., LTD',N'Trung Quốc')

/*5th*/
INSERT into SanPham4 VALUES (N'SP01', N'Máy đo huyết áp điện tử cổ tay Medel QUICK',7,1400000, N'cai',N'',N'NSX01',N'NSP01',0)
INSERT into SanPham4 VALUES (N'SP02', N'Máy xung điện trị liệu Omron HV-F013',19,2300000, N'cai',N'Giúp giảm đau cơ và khớp',N'NSX07',N'NSP01',0)
INSERT into SanPham4 VALUES (N'SP03', N'Máy mát xa đầu gối Fuji PG-2015F3 ',12,1920000, N'cai',N'',N'NSX08',N'NSP01',10)

INSERT into SanPham4 VALUES (N'SP04', N'Đầu kim tiêm tiểu đường PIC Insupen Original ',21,250000, N'hộp',N'Dùng để gắn vào đầu bút tiêm insulin (100 Cái)',N'NSX05',N'NSP02',5)
INSERT into SanPham4 VALUES (N'SP05', N'Bơm tiêm sử dụng một lần Vinahankook 1ml/cc',140,75000, N'hộp',N'Được khử trùng bằng khí E.O (100 chiếc)',N'NSX06',N'NSP02',10)
INSERT into SanPham4 VALUES (N'SP06', N'Bơm tiêm sử dụng một lần Vinahankook 5ml/cc',59,85000, N'hộp',N'Được khử trùng bằng khí E.O (100 cái)',N'NSX06',N'NSP02',0)
INSERT into SanPham4 VALUES (N'SP07', N'Bơm tiêm sử dụng một lần Vinahankook 50ml/cc',35,120000,N'hộp',N'Phù hợp cho việc bơm thức ăn (25 cái)',N'NSX06',N'NSP02',0)

INSERT into SanPham4 VALUES (N'SP08', N'Viên uống LiverWell Navi hỗ trợ thanh nhiệt',150,140000, N'hộp',N'LiverWell hỗ trợ thanh nhiệt, mát gan, giải độc.',N'NSX03',N'NSP03',10)
INSERT into SanPham4 VALUES (N'SP09', N'Bột Nước Mát Herbal Drink Powder Datino',200,50000, N'hộp',N'Bột Nước Mát Datino Herbal Drink Powder có thành phần chính từ thảo mộc thiên nhiên hỗ trợ thanh nhiệt giải độc, mát gan và lợi tiểu.',N'NSX03',N'NSP03',20)
INSERT into SanPham4 VALUES (N'SP10', N'Viên uống Liver Tonic 17500 GoodHealth',74,370000, N'chai',N'Liver Tonic Goodhealth hỗ trợ giải độc gan, giúp bảo vệ gan và tăng cường chức năng gan.',N'NSX04',N'NSP03',0)
INSERT into SanPham4 VALUES (N'SP11', N'Viên uống Active Liver Plus New Nordic',98,420000, N'Hộp',N'Active Liver Plus hỗ trợ tăng cường chức năng gan',N'NSX01',N'NSP03',0)

INSERT into SanPham4 VALUES (N'SP12', N'Multidex Bột (45gr)',321,412000, N'tuýp',N'Phủ đầy vết loét, ngăn ngừa nhiễm trùng',N'NSX02',N'NSP04',0)
INSERT into SanPham4 VALUES (N'SP13', N'Multidex Gel (85gr) ',80,478000, N'tuýp',N'Hiệu quả trên cả vết loét nhiễm trùng và không nhiễm trùng',N'NSX02',N'NSP04',10)
INSERT into SanPham4 VALUES (N'SP14', N'Multidex Bột (25gr)',124,300000, N'tuýp',N'Làm lành vết loét tự nhiên',N'NSX02',N'NSP04',20)
INSERT into SanPham4 VALUES (N'SP15', N'Multidex Gel (14gr)',69,251000, N'tuýp',N'Hiệu quả trên cả vết loét nhiễm trùng và không nhiễm trùng',N'NSX02',N'NSP04',10)
INSERT into SanPham4 VALUES (N'SP16', N'Multidex Bột (12gr)',69,248000, N'tuýp',N'Làm lành vết loét tự nhiên',N'NSX02',N'NSP04',0)


/*6th*/
INSERT into KhachHang5 VALUES (N'KH01', N'DƯỢC PHẨM AN KHANG PHARMA',N'Quận 1, TP Hồ Chí Minh',N'02135468', N'AnKhangPharmacy@gmail.com', N'0314587300')
INSERT into KhachHang5 VALUES (N'KH02', N'Nhà thuốc An Liên',N'Bình Thuận',N'05485145', N'AnLienPharmacy@gmail.com', N'0369328900')
INSERT into KhachHang5 VALUES (N'KH03', N'Nhà thuốc Bình An',N'Quận 8, TP Hồ Chí Minh',N'02135468', N'BinhAnPharmacy@gmail.com', N'0254587300')
INSERT into KhachHang5 VALUES (N'KH04', N'Nhà thuốc Mỹ Dung',N'Thuận An',N'02365145', N'MyDungPharmacy@gmail.com', N'0369412400')
INSERT into KhachHang5 VALUES (N'KH05', N'Nhà thuốc Hương Anh',N'Long Thành',N'02876468', N'HuongAnhharmacy@gmail.com', N'0314566300')
INSERT into KhachHang5 VALUES (N'KH06', N'Nhà thuốc Bình Dương A',N'Bình Dương',N'02134445', N'BinhDuongPharmacy@gmail.com', N'0986727300')
INSERT into KhachHang5 VALUES (N'KH07', N'Nhà thuốc Chí Hải',N'Nha Trang',N'02136945', N'ChiHaiPharmacy@gmail.com', N'0369320200')
INSERT into KhachHang5 VALUES (N'KH08', N'Nhà thuốc Anh Thơ',N'Cần Thơ',N'02131025', N'AnThoPharmacy@gmail.com', N'0369323000')
INSERT into KhachHang5 VALUES (N'KH09', N'Nhà thuốc Hương Liên',N'Thủ Đức',N'04785145', N'HuongLienPharmacy@gmail.com', N'036902500')
INSERT into KhachHang5 VALUES (N'KH10', N'Nhà thuốc An Thảo',N'Thủ Đức',N'02136985', N'AnThaoPharmacy@gmail.com', N'0369214000')

/*7th*/
INSERT into DonDatHang6  VALUES (N'DDH01',N'KH01',N'NV02',CAST(N'2024-05-28' AS Date),CAST(N'2024-06-05' AS Date), N'TP Hồ Chí Minh',N'Approve:',N'')
INSERT into DonDatHang6  VALUES (N'DDH02',N'KH02',N'NV02',CAST(N'2024-06-01' AS Date),CAST(N'2024-06-14' AS Date), N'Bình Thuận',N'Approve:',N'')
INSERT into DonDatHang6  VALUES (N'DDH03',N'KH03',N'NV02',CAST(N'2024-05-26' AS Date),CAST(N'2024-06-12' AS Date), N'Quận 8, TP Hồ Chí Minh',N'Checking',N'')
INSERT into DonDatHang6  VALUES (N'DDH04',N'KH04',N'NV03',CAST(N'2024-05-26' AS Date),CAST(N'2024-06-15' AS Date), N'Thuận An',N'Approve',N'')
INSERT into DonDatHang6  VALUES (N'DDH05',N'KH05',N'NV04',CAST(N'2024-04-27' AS Date),CAST(N'2024-05-11' AS Date), N'Long Thành',N'Checking',N'')
INSERT into DonDatHang6  VALUES (N'DDH06',N'KH06',N'NV02',CAST(N'2024-04-05' AS Date),CAST(N'2024-06-01' AS Date), N'Bình Dương',N'Approve',N'')
INSERT into DonDatHang6  VALUES (N'DDH07',N'KH07',N'NV02',CAST(N'2024-05-08' AS Date),CAST(N'2024-05-23' AS Date), N'Nha Trang',N'Checking',N'')
INSERT into DonDatHang6  VALUES (N'DDH08',N'KH08',N'NV04',CAST(N'2024-06-09' AS Date),CAST(N'2024-06-28' AS Date), N'Cần Thơ',N'Approve',N'')
INSERT into DonDatHang6  VALUES (N'DDH09',N'KH09',N'NV04',CAST(N'2024-05-26' AS Date),CAST(N'2024-06-19' AS Date), N'Thủ Đức',N'Checking',N'')
INSERT into DonDatHang6  VALUES (N'DDH11',N'KH10',N'NV03',CAST(N'2024-11-02' AS Date),CAST(N'2024-13-02' AS Date), N'Thủ Đức',N'Approve',N'')

/*8th*/
INSERT into CTDonDatHang7  VALUES(N'DDH01', N'SP01',8)
INSERT into CTDonDatHang7  VALUES(N'DDH01', N'SP02',4)
INSERT into CTDonDatHang7  VALUES(N'DDH01', N'SP03',10)

INSERT into CTDonDatHang7  VALUES(N'DDH02', N'SP04',31)
INSERT into CTDonDatHang7  VALUES(N'DDH02', N'SP05',20)

INSERT into CTDonDatHang7  VALUES(N'DDH03', N'SP15',6)
INSERT into CTDonDatHang7  VALUES(N'DDH03', N'SP16',10)
INSERT into CTDonDatHang7  VALUES(N'DDH03', N'SP08',5)
INSERT into CTDonDatHang7  VALUES(N'DDH03', N'SP09',8)

INSERT into CTDonDatHang7  VALUES(N'DDH04', N'SP12',15)
INSERT into CTDonDatHang7  VALUES(N'DDH04', N'SP13',21)

INSERT into CTDonDatHang7  VALUES(N'DDH05', N'SP01',2)
INSERT into CTDonDatHang7  VALUES(N'DDH05', N'SP05',10)
INSERT into CTDonDatHang7  VALUES(N'DDH05', N'SP06',9)

INSERT into CTDonDatHang7  VALUES(N'DDH06', N'SP15',13)
INSERT into CTDonDatHang7  VALUES(N'DDH06', N'SP14',12)

INSERT into CTDonDatHang7  VALUES(N'DDH07', N'SP08',9)
INSERT into CTDonDatHang7  VALUES(N'DDH07', N'SP10',8)
INSERT into CTDonDatHang7  VALUES(N'DDH07', N'SP09',24)
INSERT into CTDonDatHang7  VALUES(N'DDH07', N'SP15',3)

INSERT into CTDonDatHang7  VALUES(N'DDH08', N'SP14',30)

INSERT into CTDonDatHang7  VALUES(N'DDH09', N'SP09',8)
INSERT into CTDonDatHang7  VALUES(N'DDH09', N'SP11',13)

INSERT into CTDonDatHang7  VALUES(N'DDH10', N'SP04',3)
INSERT into CTDonDatHang7  VALUES(N'DDH10', N'SP03',7)
INSERT into CTDonDatHang7  VALUES(N'DDH10', N'SP13',21)







---------------------------------IV. CREATE AUTHORITY-----------------
--Tạo nhóm người dùng USER theo chuyên môn
Create role NhanVienPhuTrachBoPhanBanHang
Create role QuanLy


--1.1 Cap quyen cho nhan vien ban hang

grant select on NhomSanPham3 to NhanVienPhuTrachBoPhanBanHang
grant select, insert on KhachHang5 to NhanVienPhuTrachBoPhanBanHang
grant select on SanPham4 to NhanVienPhuTrachBoPhanBanHang
grant select, insert on DonDatHang6 to NhanVienPhuTrachBoPhanBanHang
grant select, insert on CTDonDatHang7 to NhanVienPhuTrachBoPhanBanHang
grant select on NhaSanXuat8 to NhanVienPhuTrachBoPhanBanHang


--1.2 Cap quyen cho quan ly
grant all to quanly with grant option

--2.1 Tao cac tai khoan dang nhap user cho nguoi dung
Exec sp_addlogin 'ThuNV', 'NV123','G03LTHoaBillVNROYAL0'
Exec sp_adduser 'ThuNV','TranThiThu'

Exec sp_addlogin 'TrangNV', 'NV123','G03LTHoaBillVNROYAL0'
Exec sp_adduser 'TrangNV','NguyenThuyTrang'

Exec sp_addlogin 'DuongNV', 'NV123','G03LTHoaBillVNROYAL0'
Exec sp_adduser 'DuongNV','NguyenThuyDuong'

Exec sp_addlogin 'PhatQL', 'QL123','G03LTHoaBillVNROYAL0'
Exec sp_adduser 'PhatQL','ChauNhuanPhat'


--3 Them nguoi dung vao tung nhom theo chuyen mon
sp_addrolemember 'NhanVienBanHang', 'TranThiThu'

sp_addrolemember 'NhanVienBanHang', 'NguyenThuyTrang'

sp_addrolemember 'NhanVienBanHang', 'NguyenThuyDuong'

sp_addrolemember 'quanly', 'ChauNhuanPhat'

select*
from G03LTHoaBillVNROYAL0.sys.database_principals



-----------------------------V.CREATE TRIGGER-------------------------

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
		

------------------------------------VI. CREATE VIEW------------------------------------------
/*1.Tạo view vw_DonDatHang */
create view vw_DonDatHang
as
select SanPham4.MaSP,DonDatHang6.MaDonDat, TenSP, SoLuong, GiaBan,KhuyenMai, (SoLuong*(GiaBan-(GiaBan*KhuyenMai)/100)) as ThanhTien
from DonDatHang6 join (SanPham4 join CTDonDatHang7 on SanPham4.MaSP= CTDonDatHang7.MaSP) 
on DonDatHang6.MaDonDat=CTDonDatHang7.MaDonDat
group by SanPham4.MaSP,DonDatHang6.MaDonDat, TenSP, SoLuong, GiaBan, KhuyenMai

--- kiểm thử
select *
from vw_DonDatHang

/*2.  */

create view vw_Invoice
as
select  TenSP, SoLuong, dvt,GiaBan,(GiaBan*SoLuong) as ThanhTien, TenKH, MaSTKH, DiaChiKH, SDTKH, DonDatHang6.MaDonDat

from KhachHang5 join (DonDatHang6 join (SanPham4 join CTDonDatHang7 on SanPham4.MaSP= CTDonDatHang7.MaSP) on DonDatHang6.MaDonDat=CTDonDatHang7.MaDonDat) on DonDatHang6.MaKH = KhachHang5.MaKH
group by SanPham4.MaSP, TenSP, SoLuong, GiaBan,TenKH, MaSTKH, DiaChiKH, SDTKH, dvt,DonDatHang6.MaDonDat

--- kiểm thử
select *
from vw_Invoice