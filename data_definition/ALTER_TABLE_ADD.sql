/*
Cú pháp tổng quát:
ALTER TABLE 
    table_name
ADD 
    col1_name data_type col1_constraint,
    col2_name data_type col2_constraint,
    ...
    coln_name data_type coln_constraint


*/

--Thêm 1 cột mới vào bảng Person.
ALTER TABLE 
    MyDatabase.dbo.Person
ADD
    Email VARCHAR(50) NULL

--Thêm 2 cột mới vào bảng Person.
ALTER TABLE 
    MyDatabase.dbo.Person
ADD
    Address NVARCHAR(100) NULL,
    Career NVARCHAR(100) NULL