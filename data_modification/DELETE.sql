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

DELETE
FROM 
    Student
WHERE 
    Id = 'B25DCCN101'

--2
DELETE FROM Student
WHERE
    Address = N'Hà Nội'

--3
DELETE FROM Register
DELETE FROM Studen
