/*
SELECT
    columns
FROM
    tables
WHERE
    conditions
ORDER BY
   columns

1.Hãy cho biết thông tin các sinh viên có điểm TB >= 3.2.
2.Hãy cho biết thông tin các sinh viên có địa chỉ ở Hà Nội, sắp xếp kết quả giảm dần theo điểm TB.
3.Hãy cho biết thông tin các sinh viên học CNTT và có điểm Tb >= 3.35, sắp xếp kết quả giảm dần theo điểm TB.
*/

--1
SELECT 
    * 
FROM 
    Student 
WHERE 
    Gpa >= 3.2
ORDER BY 
    Gpa DESC

--2
SELECT 
    * 
FROM 
    Student 
WHERE 
    Address = N'Hà Nội'
ORDER BY 
    Gpa DESC

--3
SELECT
    *
FROM
    Student
WHERE
    Major = 'CNTT' AND Gpa >= 3.35
ORDER BY
    Gpa DESC