# README - Quản lý đơn đặt hàng trong hệ thống VNROYAL

## 1. Giới thiệu
Dự án này nhằm tìm hiểu và xây dựng cơ sở dữ liệu (CSDL) quản lý đơn đặt hàng trong phân hệ quản lý bán hàng của hệ thống VNROYAL. 
Bên cạnh việc xây dựng CSDL, dự án còn bao gồm thiết kế và cài đặt chức năng quản lý đơn hàng.

## 2. Xây dựng CSDL quản lý đơn đặt hàng

### 2.1. Sơ đồ thực thể kết hợp (ERD)
- ERD quản lý đơn đặt hàng trong phân hệ quản lý bán hàng của hệ thống VNROYAL.
 ![Image](https://github.com/user-attachments/assets/b42bb750-eccc-4190-ba7b-df0aa529b849)

### 2.2. Cài đặt vật lý CSDL
- Cài đặt các bảng, quan hệ và các khóa chính, khóa ngoại theo thiết kế ERD.
 ![Image](https://github.com/user-attachments/assets/753a8684-5b3d-4a4a-ba4e-53a06a08e835) 

### 2.3. Ràng buộc toàn vẹn
#### Ràng buộc toàn vẹn trên một quan hệ:
- Giới tính của Nhân viên chỉ nhận giá trị 'Nam' hoặc 'Nữ'.
- Giá bán Sản phẩm phải lớn hơn 0.
- Ngày dự kiến nhận hàng (NgayDKNH) phải lớn hơn hoặc bằng Ngày đặt hàng (NgayDat).
- Mã sản phẩm (MaSP) là duy nhất.

#### Ràng buộc toàn vẹn trên nhiều quan hệ:
- Mỗi đơn hàng phải có chi tiết đơn hàng.

## 3. Thiết kế và cài đặt chức năng quản lý đơn hàng
- Xây dựng giao diện quản lý đơn hàng trong hệ thống VNROYAL.
- Chức năng hỗ trợ quản lý đơn hàng:
  - Thêm/Sửa/Xóa đơn hàng.
  - Xem danh sách đơn hàng.
  - Tìm kiếm và lọc đơn hàng theo nhiều tiêu chí.
![Image](https://github.com/user-attachments/assets/89cf8457-21c8-4b41-a1c4-e23e4143a943)

## 4. Công nghệ sử dụng
- Ngôn ngữ: SQL, C# (WindowForm)
- Công cụ: SQL server, Visual studio 

README này cung cấp tóm tắt về dự án quản lý đơn đặt hàng trong hệ thống VNROYAL, giúp người đọc nhanh chóng hiểu mục đích và quy trình thực hiện.

