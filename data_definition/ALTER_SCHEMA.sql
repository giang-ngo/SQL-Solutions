/*
Cú pháp:
ALTER SCHEMA target_schema TRANSFER [entity_type::]object_name

*/
--Ví dụ chuyển bảng Person từ lược đồ dbo sang lược đồ office:
ALTER SCHEMA office
TRANSFER OBJECT::dbo.Person
-- Sau khi chuyển bảng sang lược đồ office thì ta thấy tên bảng có tiền tố office. thay vì dbo.