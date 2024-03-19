/*
Cú pháp:
TRUNCATE TABLE [database_name.][schema_name.]table_name


*/
--Xóa dữ liệu trong bảng với lệnh DELETE:
DELETE FROM office.Person

--Chèn thêm một dòng mới sau khi xóa:
INSERT INTO 
    office.Person (FullName, BirthDate, PhoneNumber) 
VALUES 
    (N'Lê Công Tuấn', '2005-10-15', '0978123654')
-- ta thấy cột IDENTITY không reset lại về 1000


--Bây giờ ta xóa dữ liệu trong bảng với TRUNCATE:
TRUNCATE TABLE office.Person

--Sau đó chèn thêm một dòng mới vào bảng:
INSERT INTO 
    office.Person (FullName, BirthDate, PhoneNumber) 
VALUES 
    (N'Lê Công Tuấn', '2005-10-15', '0978123654')
--Kết quả cột IDENTITY đã reset lại từ đầu – giá trị 1000 ta thiết lập khi tạo bảng.