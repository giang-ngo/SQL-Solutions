/*
Cú pháp:
INSERT INTO target_table(column_list)
query


*/

--Tạo bảng đích tên ITStudents
CREATE TABLE MyDatabase.dbo.ITStudents(
    PK_ITStudents VARCHAR(20) PRIMARY KEY, 
    FirstName NVARCHAR(20),
    LastName NVARCHAR(20),
    Major VARCHAR(50),
    Gpa FLOAT
)

--Chèn tất cả dữ liệu lấy được(các sinh viên có chuyên nghành CNTT) vào một bảng vào bảng khác.
INSERT INTO 
    MyDatabase.dbo.ITStudents(PK_ITStudents, FirstName, LastName, Major, Gpa)
SELECT
    Id, FirstName, LastName, Major, Gpa
FROM
    LearnSQL.dbo.Student
WHERE
    Major = 'CNTT';

--Chèn top 5 dòng dữ liệu hàng đầu vào bảng khác.(chèn 5 sinh viên có điểm Gpa lớn nhất)
INSERT
INTO 
    MyDatabase.dbo.ITStudents(PK_ITStudents, FirstName, LastName, Major, Gpa)
SELECT TOP (5)
    Id, FirstName, LastName, Major, Gpa
FROM
    LearnSQL.dbo.Student
WHERE
    Major = 'CNTT'
ORDER BY
    Gpa DESC