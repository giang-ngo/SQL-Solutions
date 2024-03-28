/*
Cú pháp sau mô tả câu lệnh RAISERROR:
RAISERROR ({message_id | message_text | @local_variable}
    {, severity, state}
    [, argument[, ...]])
    [WITH option[,...]]

*/

--Ví dụ 1: sử dụng RAISERROR với khối TRY CATCH.
DECLARE
    @ErrMessage NVARCHAR(500),
    @ErrSeverity INT,
    @ErrState INT;

BEGIN TRY
    RAISERROR('Error in TRY block.', 17, 1);
END TRY
BEGIN CATCH
    SELECT
        @ErrMessage = ERROR_MESSAGE(),
        @ErrSeverity = ERROR_SEVERITY(),
        @ErrState = ERROR_STATE()
    -- trả về lỗi trong khối catch
    RAISERROR(@ErrMessage, @ErrSeverity, @ErrState);
END CATCH

-- kết quả:
--Msg 50000, Level 17, State 1, Line 15
--Error in TRY block.

--Ví dụ 2: sử dụng RAISERROR với biến cục bộ và thông điệp lỗi có thể biến đổi(dynamic message text). Sử dụng %s để biểu diễn cho tham số chứa phần text có thể thay đổi:
DECLARE @msgText NVARCHAR(100);
SET @msgText = N'Không thể xóa bản ghi mã %s'
RAISERROR(
    @msgText, -- thông điệp lỗi
    16, -- cấp độ nghiêm trọng
    1, -- trạng thái
    N'205' -- đối số thứ nhất gửi tới thông điệp lỗi thế chỗ cho %s đầu tiên
)

-- kết quả:
--Không thể xóa bản ghi mã 205