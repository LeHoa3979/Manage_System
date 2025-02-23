USE G03LTHoaBillVNROYAL0
GO

/*1.Tạo view vw_DonDatHang */
create view vw_DonDatHang
as
select SanPham4.MaSP,DonDatHang6.MaDonDat, TenSP, SoLuong, GiaBan, (GiaBan*SoLuong) as ThanhTien
from DonDatHang6 join (SanPham4 join CTDonDatHang7 on SanPham4.MaSP= CTDonDatHang7.MaSP) 
on DonDatHang6.MaDonDat=CTDonDatHang7.MaDonDat
group by SanPham4.MaSP,DonDatHang6.MaDonDat, TenSP, SoLuong, GiaBan

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