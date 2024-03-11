/*
Cú pháp của Self join:
SELECT 
    select_list
FROM
    T t1
    [INNER|LEFT] JOIN T t2 
    ON join_predicate

1.Từ bảng Student, hãy cho biết các sinh viên ở cùng thành phố.
2.Từ bảng Stores hãy cho biết các cửa hàng ở cùng quận.
*/

--1
SELECT
    s1.Address,
    s1.LastName + ' ' + s1.FirstName AS FirstStudent,
    s2.LastName + ' ' + s2.FirstName AS SecondStudent
FROM
    Student s1
    INNER JOIN Student s2
    ON s1.Id > s2.id
    AND
    s1.Address = s2.Address
ORDER BY
    s1.Address ASC


--2
SELECT
    s1.District,
    s1.StoreName AS Store1,
    s2.StoreName AS Store2
FROM
    Stores s1
    INNER JOIN Stores s2
    ON s1.StoreId > s2.StoreId
    AND s1.District = s2.District
ORDER BY
    s1.District