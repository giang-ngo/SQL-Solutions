/*
Cú pháp:
UPDATE
    table1
SET
    colums = values
FROM
    table1
    [INNER|LEFT] JOIN table2 
    ON join_predicate
WHERE
    where_predicate


1.Tạo bảng Targets mô tả mục tiêu và mức hoa hồng của mỗi mục tiêu nhân viên đạt được.
2.Tạo bảng Salaries mô tả thông tin mức lương nhân viên.
3.Cập nhật tiền hoa hồng cho từng nhân viên dựa trên mục tiêu đạt được và số tiền bán hàng BaseAmount đã có.
4.Thêm mới nhân viên vào bảng lương nhưng không chỉ định mục tiêu doanh thu
*/
DROP TABLE IF EXISTS Salaries--Xóa bảng Salaries
DROP TABLE IF EXISTS Targets--Xóa bảng Targets


--1
CREATE TABLE Targets(
    TargetId INT PRIMARY KEY,
    Percentage DECIMAL(4, 2) NOT NULL DEFAULT 0
);

INSERT INTO
    Targets(TargetId, Percentage)
VALUES
    (1, 0.1),
    (2, 0.2),
    (3, 0.3),
    (4, 0.4),
    (5, 0.5),
    (6, 0.6),
    (7, 0.7),
    (8, 0.8),
    (9, 0.9)

--2
CREATE TABLE Salaries(
    SalaryId INT PRIMARY KEY IDENTITY(100, 1),
    StaffId INT,
    TargetId INT,
    BaseAmount DECIMAL(10, 2) NOT NULL DEFAULT 0,
    BaseSalary DECIMAL(10, 2) NOT NULL DEFAULT 0,
    Commission DECIMAL(10, 2) NOT NULL DEFAULT 0,
    FOREIGN KEY(TargetId) REFERENCES Targets(TargetId),
    FOREIGN KEY(StaffId) REFERENCES Staffs(StaffId)
);

INSERT INTO
    Salaries(StaffId, TargetId, BaseAmount, BaseSalary)
VALUES
    (1, 2, 21400000, 4500000),
    (6, 3, 39500000, 5500000),
    (7, 4, 48500000, 6500000),
    (9, 5, 57100000, 7500000),
    (8, 1, 11500000, 4500000),
    (10, 2, 27500000, 4500000),
    (11, 3, 36500000, 5500000),
    (18, 5, 56800000, 8500000)



--3
UPDATE 
    Salaries
SET
    Salaries.Commission = s.BaseAmount * t.Percentage
FROM
    Salaries s
    INNER JOIN Targets t
    ON s.TargetId = t.TargetId


--4
INSERT INTO
    Salaries(StaffId, BaseAmount, BaseSalary)
VALUES
    (19, 11400000, 4500000),
    (20, 9500000, 4500000),
    (21, 8500000, 4500000),
    (22, 7100000, 4500000),
    (23, 61500000, 4500000)

--Sau đó ta giả định các nhân viên này có mức hoa hồng mặc định 10% và tính tiền hoa hồng cho họ. 
--Lưu ý hàm COALESCE dùng để trả về giá trị 0.1 nếu s.TargetId NULL:
UPDATE 
   Salaries
SET
    Salaries.Commission = s.BaseAmount * COALESCE(t.Percentage, 0.1)
FROM
    Salaries s
    LEFT JOIN Targets t
    ON s.TargetId = t.TargetId