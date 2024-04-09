/*
Cú pháp:
CREATE TRIGGER [schema_name.]trigger_name
ON {table_name | view_name}
INSTEAD OF {[INSERT][,][UPDATE][,][DELETE]}
AS
{sql_statements}
*/

-- Sau đây ta tạo bảng SubjectApprovals:
CREATE TABLE SubjectApprovals(
    SubjectApprovalId INT IDENTITY(1, 1) PRIMARY KEY,
    SubjectId VARCHAR(50),
    Name NVARCHAR(50),
    Credit INT,
    NumOfLesson INT,
    Type NVARCHAR(50)
)

-- tạo view vw_SubjectInfo
CREATE VIEW vw_SubjectInfo
AS
SELECT
    SubjectId,
    Name,
    Credit,
    NumOfLesson,
    Type,
    'Approved' [Approval Status]
FROM
    Subjects
UNION
SELECT
    SubjectId,
    Name,
    Credit,
    NumOfLesson,
    Type,
    'Pending Approval' [Approval Status]
FROM
    SubjectApprovals;

-- ta tạo trigger để giám sát dữ liệu được chèn vào view:
CREATE TRIGGER TR_SubjectInfo_Insert
ON vw_SubjectInfo
INSTEAD OF INSERT
AS
    BEGIN
        SET NOCOUNT ON;
        INSERT INTO SubjectApprovals(
            SubjectId,
            Name,
            Credit,
            NumOfLesson,
            Type
        )
        SELECT
            ins.SubjectId,
            ins.Name,
            ins.Credit,
            ins.NumOfLesson,
            ins.Type
        FROM
            inserted ins
        WHERE
            ins.Name NOT IN(
                SELECT
                    Name
                FROM
                    Subjects
            );
END;

-- chèn vài bản ghi vào view:
INSERT INTO vw_SubjectInfo(
    SubjectId, 
    Name, 
    Credit, 
    NumOfLesson, 
    Type
)
VALUES
    ('SUBJ1025', N'Spring Framework', 4, 50, N'Chuyên ngành'),
    ('SUBJ1026', N'Phân tích thiết kế CSDL', 3, 36, N'Chuyên ngành');

-- Kiểm tra dữ liệu trong view:
SELECT * FROM vw_SubjectInfo

-- Kiểm tra dữ liệu trong bảng SubjectApprovals:
SELECT * FROM SubjectApprovals;