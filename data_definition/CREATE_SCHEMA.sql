/*
Cú pháp tạo lược đồ:
CREATE SCHEMA schema_name [AUTHORIZATION owner_name]

Trong đó:
ta chỉ định tên của lược đồ ở mục schema_name.
Chỉ định người sở hữu ở mục owner_name(tùy chọn).

*/
--tạo lược đồ production và sales, customer_services, chạy từng lệnh tạo lược đồ:
CREATE SCHEMA production;
CREATE SCHEMA sales;
CREATE SCHEMA customer_services;

-- tạo bảng trong lược đồ sales:
CREATE TABLE sales.Events(
    PK_Events INT PRIMARY KEY IDENTITY(100, 3),
    Name NVARCHAR(200),
    StartAt DATETIME,
    EndAt DATETIME
);

--Liệt kê danh sách các lược đồ có trong CSDL nào đó:
SELECT 
    s.name AS schema_name, 
    u.name AS schema_owner
FROM 
    sys.schemas s
INNER JOIN sys.sysusers u ON u.uid = s.principal_id
ORDER BY 
    s.name;