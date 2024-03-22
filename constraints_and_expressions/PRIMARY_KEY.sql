/*
Nếu khóa chính của bảng chỉ bao gồm một cột ta sử dụng trực tiếp cú pháp sau để thiết lập khóa chính cho bảng:
CREATE TABLE table_name(
    PK_column data_type PRIMARY KEY,
    other_column....
)


Trường hợp khóa chính gồm nhiều cột, ta sử dụng cú pháp như sau:
CREATE TABLE table_name(
    PK_column1 data_type,
    PK_column2 data_type,
    other_column....
    PRIMARY KEY(PK_column1, PK_column2)
)
*/
--Ví dụ bảng có 1 cột cấu thành khóa chính:
CREATE TABLE MyDatabase.dbo.Activities(
    PK_Activities INT PRIMARY KEY IDENTITY(100, 1),
    Name NVARCHAR(200),
    ActivityDate DATETIME
)

--Ví dụ bảng có 2 cột cấu thành khóa chính:
CREATE TABLE MyDatabase.dbo.Participants(
    PK_Activities INT,
    PK_Participants VARCHAR(20),
    Name NVARCHAR(200),
    JoinAt DATETIME,
    PRIMARY KEY(PK_Activities, PK_Participants)
)


--Thêm khóa chính cho bảng chưa có khóa chính:
CREATE TABLE MyDatabase.dbo.Events(
    PK_Events INT,
    Name NVARCHAR(200),
    StartAt DATETIME,
    EndAt DATETIME
)
-- thiết lập khóa chính
ALTER TABLE
    MyDatabase.dbo.Events
ADD PRIMARY KEY(PK_Events);
-- khi chạy bị lỗi do thiết lập khóa chính trên cột cho phép NULL:
--Msg 8111, Level 16, State 1, Line 23
--Cannot define PRIMARY KEY constraint on nullable column in table 'Events'.
--Msg 1750, Level 16, State 0, Line 23
--Could not create constraint or index. See previous errors.

-- sửa lại lệnh SQL, xóa bỏ bảng đã có và chạy lại:
CREATE TABLE MyDatabase.dbo.Events(
    PK_Events INT NOT NULL,
    Name NVARCHAR(200),
    StartAt DATETIME,
    EndAt DATETIME
);
-- thiết lập khóa chính
ALTER TABLE
    MyDatabase.dbo.Events
ADD PRIMARY KEY(PK_Events)
