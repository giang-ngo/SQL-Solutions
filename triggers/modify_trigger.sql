/*
**Cú pháp sửa đổi DML trigger:
ALTER TRIGGER [schema_name.]trigger_name 
ON ( table | view ) 
[ WITH <dml_trigger_option> [ ,...n ] ] 
( FOR | AFTER | INSTEAD OF ) 
{ [ DELETE ] [ , ] [ INSERT ] [ , ] [ UPDATE ] } 
[ NOT FOR REPLICATION ] 
AS { sql_statements };

**Cú pháp sửa đổi DDL trigger:
ALTER TRIGGER trigger_name 
ON { DATABASE | ALL SERVER } 
[ WITH <ddl_trigger_option> [ ,...n ] ] 
{ FOR | AFTER } { event_type [ ,...n ] | event_group } 
AS { sql_statements }
*/

--Sửa đổi một trigger DML:
ALTER TRIGGER [dbo].[TR_Subject_Inserts]
ON [dbo].[Subjects]
AFTER INSERT
AS
BEGIN
    PRINT N'Một dòng mới đã được thêm vào bảng Subjects';
    DECLARE @id VARCHAR(20);
    SELECT
        @id = SubjectId
    FROM
        inserted;
    PRINT N'Mã môn học: ' + @id;
END;

--Khi chèn một bản ghi mới vào bảng Subjects, trigger sẽ được kích hoạt:
INSERT INTO Subjects(SubjectId, Name, Credit, NumOfLesson, Type) 
VALUES('SUBJ1204', N'Đại số', 3, 36, N'Cơ bản');
-- kết quả hiển thị:
--Một dòng mới đã được thêm vào bảng Subjects
--Mã môn học: SUBJ1204