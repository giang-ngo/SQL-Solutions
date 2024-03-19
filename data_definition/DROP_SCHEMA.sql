/*
Cú pháp: DROP SCHEMA [IF EXISTS] schema_name

*/

--Xóa lược đồ đang có đối tượng bên trong:
DROP SCHEMA IF EXISTS office
-- thông báo lỗi xuất hiện:
--Cannot drop schema 'office' because it is being referenced by object 'Person'.

--Xóa lược đồ rỗng:
DROP SCHEMA IF EXISTS sales
-- xóa thành công: Commands completed successfully.