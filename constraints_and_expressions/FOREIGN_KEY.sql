--Xét các bảng: Providers, Products, ProductProviders:
-- CREATE SCHEMA product --Tạo lược đồ
CREATE TABLE MyDatabase.product.Providers(
    PK_Providers VARCHAR(20) PRIMARY KEY,
    Name NVARCHAR(200),
    Address NVARCHAR(200),
    PhoneNumber VARCHAR(20),
    TaxCode VARCHAR(50)
)

CREATE TABLE MyDatabase.product.Products(
    PK_Products INT PRIMARY KEY,
    Name NVARCHAR(200),
    Quantity INT NOT NULL DEFAULT 0,
    Price FLOAT DEFAULT 0
)

CREATE TABLE MyDatabase.product.ProductProviders(
    PK_ProductProvides INT PRIMARY KEY IDENTITY(100, 1),
    FK_Products INT NULL,
    FK_Providers VARCHAR(20) NULL,
    ProvideAt DATETIME DEFAULT GETDATE()
)

-- xóa bỏ bảng cũ
DROP TABLE IF EXISTS MyDatabase.product.ProductProviders;
-- tạo lại bảng mới
CREATE TABLE MyDatabase.product.ProductProviders(
    PK_ProductProvides INT PRIMARY KEY IDENTITY(100, 1),
    FK_Products INT NULL,
    FK_Providers VARCHAR(20) NULL,
    ProvideAt DATETIME DEFAULT GETDATE(),
    CONSTRAINT 
        FK_products FOREIGN KEY(FK_Products)
    REFERENCES 
        MyDatabase.product.Products(PK_Products)
    ON DELETE CASCADE 
    ON UPDATE CASCADE,
    CONSTRAINT 
        FK_providers FOREIGN KEY(FK_Providers)
    REFERENCES 
        MyDatabase.product.Providers(PK_Providers)
    ON DELETE CASCADE 
    ON UPDATE CASCADE,
)

--Chèn dữ liệu vào các bảng. Để đảm bảo chèn thành công, ta chèn dữ liệu vào bảng cha trước, sau đó đến bảng con:
INSERT INTO 
    MyDatabase.product.Products(PK_Products, Name, Price, Quantity)
VALUES
    (1000, N'iPhone 15 Pro Max', 37500000, 120),
    (1001, N'iPhone 15 Pro', 32500000, 100),
    (1002, N'iPhone 15', 28500000, 150),
    (1003, N'Samsung Galaxy S24', 35000000, 150);

INSERT INTO 
    MyDatabase.product.Providers(PK_Providers, Name, Address, PhoneNumber, TaxCode)
VALUES
    ('AP100', N'Apple Inc', 'Cupertino California USA', '+14089961010', '0313510827'),
    ('SAM100', 'Samsung ELECTRONICS', '416, Maetan 3-Dong, Yeongtong-Gu, Suwon, Gyeonggi-Do, South Korea', 
    '1800 588 889', '2300325764'),
    ('OPP100', 'Oppo', '448A Nguyễn Tất Thành, Phường 18, Quận 4, Thành phố Hồ Chí Minh', '1800577776', '0312059023');
-- chèn dữ liệu vào bảng cung ứng
INSERT INTO
    MyDatabase.product.ProductProviders(FK_Products, FK_Providers)
VALUES
    (1000, 'AP100'),
    (1001, 'AP100'),
    (1002, 'Ap100'),
    (1003, 'SAM100')

--Nếu chèn dữ liệu không tồn tại trong bảng cha vào bảng con -> lỗi:
INSERT INTO
    MyDatabase.product.ProductProviders(FK_Products, FK_Providers)
VALUES(1000, 'AP101');
-- thông báo lỗi hiện lên:
--The INSERT statement conflicted with the FOREIGN KEY constraint "FK_providers". The conflict occurred in database "MyDatabase", table "product.Providers", column 'PK_Providers'.


--Cập nhật dữ liệu trong bảng cha
UPDATE 
    MyDatabase.product.Providers
SET 
    PK_Providers = 'SAM101',    
    Name = 'SAMSUNG ELECTRONICS VIETNAM COMPANY LIMITED',
    Address = N'Khu công nghiệp Yên Phong I, Xã Yên Trung, Huyện Yên Phong, Tỉnh Bắc Ninh, Việt Nam'
WHERE 
    PK_Providers = 'SAM100'
-- kết quả: dữ liệu về mã nhà cung cấp tự động cập nhật vào cột khóa ngoại của bảng cung ứng:


--Xóa dữ liệu trong bảng cha:
DELETE 
   MyDatabase.product.Products 
WHERE 
   PK_Products = 1000 
-- Kết quả: dòng dữ liệu có mã sản phẩm tương ứng với sản phẩm 1000 đã bị xóa