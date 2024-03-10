/*
SELECT
    columns
FROM
    tables
WHERE
    conditions
ORDER BY
   columns

1.Cho biết thông tin các sinh viên trong tên có chữ ‘h’ và học CNTT?
2.Cho biết thông tin các sinh viên học CNTT và có điểm TB >= 3.60?
3.Hãy cho biết sinh viên mã X đăng ký những môn học nào?
4.Hãy cho biết môn học tên x có những sinh viên nào đăng ký?
5.Hãy cho biết tên môn học sinh viên mã X đăng ký và thời gian đăng ký mỗi môn học đó?
*/

--1
SELECT
    *
FROM
    Student
WHERE
    FirstName LIKE '%h%' AND Major = 'CNTT'

--2
SELECT
    *
FROM
    Student
WHERE
    Major = 'CNTT' AND Gpa >= 3.6
ORDER BY
    Gpa DESC

--3
SELECT
    Subject.Name
FROM 
    Subject, Register
WHERE
    Register.StudentId = 'B25DCCN101' AND Subject.Id = Register.SubjectId

--4
SELECT 
    Student.FirstName
FROM 
    Student, Subject, Register
WHERE
    Subject.Name = 'C++' AND Subject.Id = Register.SubjectId AND Register.StudentId = Student.Id

--5
SELECT
    Subject.Name, Register.RegisterTime
FROM
    Register, Subject
WHERE
    Register.StudentId = 'B25DCCN101' AND Subject.Id = Register.SubjectId