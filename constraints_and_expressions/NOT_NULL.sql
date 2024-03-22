--Tạo bảng với cột có ràng buộc NOT NULL:
CREATE TABLE Mydatabase.dbo.Items(
    PK_Items INT PRIMARY KEY IDENTITY(1000, 2),
    Name NVARCHAR(100) NOT NULL,
    Quantity INT NOT NULL DEFAULT 0,
    Price FLOAT NOT NULL DEFAULT 0
)

--Sửa đổi ràng buộc cho một cột trong bảng có trước đó:
-- thêm cột mới cho phép NULL:
ALTER TABLE 
    Mydatabase.dbo.Items
ADD 
    Brand NVARCHAR(50) NULL;
-- sau đó sửa ràng buộc thành NOT NULL:
ALTER TABLE 
    Mydatabase.dbo.Items
ALTER COLUMN 
    Brand NVARCHAR(50) NOT NULL


--Xóa ràng buộc NOT NULL khỏi cột nào đó:
ALTER TABLE 
    Mydatabase.dbo.Items
ALTER COLUMN 
    Name NVARCHAR(100) NULL