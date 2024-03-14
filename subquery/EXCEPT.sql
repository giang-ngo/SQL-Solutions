/*
Cú pháp:
query1 EXCEPT query2

1.Hãy cho biết thông tin các sinh viên không đăng ký môn học?
2.Hãy cho biết tên các quận của khách hàng không có cửa hàng công nghệ?

*/

--1
SELECT
    *
FROM 
    Student
WHERE
    Id IN (
    SELECT 
        s.Id
    FROM
        Student s
    EXCEPT
    SELECT
        r.StudentId
    FROM
        Register r
    )

--2
SELECT
    District
FROM
    Customers
EXCEPT
SELECT
    District
FROM 
    Stores