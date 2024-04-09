/*
Cú pháp của DDL trigger:
CREATE TRIGGER trigger_name
ON {DATABASE | ALL SERVER}
[WITH ddl_trigger_option]
FOR {event_type | event_group}
AS {sql_statement}
*/

-- ta tạo một bảng ghi log giám sát các thay đổi trong CSDL:
CREATE TABLE ChangeLogs(
    ChangeLogId INT IDENTITY PRIMARY KEY,
    [EventData] XML NOT NULL,
    ChangedBy SYSNAME NOT NULL
)

-- tạo DDL trigger để giám sát sự thay đổi của các bảng trong CSDL
CREATE TRIGGER TR_Table_Changes
ON DATABASE
FOR
    CREATE_TABLE,
    DROP_TABLE,
    ALTER_TABLE
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO ChangeLogs(
        [EventData],
        ChangedBy
    )
    VALUES (
        EVENTDATA(),
        USER
    );
END;

-- ta thêm xóa sửa đổi bảng để kiểm tra trigger có hoạt động không:

-- create new table:
CREATE TABLE TestTable1(Id INT PRIMARY KEY IDENTITY);
CREATE TABLE TestTable2(Id INT PRIMARY KEY IDENTITY);
-- drop table:
DROP TABLE TestTable1;
DROP TABLE TestTable2;
-- alter table:
ALTER TABLE 
    Test 
ADD FullName NVARCHAR(200);

--kiểm tra bảng ChangeLogs xem đã xảy ra những sự kiện gì:
SELECT * FROM ChangeLogs;