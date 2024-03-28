/*
Cú pháp sau minh họa câu lệnh WHILE:
WHILE condition
    statements


*/
--Ví dụ:Tìm các số chia hết cho 7 trong khoảng từ start đến end:
DECLARE @number INT
DECLARE @start INT = 1
DECLARE @end INT = 99
SET @number = @start
-- thực hiện vòng lặp
WHILE @number <= @end
BEGIN
    IF @number % 7 = 0
    BEGIN
        PRINT @number
    END
    SET @number = @number + 1
END