/*
**Sau đây là cú pháp xóa bỏ trigger DML:
DROP TRIGGER [ IF EXISTS ] [schema_name.]trigger_name [ ,...n ];

**Sau đây là cú pháp xóa bỏ trigger DDL:
DROP TRIGGER [ IF EXISTS ] trigger_name [ ,...n ] 
ON { DATABASE | ALL SERVER };

**Để xóa LOGON trigger ta sử dụng cú pháp:
DROP TRIGGER [ IF EXISTS ] trigger_name [ ,...n ] 
ON ALL SERVER;
*/

--Xóa trigger DML:
DROP TRIGGER IF EXISTS TR_Subject_Inserts;

--Xóa trigger DDL:
DROP TRIGGER TR_Table_Changes ON DATABASE;