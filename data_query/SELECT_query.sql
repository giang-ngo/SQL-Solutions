/*
Cấu trúc của lệnh SELECT: SELECT columns FROM table_name WHERE conditions
1. Lấy tất cả các cột dữ liệu trong bảng Student
2. Lấy mã sv, tên sv, địa chỉ sv trong bảng Student
3. Lấy mã sv, tên sv, địa chỉ sv, chuyên ngành sv trong bảng sv sao sv học ngành CNTT
4. Lấy mã, tên sv của các sv ở một địa chỉ cho trước
*/

--1
SELECT
    FirstName, Address, Major, Id, BirthDate, PhoneNumber
FROM
    Student
-- nếu truy vấn từ bên ngoài database, bổ sung thêm [tên_CSDL.dbo.]:
SELECT 
    FirstName, Address, Major, Id, BirthDate, PhoneNumber
FROM 
    Data.dbo.Student



--2
SELECT
    Id, FirstName, Address
FROM
    Student
--3

SELECT
    Id, FirstName, Address, Major
FROM
    Student
WHERE
    Major = 'CNTT'

--4

SELECT
    Id, FirstName
FROM
    Student
WHERE
    Address = N'Hà Nội'