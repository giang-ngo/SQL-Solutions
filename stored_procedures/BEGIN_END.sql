/*
Cú pháp:
BEGIN
    sql_statement | block
END
*/
--Ví dụ:
BEGIN
    DECLARE @major VARCHAR(200) = 'CNTT'
    DECLARE @numberOfGoodITStudent INT
    DECLARE @gpa FLOAT = 3.2

    -- select
    SELECT
        *
    FROM
        Students
    WHERE
        Major = @major
    AND
        Gpa >= @gpa;

    -- đếm số lượng SV CNTT
    SELECT
        @numberOfGoodITStudent = COUNT(*)
    FROM
        Students
    WHERE
        Major = @major
        AND
        Gpa >= @gpa

    -- hiển thị ra
    SELECT @numberOfGoodITStudent NumberOfGoodITStudent;
END
