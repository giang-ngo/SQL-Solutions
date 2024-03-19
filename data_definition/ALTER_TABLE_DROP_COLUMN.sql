/*
Cú pháp:
ALTER TABLE 
    table_name
DROP COLUMN
    col1_name,
    col2_name,
    ...,
    colk_name
*/
--Xóa cột không sử dụng đến.
ALTER TABLE
    MyDatabase.dbo.Person
DROP COLUMN
    Address,
    Email
-- xóa cột Email và cột Address khỏi bảng Person -> thành công!



--Xóa cột chứa ràng buộc.
ALTER TABLE
    MyDatabase.dbo.Person
DROP COLUMN
    Career;
-- thông báo lõi hiện ra:
--The object 'df_value' is dependent on column 'Career'.
--ALTER TABLE DROP COLUMN Career failed because one or more objects access this column.
-- Để xóa thành công ta phải xóa ràng buộc trước:
ALTER TABLE
    MyDatabase.dbo.Person
DROP CONSTRAINT
    df_value;
-- Sau đó xóa cột cần xóa:
ALTER TABLE
MyDatabase.dbo.Person
DROP COLUMN
Career;
-- kết quả xóa thành công!