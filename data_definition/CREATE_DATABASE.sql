--Ví dụ tạo CSDL mới tên là NewDatabase:
CREATE DATABASE NewDatabase


--Lệnh SQL sau liệt kê tất cả các CSDL hiện có trong SQL Server hoặc các server khác:
SELECT 
    name
FROM 
    master.sys.databases
ORDER BY 
    name