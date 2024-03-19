/*
Cú pháp:
DROP TABLE [IF EXISTS] [db_name.][schema_name.]table_name
*/

--Xóa bảng không tồn tại trong CSDL:
DROP TABLE MyDatabase.dbo.SomeTable;
-- kết quả:
--Cannot drop the table 'MyDatabase.dbo.SomeTable', because it does not exist or you do not have permission.
-- nếu sử dụng mệnh đề IF EXISTS:
DROP TABLE IF EXISTS MyDatabase.dbo.SomeTable;
-- dù bảng không tồn tại nhưng chương trình không còn bị lỗi


--Xóa bảng tồn tại trong CSDL.
DROP TABLE IF EXISTS MyDatabase.dbo.Test;
-- kết quả: bảng Test trong lược đồ dbo của CSDL MyDatabase đã bị xóa bỏ.


--Xóa bảng chứa ràng buộc khóa ngoại:
DROP TABLE IF EXISTS MyDatabase.dbo.Item;
-- thông báo lỗi hiện ra:
--Could not drop object 'MyDatabase.dbo.Item' because it is referenced by a FOREIGN KEY constraint.
-- để xóa thành công, phải loại bỏ khóa ngoại hoặc bảng chứa khóa ngoại => loại bỏ bảng chứa khóa chính
DROP TABLE IF EXISTS MyDatabase.dbo.ItemOrdered;
DROP TABLE IF EXISTS MyDatabase.dbo.Item;
-- kết quả xóa bảng thành công.