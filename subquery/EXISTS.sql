/*
Cú pháp:
EXISTS(subquery)

1.Hãy cho biết các sinh viên đã đăng ký nhiều hơn 2 môn học và số lượng đăng ký tương ứng
2.Cho biết thông tin sinh viên sống tại Hà Nội
*/

--1
SELECT
    s.Id AS Id,
    s.LastName + ' ' + s.FirstName AS FullName,
    s.BirthDate,
    s.Gpa,
    (
        SELECT 
            COUNT(r.StudentId)
        FROM
            Register r
        WHERE
            r.StudentId = s.Id
        GROUP BY
            r.StudentId
    ) AS NumberOfRegistered
FROM
    Student s
WHERE
    EXISTS(
    SELECT 
        COUNT(r.StudentId)
    FROM
        Register r
    WHERE
        r.StudentId = s.Id
    GROUP BY
        r.StudentId
    HAVING
        COUNT(r.StudentId) > 2
    )
ORDER BY
    NumberOfRegistered DESC


--2
-- Câu truy vấn sử dụng toán tử IN:
SELECT
    s.Id,
    s.LastName + ' ' + s.FirstName AS FullName,
    s.Address
FROM
    Student s
WHERE
    s.Id IN (
        SELECT 
            Id
        FROM
            Student
        WHERE
            Address = N'Hà Nội'
    )

-- Câu truy vấn sử dụng toán tử EXISTS:
SELECT
    s.Id AS Id,
    s.LastName + ' ' + s.FirstName AS FullName,
    s.Address
FROM
    Student s
WHERE
    EXISTS (
        SELECT 
            Id
        FROM
            Student
        WHERE
            Address = N'Hà Nội'
        AND
            s.Id = Id
    )