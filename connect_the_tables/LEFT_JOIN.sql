/*
Cú pháp của LEFT JOIN:
SELECT
    columns
FROM
    table1
    LEFT (OUTER) JOIN table2
    ON join_predicate

1.Hãy cho biết những sinh viên nào đăng ký ít nhất một môn học
2.Hãy cho biết những sinh viên nào không đăng ký bất kì môn học nào
3.Hãy cho biết thông tin sinh viên mã B225DCCN101 và thông tin các môn học sinh viên đó đăng ký xếp theo thứ tự đăng ký từ sớm đến muộn

*/

--1
SELECT DISTINCT
    s.*
FROM
    Student s
    LEFT JOIN Register r
    ON s.Id = r.StudentId
WHERE
    r.StudentId IS NOT NULL

--2
SELECT DISTINCT
    s.*
FROM
    Student s
    LEFT JOIN Register r
    ON s.Id = r.StudentId
WHERE
    r.StudentId IS NULL


--3
SELECT DISTINCT
    s.Id,
    s.LastName,
    s.FirstName, 
    sj.*,
    r.RegisterTime
FROM
    Student s
    LEFT JOIN Register r
    ON s.Id = r.StudentId
    LEFT JOIN Subject sj
    ON sj.Id = r.SubjectId
WHERE
    s.Id= 'B25DCCN101'
ORDER BY
    r.RegisterTime