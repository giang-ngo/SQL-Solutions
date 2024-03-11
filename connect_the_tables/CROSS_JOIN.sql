/*
Cú pháp của CROSS JOIN:
SELECT
    columns
FROM
    table1
    CROSS JOIN table2

Lấy kết quả truy vấn CROSS JOIN giữa hai bảng Products và Providers:
*/

SELECT
    p.*,
    q.*
FROM
    product.Products p
    CROSS JOIN product.Providers q