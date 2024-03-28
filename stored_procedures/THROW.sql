/*
**Sau đây là cú pháp của câu lệnh THROW:
THROW [error_number, 
     message,
     state]

**Nếu bạn không chỉ định bất kì tham số nào cho câu lệnh THROW bạn cần đặt THROW bên trong khối CATCH.
BEGIN TRY
    -- các lệnh có thể xảy ra ngoại lệ
END TRY
BEGIN CATCH
    -- các câu lệnh xử lý ngoại lệ
    THROW;
END CATCH
*/

--Sử dụng THROW để kích hoạt một ngoại lệ:
THROW 50005, N'Ngoại lệ nào đó đã xảy ra', 1;

-- kết quả:
--Msg 50005, Level 16, State 1, Line 1
--Ngoại lệ nào đó đã xảy ra

--Ném lại ngoại lệ đã xảy ra:
CREATE TABLE T1(
    Id INT PRIMARY KEY
);
GO
BEGIN TRY
    INSERT INTO T1(Id) VALUES(100);
    INSERT INTO T1(Id) VALUES(100);
END TRY
BEGIN CATCH
    PRINT N'Ném lại ngoại lệ đã xảy ra';
    THROW;
END CATCH


-- kết quả:
--(1 row affected)

--(0 rows affected)
--Ném lại ngoại lệ đã xảy ra
--Msg 2627, Level 14, State 1, Line 7
--Violation of PRIMARY KEY constraint 'PK__T1__3214EC07FD9ADFC7'.
--Cannot insert duplicate key in object 'dbo.T1'. The duplicate key value is (100).


--Sau đây ta sẽ THROW một ngoại lệ được định nghĩa trong sys.messages:
EXEC sys.sp_addmessage 
    @msgnum = 50050, 
    @severity = 16, 
    @msgtext = N'The order number %s cannot be deleted because it does not exist.', 
    @lang = 'us_english'; 
GO
-- sau đây ta thay thế %s trong msgtext trên bằng giá trị '5005':
DECLARE @mesgText NVARCHAR(100);
SET @mesgText = FORMATMESSAGE(50050, N'5005');
THROW 50050, @mesgText, 1;

-- kết quả:
--Msg 50050, Level 16, State 1, Line 3
--The order number 5005 cannot be deleted because it does not exist.