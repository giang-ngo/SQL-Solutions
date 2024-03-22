--Ví dụ tạo ràng buộc:
CREATE TABLE sales.Products(
    PK_Products INT PRIMARY KEY IDENTITY(100, 1),
    Name NVARCHAR(200),
    Price INT CONSTRAINT Price_Positive CHECK(Price > 0),
    Quantity INT CONSTRAINT Quantity_Positive CHECK(Quantity > 0)
)

--Sau đó ta chèn dữ liệu vào bảng:
INSERT INTO 
    sales.Products(Name, Price, Quantity)
VALUES 
    ('iPhone 16 Pro Max', 0, 100);
-- thông báo lỗi:
--The INSERT statement conflicted with the CHECK constraint "Price_Positive". 
--The conflict occurred in database "MyDatabase", table "sales.Products", column 'Price'.

--Để chèn thành công dữ liệu vào bảng, ta cần đảm bảo giá bán và số lượng sản phẩm phải là số dương. Khi đó biểu thức trong ràng buộc CHECK sẽ TRUE:
INSERT INTO 
    sales.Products(Name, Price, Quantity)
VALUES 
    ('iPhone 16 Pro Max', 38000000, 100);
-- chèn thành công:
--(1 row affected)

DROP TABLE IF EXISTS sales.Products

CREATE TABLE sales.Products(
    PK_Products INT PRIMARY KEY IDENTITY(100, 1),
    Name NVARCHAR(200),
    OriginalPrice INT CONSTRAINT Price_Positive CHECK(OriginalPrice > 0), -- ràng buộc cột
    DiscountedPrice INT CONSTRAINT DiscountedPrice_Positive CHECK(DiscountedPrice > 0), -- ràng buộc cột
    Quantity INT CONSTRAINT Quantity_Positive CHECK(Quantity > 0), -- ràng buộc cột
    CONSTRAINT DiscountedPrice_LessThan_OriginalPrice CHECK(DiscountedPrice < OriginalPrice) -- ràng buộc của bảng
)

--Ta có thể viết lại lệnh SQL tương đương:
CREATE TABLE sales.Products(
    PK_Products INT PRIMARY KEY IDENTITY(100, 1),
    Name NVARCHAR(200),
    OriginalPrice INT,
    DiscountedPrice INT,
    Quantity INT,
    -- sau đây là các ràng buộc của bảng
    CONSTRAINT Price_Positive CHECK(OriginalPrice > 0),
    CONSTRAINT DiscountedPrice_Positive CHECK(DiscountedPrice > 0),
    CONSTRAINT Quantity_Positive CHECK(Quantity > 0),
    CONSTRAINT DiscountedPrice_LessThan_OriginalPrice CHECK(DiscountedPrice < OriginalPrice)
)

--Hoặc tương đương:
CREATE TABLE sales.Products(
    PK_Products INT PRIMARY KEY IDENTITY(100, 1),
    Name NVARCHAR(200),
    OriginalPrice INT,
    DiscountedPrice INT,
    Quantity INT,
    -- sau đây là các ràng buộc của bảng không đặt tên tường minh
    CHECK(OriginalPrice > 0),
    CHECK(DiscountedPrice > 0),
    CHECK(Quantity > 0),
    CHECK(DiscountedPrice < OriginalPrice)
)


-- xóa bỏ bảng cũ
DROP TABLE IF EXISTS sales.Products
-- tạo lại bảng mới không chứa ràng buộc CHECK
CREATE TABLE sales.Products(
    PK_Products INT PRIMARY KEY IDENTITY(100, 1),
    Name NVARCHAR(200),
    OriginalPrice INT,
    DiscountedPrice INT,
    Quantity INT,
)
-- sửa đổi bảng và thêm ràng buộc CHECK
ALTER TABLE 
    sales.Products
ADD CONSTRAINT
    OriginalPrice_Positive
    CHECK(OriginalPrice > 0)

--Để thêm cột cùng ràng buộc vào bảng ta làm như sau:
ALTER TABLE 
   sales.Products 
ADD 
   DiscountPercent INT 
   CONSTRAINT Discount_Limit 
   CHECK(DiscountPercent >= 0 AND DiscountPercent <= 100) 
-- Sau khi chạy lệnh SQL ta kiểm tra bảng vừa tạo, chọn Constraints như hình để xem danh sách ràng buộc hiện có.

--Xóa ràng buộc
ALTER TABLE
    sales.Products
DROP CONSTRAINT
    Discount_Limit;

--Vô hiệu hóa ràng buộc 
ALTER TABLE 
   sales.Products 
NOCHECK CONSTRAINT 
   OriginalPrice_Positive;