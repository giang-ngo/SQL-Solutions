/*
Cú pháp: column | expression IN values

1.Cho biết danh sách sinh viên có địa chỉ hoặc ở Hà Nội hoặc ở Đà Nẵng hoặc ở Hồ Chí Minh.
2.Cho biết các sinh viên có địa chỉ không thuộc các thành phố ở trên.
3.Cho biết thông tin các sinh viên đăng ký môn học C++.
4.Cho biết thông tin các môn học sinh viên mã X đăng ký.
*/

--1
SELECT 
   * 
FROM 
   Student 
WHERE 
   Id IN ( 
   SELECT 
      Id 
   FROM 
      Student 
   WHERE 
      Address = N'Hà Nội' 
      OR 
      Address = N'Đà Nẵng' 
      OR Address = N'Hồ Chí Minh' 
   )

--2
SELECT 
   * 
FROM 
   Student 
WHERE 
   Id NOT IN ( 
   SELECT 
      Id 
   FROM 
      Student 
   WHERE 
      Address = N'Hà Nội' 
      OR 
      Address = N'Đà Nẵng' 
      OR Address = N'Hồ Chí Minh' 
   )

--3
SELECT
    *
FROM 
    Student
WHERE
    Id IN (
        SELECT
            StudentId
        FROM
            Register, Subject
        WHERE
            Subject.Id = Register.SubjectId 
            AND
            Subject.Name = 'C++'
        )


--4
SELECT
    *
FROM
    Subject
WHERE
    Id IN (
        SELECT
            SubjectId
        FROM
            Register
        WHERE
            StudentId = 'B25DCCN101'
        )
