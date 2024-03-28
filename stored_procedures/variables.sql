/*
Để khai báo một biến bạn sử dụng keyword DECLARE với cú pháp sau:
DECLARE @variable_name [AS] type

*/

--Ví dụ:
DECLARE @maxAge INT

--Ví dụ sau khai báo 3 biến:
DECLARE @firstName NVARCHAR(50),
        @age INT,
        @gpa FLOAT

--Để gán giá trị cho biến, sử dụng cú pháp sau:
--SET @name = value

--Ví dụ sau sử dụng biến với câu lệnh SELECT:
DECLARE @district NVARCHAR(200); -- khai báo biến
SET @district = N'Hai Bà Trưng'; -- gán giá trị cho biến
-- thực hiện truy vấn
SELECT
    *
FROM
    Customers
WHERE 
    District = @district
ORDER BY
    FirstName ASC


-- Vd: đếm số lượng khách hàng trong bảng Customers:
DECLARE @numberOfCustomers INT;
SET @numberOfCustomers = (
    SELECT
        COUNT(*)
    FROM
        Customers
);
-- sau đó ta hiển thị giá trị ra hoặc đem sử dụng trong các câu lệnh khác
-- PRINT @numberOfCustomers;
-- hoặc hiển thị bằng select:
SELECT @numberOfCustomers AS NumberOfCustomer;
-- kết quả: 12

-- Vd: đếm số lượng khách hàng có địa chỉ ở quận Hai Bà Trưng trong bảng Customers:
DECLARE @district NVARCHAR(50);
SET @district = N'Hai Bà Trưng';

DECLARE @numberOfCustomers INT;
SELECT
    @numberOfCustomers = COUNT(*)
FROM
    Customers
WHERE
    District = @district

-- sau đó ta hiển thị giá trị ra hoặc đem sử dụng trong các câu lệnh khác
SELECT @numberOfCustomers AS NumberOfCustomer;
-- kết quả: 3


--Lấy danh sách toàn bộ khách hàng trong bảng Customers:
CREATE OR ALTER PROC usp_Customers_GetCustomerList
AS
BEGIN
    DECLARE @customerList NVARCHAR(MAX);
    SET @customerList = '';
    SELECT
        @customerList = @customerList + STR(CustomerId) + ' - ' + 
                        LastName + ' ' + FirstName + ' - ' +
                        Email + CHAR(10)
    FROM
        Customers
    ORDER BY
        FirstName
    -- hiển thị kết quả
    PRINT @customerList;
END;
-- sau đó thực thi thủ tục:
EXEC usp_Customers_GetCustomerList