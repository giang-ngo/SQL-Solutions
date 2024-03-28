/*
Cú pháp của lệnh:
WHILE condition
BEGIN
    -- statements
    IF some_condition
        CONTINUE
    -- statements for skipping if some_condition is meet
END

*/

--Liệt kê các số không chia hết cho 3 trong đoạn từ 1 đến 10.
DECLARE @number INT = 0
DECLARE @stopNumber INT = 10
WHILE @number < @stopNumber
BEGIN
    SET @number += 1
    IF @number % 3 = 0
        CONTINUE
    ELSE
        PRINT @number
END
/* kết quả:
1
2
4
5
7
8
10
*/