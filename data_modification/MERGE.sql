/*
Sau đây là cú pháp của lệnh MERGE:
MERGE target_table USING source_table
ON merge_condition
WHEN MATCHED
    THEN update_statement
WHEN NOT MATCHED
    THEN insert_statement
WHEN NOT MATCHED BY SOURCE
    THEN DELETE

1.Cập nhật bảng SaleProducts theo dữ liệu trong bảng Products.
*/

--1

-- tạo bảng Products
CREATE TABLE sales.Products(
    PK_Products INT PRIMARY KEY,
    Name NVARCHAR(200),
    Price INT DEFAULT 0,
    SalePrice INT DEFAULT 0,
    Quantity INT DEFAULT 0
);
-- tạo bảng SaleProducts
CREATE TABLE sales.SaleProducts(
    PK_Products INT PRIMARY KEY,
    Name NVARCHAR(200),
    Price INT DEFAULT 0,
    SalePrice INT DEFAULT 0,
    Quantity INT DEFAULT 0
);

-- chèn dữ liệu vào bảng Products
INSERT INTO 
    sales.Products(PK_Products, Name, Price, SalePrice, Quantity)
VALUES
    (100, 'iPhone 12 Pro Max', 35000000, 34000000, 100),
    (102, 'iPhone 12 Pro', 34000000, 33000000, 110),
    (104, 'iPhone 12', 30000000, 29000000, 120),
    (106, 'iPhone 13 Pro Max', 36000000, 35000000, 130),
    (108, 'iPhone 13 Pro', 32000000, 30000000, 150),
    (110, 'iPhone 13', 30000000, 28000000, 170),
    (112, 'iPhone 14 Pro Max', 37000000, 36000000, 190),
    (114, 'iPhone 14 Pro', 34000000, 33000000, 200);

-- chèn dữ liệu vào bảng SaleProducts
INSERT INTO 
    sales.SaleProducts(PK_Products, Name, Price, SalePrice, Quantity)
VALUES
    (100, 'iPhone 12 Pro Max', 35000000, 30000000, 150),
    (102, 'iPhone 12 Pro', 33000000, 30000000, 170),
    (104, 'iPhone 12', 30000000, 27000000, 120),
    (106, 'iPhone 13 Pro Max', 34000000, 32000000, 150),
    (108, 'iPhone 13 Pro', 32000000, 31000000, 110)