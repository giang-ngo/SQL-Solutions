/*
Cú pháp của mệnh đề HAVING:
SELECT
    columns
FROM
    tables
GROUP BY
   groups
HAVING
    conditions

1.Cho biết điểm Gpa lớn nhất và nhỏ nhất của các sinh viên trong danh sách theo tháng sinh. Trong đó tháng sinh là các tháng chẵn.
2.Cho biết số lượng sinh viên ở mỗi địa chỉ. Kết quả sắp xếp giảm dần theo số lượng sinh viên. Trong đó chỉ xét các địa chỉ có từ 2 sinh viên trở lên.
3.Cho biết số lượng sinh viên theo từng tháng sinh. Sắp xếp kết quả theo số lượng sinh viên giảm dần. Trong đó tháng sinh là các tháng lẻ.
4.Cho biết số lượng sinh viên theo mỗi giá trị của cột họ. Trong đó họ phải bắt đầu bằng chữ cái ‘t’, ‘h’, hoặc ‘n’.
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
HAVING
    MONTH(BirthDate) % 2 = 0

--2
SELECT
    Address,
    COUNT(Id) AS NumberOfStudent
FROM
    Student
GROUP BY
    Address
HAVING
    COUNT(Id) >= 2
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
HAVING
    MONTH(BirthDate) % 2 != 0
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
HAVING
    LastName LIKE N't%'
    OR
    LastName LIKE N'h%'
    OR
    LastName LIKE N'n%'