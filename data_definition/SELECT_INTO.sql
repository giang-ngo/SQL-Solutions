/*
Cú pháp:
SELECT
    columns
INTO
    destination
FROM
    source
WHERE
    conditions


*/
--Tạo bảng đích GoodStudent có điểm Gpa >= 3.20 từ bảng Student:
SELECT
    *
INTO
    LearnSQL.dbo.GoodStudent
FROM
    LearnSQL.dbo.Student
WHERE
    Gpa >= 3.2

--Tạo bảng đích chỉ chứa các sinh viên học CNTT trong một CSDL khác so với CSDL gốc chứa bảng Student:
SELECT
    *
INTO
    MyDatabase.dbo.ITStudent
FROM
    LearnSQL.dbo.Student
WHERE
    Major = 'CNTT'