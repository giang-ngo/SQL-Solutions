/*
**Để tạo SQL động bạn chỉ cần tạo một chuỗi kí tự mô tả câu lệnh SQL và thực hiện việc chạy lệnh về sau với thủ tục sp_executesql.
Thủ tục sp_executesql có dạng sau:
EXEC sp_executesql
    sql_statement,
    parameter_definition,
    @param1 = value1,
    @param2 = value2,
    ...

*/

--Ví dụ sau tạo và thực thi một lệnh SQL động:
DECLARE 
    @tableName VARCHAR(200),
    @sql NVARCHAR(MAX)

SET @tableName = 'dbo.Students'
SET @sql = N'SELECT * FROM ' + @tableName

-- chạy lệnh SQL động
EXEC sp_executesql @sql

--**SQL động với Stored procedure
--Ví dụ sau sẽ nhận vào tên bảng, số dòng cần trả về và tiêu chí sắp xếp để trả về top n dòng đầu tiên có giá trị cao nhất trong bảng bất kì:
CREATE OR ALTER PROC usp_QueryTopN(
    @tableName NVARCHAR(200),
    @topN INT,
    @byColumn NVARCHAR(200)
) 
AS
BEGIN
    DECLARE
        @sql NVARCHAR(MAX),
        @topNStr NVARCHAR(MAX);

    SET @topNStr = STR(@topN);
    SET @sql = N'SELECT TOP ' + @topNStr + ' WITH TIES *' +
        'FROM ' + @tableName + 
        ' ORDER BY ' + @byColumn + ' DESC';

-- chạy lệnh SQL động
    EXEC sp_executesql @sql;
END;
--Sau đó chạy lệnh SQL
EXEC usp_QueryTopN 
    'dbo.Students', 
    5,
    'Gpa';

--Thay tên bảng và tên cột để sắp xếp ta có kết quả khác:
EXEC usp_QueryTopN 
    'dbo.Subjects', 
    4,
    'Credit'

