/*
Sau đây là cú pháp INNER JOIN:
SELECT
    columns
FROM
    table1
    (INNER) JOIN table2
    ON join_predicate;

1.Hãy cho biết mã, họ, tên các sinh viên đã đăng ký ít nhất một môn học. Kết quả không được phép trùng lặp.
2.Hãy cho biết mã, tên các sinh viên không đăng ký bất kỳ môn học nào. Kết quả không hiển thị trùng lặp.
3.Hãy cho biết sinh viên Trần Dũng mã B25DCCN101 đăng ký những môn học nào
4.Hãy cho biết số lượng môn học từng sinh viên đăng ký. Sắp xếp giảm dần theo số lượng đăng ký.
*/

--1

SELECT DISTINCT
    s.Id,
    s.LastName,
    s.FirstName
FROM
    Student s
    INNER JOIN Register r
    ON s.Id = r.StudentId;
-- tương đương:
SELECT DISTINCT
    s.Id,
    s.LastName,
    s.FirstName
FROM
    Student s
    JOIN Register r
    ON s.Id = r.StudentId;

--2
SELECT DISTINCT
    s.Id,
    s.LastName,
    s.FirstName
FROM
    Student s
WHERE
    s.Id NOT IN (
        SELECT DISTINCT 
            Student.Id
        FROM 
            Student 
        JOIN Register
        ON Student.Id = Register.StudentId
    )

--3
SELECT
    s.Id,
    s.LastName,
    s.FirstName,
    sj.Name AS SubjectName
FROM
    Student s
    JOIN Register r
    ON s.Id = r.StudentId
    JOIN Subject sj
    ON sj.Id = r.SubjectId
WHERE
    s.Id = 'B25DCCN101'

--4
SELECT
    s.Id,
    s.LastName,
    s.FirstName,
    COUNT(r.SubjectId) AS NumberRegistered
FROM
    Student s
    JOIN Register r
    ON s.Id = r.StudentId
GROUP BY
    s.Id,
    s.LastName,
    s.FirstName
ORDER BY
    NumberRegistered DESC