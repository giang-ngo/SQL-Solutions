/*
Sau đây là cú pháp của câu lệnh CREATE TRIGGER:
CREATE TRIGGER [schema_name.]trigger_name
ON table_name
AFTER {[INSERT], [UPDATE], [DELETE]}
[NOT FOR REPLICATION]
AS
{sql_statements}
*/

--Ta tạo một bảng đặt tên là StoreAudits để giám sát ghi lại thông tin bản ghi khi xảy ra sự kiện INSERT, DELETE trong bảng Stores:
CREATE TABLE StoreAudits(
    StoreAuditId INT IDENTITY PRIMARY KEY,
    StoreId int NOT NULL,
    StoreName NVARCHAR(255),
    Phone VARCHAR(25),
    Email NVARCHAR(255),
    AddressNumber NVARCHAR(255),
    Street NVARCHAR(255),
    District NVARCHAR(255),
    City NVARCHAR(255),
    UpdateAt DATETIME NOT NULL,
    Operation CHAR(3) NOT NULL,
    CHECK(Operation = 'INS' or Operation = 'DEL')
)


--Sau đó ta tạo trigger giám sát sự kiện insert và delete xảy ra ở bảng Stores.
CREATE TRIGGER TR_StoreAudits_AfterInsertAndDelete
ON dbo.Stores 
AFTER INSERT, DELETE
AS
BEGIN
    SET NOCOUNT ON; -- không hiển thị thông báo đã chèn bản ghi thành công vào bảng giám sát khi trigger được kích hoạt
    INSERT INTO StoreAudits(
        StoreId,
        StoreName,
        Phone,
        Email,
        AddressNumber,
        Street,
        District,
        City,
        UpdateAt,
        Operation
    )
    SELECT
        ins.StoreId,
        ins.StoreName,
        ins.Phone,
        ins.Email,
        ins.AddressNumber,
        ins.Street,
        ins.District,
        ins.City,
        GETDATE(),
        'INS'
    FROM
        INSERTED ins
    UNION ALL
    SELECT
        del.StoreId,
        del.StoreName,
        del.Phone,
        del.Email,
        del.AddressNumber,
        del.Street,
        del.District,
        del.City,
        GETDATE(),
        'DEL'
    FROM
        DELETED del
END

--Ta biên dịch lệnh trên sau đó kiểm tra kết quả:
INSERT INTO Stores(StoreName, Phone, Email, AddressNumber, Street, District, City)
VALUES('FPT Shop', '19001288', 'fptshop@xmail.com', N'373 Cầu Diễn', N'Cầu Diễn', N'Nam Từ Liêm', N'Hà Nội');
DELETE FROM 
    Stores
WHERE
    StoreId = 9;


--Ta kiểm tra dữ liệu trong bảng giám sát:
SELECT * FROM StoreAudits;
