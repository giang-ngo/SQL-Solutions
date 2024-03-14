/*
Cú pháp của toán tử UNION:
query1
UNION
query2


Cú pháp của toán tử UNION ALL :
query1 
UNION ALL 
query2

1.Cho biết họ và tên của các sinh viên và các nhân viên trong hai bảng Student và Staffs 
*/

--1
-- Sử dụng toán tử UNION: các dòng kết quả trùng lặp bị loại bỏ
SELECT
    LastName,
    FirstName
FROM
    Student
UNION
SELECT
    LastName,
    FirstName
FROM
    Staffs

--Khi sử dụng UNION ALL, các dòng dữ liệu trùng lặp được giữ lại:
SELECT
    LastName,
    FirstName
FROM
    Student
UNION ALL
SELECT
    LastName,
    FirstName
FROM
    Staffs