USE G03LTHoaBillVNROYAL0
GO

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

/*3.      */
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

	
