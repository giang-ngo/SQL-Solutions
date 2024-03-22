/*
Cú pháp thiết lập ràng buộc UNIQUE:
-- thiết lập ràng buộc cột
column_name data_type UNIQUE
-- hoặc thiết lập ràng buộc bảng:
UNIQUE(column_name)


*/
--Sau đây ta sẽ tạo ràng buộc UNIQUE ở cấp độ ràng buộc bảng và có đặt tên:
DROP TABLE IF EXISTS Teachers

CREATE TABLE Teachers(
    TeacherId VARCHAR(30) PRIMARY KEY,
    FirstName NVARCHAR(30),
    LastName NVARCHAR(30),
    PhoneNumber VARCHAR(20),
    Regular NVARCHAR(200),
    CONSTRAINT UQ_PhoneNumber UNIQUE(PhoneNumber)
)

--Chèn dữ liệu vào bảng:
INSERT INTO 
    Teachers(TeacherId, FirstName, LastName, PhoneNumber, Regular)
VALUES
    ('T001', N'Nam', N'Trần', '0934123123', 'SQL'),
    ('T002', N'Trang', N'Ngô', '0934123124', 'C++'),
    ('T003', N'Tuấn', N'Nguyễn', '0934123122', 'Java'),
    ('T004', N'Oanh', N'Hoàng', '0934123125', 'NodeJs');
-- sau đó thêm một giáo viên mới:
INSERT INTO 
    Teachers(TeacherId, FirstName, LastName, PhoneNumber, Regular)
VALUES
    ('T005', N'Quang', N'Trương', '0934123123', 'C#')
-- lỗi: do dữ liệu trong cột unique bị trùng lặp
--Violation of UNIQUE KEY constraint 'UQ__Teachers__85FB4E38CCF3B8E5'. 
--Cannot insert duplicate key in object 'dbo.Teachers'. 
--The duplicate key value is (0934123123).


-- xóa bảng cũ
DROP TABLE IF EXISTS Teachers
-- tạo lại bảng không có ràng buộc
CREATE TABLE Teachers(
    TeacherId VARCHAR(30) PRIMARY KEY,
    FirstName NVARCHAR(30),
    LastName NVARCHAR(30),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20),
    Regular NVARCHAR(200),
)
-- thêm ràng buộc
ALTER TABLE Teachers
ADD CONSTRAINT Unique_Email UNIQUE(Email)

-- xóa ràng buộc cũ 
ALTER TABLE Teachers 
DROP CONSTRAINT Unique_Email;
 
-- tạo mới ràng buộc 
ALTER TABLE Teachers 
ADD CONSTRAINT Unique_PhoneNumber UNIQUE(PhoneNumber)