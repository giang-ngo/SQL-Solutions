/*
Cú pháp của RIGHT JOIN:
SELECT
    columns
FROM
    table1
    RIGHT (OUTER) JOIN table2
    ON join_predicate

1.Hãy cho biết các môn học không có sinh viên nào đăng ký.
2.Hãy cho biết các môn học có ít nhất 1 sinh viên đăng ký. Kết quả không được phép trùng lặp.
3.Hãy cho biết số lượng sinh viên đăng ký của từng môn học sắp xếp theo số lượng đăng ký giảm dần.
4.Hãy cho biết môn học SUBJ1001 có những sinh viên nào đăng ký. Sắp xếp theo thời gian đăng ký từ sớm->muộn.
*/

--1
SELECT
    r.SubjectId,
    sj.*
FROM
    Register r
    RIGHT JOIN Subject sj
    ON r.SubjectId = sj.Id
WHERE
    r.SubjectId IS NULL
ORDER BY 
    r.SubjectId


--2
SELECT DISTINCT
    r.SubjectId,
    sj.*
FROM
    Register r
    RIGHT JOIN Subject sj
    ON r.SubjectId = sj.Id
WHERE
    r.SubjectId IS NOT NULL
ORDER BY 
    r.SubjectId

--3
SELECT
    sj.Id,
    sj.Name,
    COUNT(r.SubjectId) AS NumberOfRegister
FROM
    Register r
    RIGHT JOIN Subject sj
    ON r.SubjectId = sj.Id
GROUP BY
    sj.Id, sj.Name
ORDER BY 
    NumberOfRegister DESC


--4
SELECT
    sj.Id AS SubjectId,
    sj.Name,
    s.Id AS StudentId,
    s.LastName, 
    s.FirstName,
    r.RegisterTime
FROM
    Student s
    RIGHT JOIN
    Register r
    ON s.Id = r.StudentId
    RIGHT JOIN Subject sj
    ON r.SubjectId = sj.Id
WHERE
    sj.Id = 'SUBJ1001'
ORDER BY 
    r.RegisterTime