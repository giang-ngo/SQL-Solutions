/*
Cú pháp của FULL OUTER JOIN:
SELECT
    columns
FROM
    table1
    FULL (OUTER) JOIN table2
    ON join_predicate

1.Hãy cho biết các môn học không có sinh viên đăng ký
2.Hãy cho biết các sinh viên không đăng ký môn học
*/

--1
SELECT
    sj.Id AS SubjectId,
    sj.Name
FROM
    Register r
    FULL OUTER JOIN Subject sj
    ON sj.Id = r.SubjectId
WHERE
    r.SubjectId IS NULL


--2
SELECT
    s.Id AS StudentId,
    s.FirstName
FROM
    Student s
    FULL OUTER JOIN Register r
    ON s.Id = r.StudentId
WHERE
    r.StudentId IS NULL