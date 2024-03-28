/*
Sau đây là cú pháp đầy đủ của xử lý ngoại lệ:
BEGIN TRY
    -- statements may cause exceptions
END TRY
BEGIN CATCH
    -- statements that handle exception
END CATCH

Ví dụ:
BEGIN TRY
    -- các câu lệnh có thể xảy ra ngoại lệ
END TRY
BEGIN CATCH
    -- các lệnh xử lý ngoại lệ
    BEGIN TRY
        -- khối TRY lồng trong khối CATCH
    END TRY
    BEGIN CATCH
        -- các lệnh xử lý ngoại lệ lồng bên trong
    END CATCH
END CATCH
*/

--Ví dụ sau minh họa bắt và xử lý ngoại lệ chia cho 0:
CREATE PROC usp_Divide(
    @a FLOAT,
    @b FLOAT,
    @c FLOAT OUTPUT
) AS
BEGIN
    BEGIN TRY
        SET @c = @a / @b;
    END TRY
    BEGIN CATCH
        SELECT
            ERROR_NUMBER() AS ErrorNumber,
            ERROR_SEVERITY() AS ErrorSeverity,
            ERROR_STATE() AS ErrorState,
            ERROR_PROCEDURE() AS ErrorProcedure,
            ERROR_LINE() AS ErrorLine,
            ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END
GO

--Sau đó ta biên dịch và chạy lệnh SQL sau:
DECLARE @result FLOAT;
EXEC usp_Divide 20, 4, @result OUTPUT
PRINT @result
-- kết quả: 
--5

--Tiếp tục chạy lệnh SQL sau:
DECLARE @result FLOAT
EXEC usp_Divide 20, 0, @result OUTPUT;
PRINT @result