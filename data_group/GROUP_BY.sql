/*
Cú pháp của mệnh đề GROUP BY:
SELECT
    columns
FROM
    tables
GROUP BY
    colmn1,
    column2, ...

1.Cho biết điểm Gpa lớn nhất và nhỏ nhất của các sinh viên trong danh sách theo tháng sinh.
2.Cho biết số lượng sinh viên ở mỗi địa chỉ. Kết quả sắp xếp giảm dần theo số lượng sinh viên.
3.Cho biết số lượng sinh viên theo từng tháng sinh. Sắp xếp kết quả theo số lượng sinh viên giảm dần.z
4.Cho biết số lượng sinh viên theo mỗi giá trị của cột họ.
*/

--1
SELECT 
    MONTH(BirthDate) AS birth_month,
    MIN(Gpa) AS min_gpa,
    MAX(Gpa) AS max_gpa
FROM
    Student
GROUP BY
    MONTH(BirthDate)

--2
SELECT
    Address,
    COUNT(Id) AS NumberOfStudent
FROM
    Student
GROUP BY
    Address
ORDER BY
    NumberOfStudent DESC


--3
SELECT
    MONTH(BirthDate) AS birth_month,
    COUNT(Id) AS num_of_student
FROM
    Student
GROUP BY
    MONTH(BirthDate)
ORDER BY
    COUNT(Id) DESC

--4
SELECT
    LastName,
    COUNT(Id) AS num_of_student
FROM
    Student
GROUP BY
    LastName