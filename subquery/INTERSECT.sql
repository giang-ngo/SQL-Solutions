/*
Cú pháp:
query1 INTERSECT query2

1.Hãy cho biết tên các quận khách hàng đang ở mà có cửa hàng công nghệ đang mở cửa:

*/

--1
SELECT
    District
FROM
    Stores
INTERSECT
SELECT
    District
FROM
    Customers