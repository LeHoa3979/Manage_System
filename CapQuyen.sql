
-



---V---
---CẤP QUYÊN----
--Tạo nhóm người dùng USER theo chuyên môn
Create role NhanVienBanHang
Create role QuanLy


--1.1 Cap quyen cho nhan vien ban hang

grant select on NhomSanPham3 to Bánhàng
grant select, insert on KhachHang5 to NhanVienBanHang
grant select on SanPham4 to NhanVienBanHang
grant select, insert on DonDatHang6 to NhanVienBanHang
grant select, insert on CTDonDatHang7 to NhanVienBanHang
grant select on NhaSanXuat8 to NhanVienBanHang


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
