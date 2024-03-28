/*
Cú pháp của câu lệnh IF:
IF boolean_expression
BEGIN
    statement_block
END
*/
--Ví dụ 1:
BEGIN
    DECLARE @district NVARCHAR(50);
    DECLARE @numberOfCustomer INT;
    SET @district = N'Ba Đình';

    SELECT 
        @numberOfCustomer = COUNT(*)
    FROM
        Customers
    WHERE
        District = @district;
    -- xử lý kết quả và đửa ra kết luận
    IF @numberOfCustomer = 0 -- nếu giá trị biến bằng 0
    BEGIN
        PRINT N'Không có khách hàng nào ở quận ' + @district;
    END
END
-- kết quả: Không có khách hàng nào ở quận Ba Đình

/*
Cú pháp IF ELSE đầy đủ:
IF condition
BEGIN
    do_something 
END
ELSE
BEGIN
    do_other_thing
END

*/

--Ví dụ 1:
BEGIN
    DECLARE @district NVARCHAR(50);
    DECLARE @numberOfCustomer INT;
    SET @district = N'Cầu Giấy';

    SELECT 
        @numberOfCustomer = COUNT(*)
    FROM
        Customers
    WHERE
        District = @district;
    -- xử lý kết quả và đửa ra kết luận
    IF @numberOfCustomer = 0 -- nếu giá trị biến bằng 0
    BEGIN
        PRINT N'Không có khách hàng nào ở quận ' + @district;
    END
    ELSE
    BEGIN
        PRINT N'Có ' + STR(@numberOfCustomer, 1) + N' khách hàng nào ở quận ' + @district;
    END
END
-- kết quả: Có 2 khách hàng nào ở quận Cầu Giấy


--Ví dụ 2:
BEGIN
    DECLARE @a INT;
    DECLARE @b INT;
    SET @a = 60;
    SET @b = 30;

    IF @a % @b = 0 -- nếu giá trị trong biến @a chia hết cho giá trị trong biến @b
    BEGIN
        IF @a % 2 = 0
        BEGIN
            PRINT STR(@a, 2) + N' là số chẵn và chia hết cho ' + STR(@b, 2);
        END
        ELSE
        BEGIN
            PRINT STR(@a, 2) + N' là số lẻ và chia hết cho ' + STR(@b, 2);
        END
    END
    ELSE
    BEGIN
        PRINT STR(@a, 2) + N' không chia hết cho ' + STR(@b, 2);
    END
END
-- kết quả: 60 là số chẵn và chia hết cho 30