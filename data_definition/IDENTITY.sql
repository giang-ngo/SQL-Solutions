/*
Cột IDENTITY trong SQL Server hay AUTO_INCREMENT trong MySQL chứa giá trị tự động tăng trong một bảng nào đó.
Cú pháp để thiết lập giá trị cho một cột là IDENTITY:
IDENTITY[(seed, increment)]
*/

--Tạo bảng với cột IDENTITY.
CREATE TABLE MyDatabase.dbo.Person(
    Id INT IDENTITY(1000, 2) PRIMARY KEY, -- giá trị tự tăng từ 1000, mỗi lần tăng 2 đơn vị
    FullName NVARCHAR(50),
    BirthDate DATE,
    PhoneNumber VARCHAR(20)
);
--Chèn dữ liệu vào bảng có cột IDENTITY.
INSERT INTO 
    MyDatabase.dbo.Person(FullName, BirthDate, PhoneNumber)
VALUES
    (N'Lê Công Tuấn', '2005-10-15', '0978123654'),
    (N'Trần Thanh Tâm', '2006-03-11', '0978123651'),
    (N'Nguyễn Ngọc Anh', '2006-11-15', '0978123652'),
    (N'Hoàng Khánh Duy', '2007-03-30', '0978123653'),
    (N'Mai Đức Thành', '2005-04-25', '0978123657')

--Chèn dữ liệu vào cột IDENTITY của bảng.
INSERT INTO 
    MyDatabase.dbo.Person(Id, FullName, BirthDate, PhoneNumber)
VALUES
    (1024, N'Đặng Tiến Mạnh', '2007-10-17', '0978123659')
-- thông báo lỗi: Cannot insert explicit value for identity column in table 'Person' when IDENTITY_INSERT is set to OFF.
-- để chèn thành công ta phải bật trạng thái IDENTITY_INSERT ON trên cột IDENTITY sau đó chèn xong tắt nó đi về trạng thái cũ:
SET IDENTITY_INSERT MyDatabase.dbo.Person ON; -- bật cho phép chèn giá trị tường minh vào cột tự tăng
INSERT INTO 
    MyDatabase.dbo.Person(Id, FullName, BirthDate, PhoneNumber)
VALUES
    (1024, N'Đặng Tiến Mạnh', '2007-10-17', '0978123659');
SET IDENTITY_INSERT MyDatabase.dbo.Person OFF; -- tắt chèn tường minh vào cột tự tăng
-- chèn thêm dòng mới => giá trị tự tăng tiếp tục từ giá trị ngay trước đó, tức là từ 1024 -> 1026. không phải 1008 -> 1010
INSERT INTO 
    MyDatabase.dbo.Person(FullName, BirthDate, PhoneNumber)
VALUES
    (N'Lường Thị Thanh Yên', '2007-05-14', '0978123759')