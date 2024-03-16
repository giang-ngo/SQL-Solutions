/*
Cú pháp:
UPDATE [Database.][schema.]table_name
SET 
    column1 = value1, column2 = value2, columnk = valuek...
[WHERE condition]

1.Cập nhật điểm sinh viên mã ‘B25DCCN102’ thành 3.36.
2.Cập nhật điểm các sinh viên ở Hà Nội tăng thêm 0.1 điểm.
3.Cập nhật địa chỉ cho sinh viên mã ‘B25DCCN120’ thành ‘Đà Nẵng’
*/

--1
UPDATE 
    Student
SET 
    Gpa = 3.36
WHERE
    Id = 'B25DCCN102'


--2
UPDATE 
    Student
SET 
    Gpa += 0.1
WHERE
    Address = N'Hà Nội'
AND
    Gpa <= 3.9; -- điểm phải dưới 4.0 thì mới cộng vào


--3
UPDATE 
    Student
SET 
    Address = N'Đà Nẵng'
WHERE
    Id = 'B25DCCN120'