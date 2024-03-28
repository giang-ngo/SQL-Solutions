--Ví dụ sau sẽ tạo stored procedure 1 tham số:
CREATE PROC usp_Students_FindByGpa(@gpa AS FLOAT)
AS
BEGIN
    SELECT
        *
    FROM
        Students
    WHERE
        Gpa >= @gpa
    ORDER BY
        Gpa DESC
END;
-- sau khi biên dịch ta thực thi thủ tục trên:
EXEC usp_Students_FindByGpa 3.6


--Ví dụ sau sẽ tạo stored procedure nhiều tham số với giá trị mặc định:
CREATE OR ALTER PROC usp_Students_FindByGpa(
    @minGpa AS FLOAT = 0,
    @maxGpa AS FLOAT = 4 
)
AS
BEGIN
    SELECT
        *
    FROM
        Students
    WHERE
        Gpa >= @minGpa
    AND
        Gpa <= @maxGpa
    ORDER BY
        Gpa DESC
END

--Ví dụ với lời gọi thủ tục hai tham số bên trên ta có thể viết thành:
EXEC usp_Students_FindByGpa 
    @minGpa = 3.2, 
    @maxGpa = 3.65