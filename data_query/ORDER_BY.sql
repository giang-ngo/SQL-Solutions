/*
SELECT
    columns
FROM
    tables
ORDER BY
    columns|expression [ASC|DESC]


1.Sắp xếp giảm dần theo 1 tiêu chí: cho biết mã, tên, điểm TB các sinh viên trong bảng Student. 
2.Sắp xếp tăng dần theo 1 tiêu chí: Cho biết mã, tên, điểm TB các sinh viên trong bảng Student.
Kết quả sắp xếp tăng dần theo điểm TB.
3.Sắp xếp tăng dần theo nhiều tiêu chí: Cho biết tên, ngày sinh, điểm TB các sinh viên học 
chuyên ngành CNTT, sắp xếp theo điểm tăng dần, ngày sinh tăng dần.
4.Sắp xếp theo nhiều tiêu chí khác thứ tự sắp xếp: Cho biết tên, ngày sinh, điểm TB các sinh viên học chuyên ngành CNTT,
sắp xếp theo điểm giảm dần, ngày sinh tăng dần.
5.Sắp xếp theo tiêu chí không bao gồm trong vế SELECT: Cho biết mã, tên, điểm các sinh viên trong
bảng Student sắp xếp tăng dần theo ngày sinh.
6.Sắp xếp theo kết quả một biểu thức nào đó: Cho biết thông tin các sinh viên có trong bảng Student,
sắp xếp theo độ dài tên tăng dần.
*/

--1
SELECT 
    Id, FirstName, Gpa 
FROM
    Student
ORDER BY
    Gpa DESC



--2
SELECT
    Id, FirstName, Gpa
FROM
    Student
ORDER BY
    Gpa
--3

SELECT 
    FirstName, BirthDate, Gpa
FROM
    Student
WHERE
    Major = 'CNTT'
ORDER BY
    Gpa,
    BirthDate

--4
SELECT 
    FirstName, BirthDate, Gpa
FROM
    Student
WHERE
    Major = 'CNTT'
ORDER BY
    Gpa DESC,
    BirthDate ASC

--5

SELECT 
    Id, FirstName, Gpa
FROM
    Student
ORDER BY
    BirthDate ASC

--6

SELECT
    *
FROM
    Student
ORDER BY
    LEN(FirstName) ASC