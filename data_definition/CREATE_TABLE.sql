/*
Để tạo bảng, ta sử dụng cú pháp sau:
CREATE TABLE [db_name.][schema_name.]table_name (
    pk_column data_type PRIMARY KEY,
    column1 data_type NOT NULL,
    column2 data_type DEFAULT default_value_of_type,
    ...
    table_constraints
)


*/
--Tạo bảng lưu trữ thông tin mặt hàng(Mã, tên, hãng sản xuất, loại, giá bán, số lượng, khối lượng, kích thước). 
--Khóa chính là mã mặt hàng tự tăng từ 100.
CREATE TABLE Item(
    Id INT IDENTITY(100, 1) NOT NULL,
    Name NVARCHAR(100),
    Brand NVARCHAR(100),
    Type NVARCHAR(100),
    Quantity INT DEFAULT 0,
    Weight FLOAT DEFAULT 0,
    Size NVARCHAR(100),
    PRIMARY KEY(Id) -- chỉ định khóa chính
)

--Tạo bảng khách hàng(mã khách hàng, họ tên khách, địa chỉ, email, số điện thoại, điểm tích lũy, loại khách hàng). 
--Khóa chính là mã khách hàng tự tăng từ 1000.
CREATE TABLE MyDatabase.dbo.Customer(
    Id INT PRIMARY KEY IDENTITY(1000, 1),
    FullName NVARCHAR(50),
    Address NVARCHAR(100),
    Email VARCHAR(50),
    PhoneNumber VARCHAR(20),
    Point INT NOT NULL DEFAULT 0,
    CustomerType NVARCHAR(50)
)

--Tạo bảng đặt hàng(mã đặt hàng, mã khách, mã mặt hàng, số lượng, thời gian đặt hàng, trạng thái đặt hàng). 
--Khóa chính là mã đặt hàng tự động tăng cách nhau 2 đơn vị tính từ 1. Khóa ngoại là mã khách, mã mặt hàng.
CREATE TABLE MyDatabase.dbo.ItemOrdered(
    Id INT PRIMARY KEY IDENTITY(100, 2) NOT NULL,
    CustomerId INT NOT NULL,
    ItemId INT NOT NULL,
    NumberOfItem INT DEFAULT 0,
    CreatedAt DATETIME DEFAULT GETDATE(),
    Status NVARCHAR DEFAULT 'Success',
    FOREIGN KEY(CustomerId) REFERENCES MyDatabase.dbo.Customer(Id),
    FOREIGN KEY(ItemId) REFERENCES MyDatabase.dbo.Item(Id)
)