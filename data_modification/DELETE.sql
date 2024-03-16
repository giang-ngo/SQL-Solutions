/*
Cú pháp:
DELETE [TOP(expression) [PERCENT]]
FROM table_name
[WHERE condition]

1.Xóa thông tin sinh viên có mã ‘B25DCCN101’ khỏi bảng Student.
2.Xóa tất cả sinh viên có địa chỉ ở Hà Nội khỏi bảng.
3.Xóa toàn bộ dữ liệu trong bảng.
*/
--1
-- xóa dữ liệu trong bảng đăng ký trước
DELETE
FROM
    Register
WHERE
    StudentId = 'B25DCCN101'
-- xóa dữ liệu trong bảng Student sau
DELETE
FROM 
    Student
WHERE 
    Id = 'B25DCCN101'

--2
-- phải xóa dữ liệu trong bảng bên nhiều(1-n) trước
DELETE rg
FROM 
    Register rg
    INNER JOIN Student st
    ON rg.StudentId = st.Id
WHERE
    st.Address = N'Hà Nội'
-- xóa dữ liệu trong bảng Student
DELETE FROM Student
WHERE
    Address = N'Hà Nội'

--3
DELETE FROM Register
DELETE FROM Student
