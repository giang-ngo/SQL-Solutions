/*
Cú pháp sửa đổi kiểu dữ liệu của cột:
ALTER TABLE 
    table_name
ALTER COLUMN
    column_name data_type(size)

*/

--Sửa kiểu dữ liệu của bảng:
ALTER TABLE 
    MyDatabase.dbo.Person
ALTER COLUMN
    Address VARCHAR(100)
-- chuyển đổi cột Address từ NVARCHAR sang VARCHAR


--Thay đổi kích thước kiểu dữ liệu:
ALTER TABLE 
    MyDatabase.dbo.Person
ALTER COLUMN
    Address VARCHAR(500)
-- sửa kích thước cột Address từ 100 lên 500 kí tự


--Sửa ràng buộc của cột nào đó trong bảng:
ALTER TABLE 
    MyDatabase.dbo.Person
ALTER COLUMN
    PhoneNumber VARCHAR(20) NOT NULL
-- Chuyển cột PhoneNumber từ cho phép NULL sang NOT NULL