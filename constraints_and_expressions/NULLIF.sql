/*
Cú pháp:
NULLIF(expression1, expression2)

1.Lấy tất cả các dòng dữ liệu có chứa NULL hoặc rỗng ở cột số điện thoại trong bảng Staffs
*/

--Kiểm tra hai giá trị có tương đương không bằng biểu thức NULLIF:
SELECT
    NULLIF(100, 100) Result
-- kết quả: NULL
SELECT
    NULLIF('Thuy', 'thuy') Result
-- kết quả: NULL
SELECT
NULLIF(N'ừm', 'x') Result
-- kết quả: ừm

--1
SELECT
    *
FROM
    Staffs
WHERE
    NULLIF(PhoneNumber, '') IS NULL