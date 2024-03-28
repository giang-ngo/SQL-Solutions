/*
Cú pháp của lệnh BREAK:
WHILE conditon
BEGIN
    -- statements
    IF some_conditions
        BREAK
END

**Ví dụ ta có hai vòng lặp lồng nhau:
WHILE condition1
BEGIN 
    -- statements
    WHILE condition2
    BEGIN
        -- statements
        IF break_condition
            BREAK
    END
END
*/

--Hiển thị ra màn hình k số nguyên tố đầu tiên thỏa mãn >= number nào đó cho trước. Giả sử number = 25
BEGIN
    DECLARE @number INT = 25
    DECLARE @iterator INT = @number
    DECLARE @k INT = 12
    DECLARE @counter INT = 0
    WHILE @iterator > 0
    BEGIN
        DECLARE @isPrime BIT = 1
        DECLARE @squareRoot INT = SQRT(@iterator)
        DECLARE @i INT = 2
        IF @iterator < 2
            SET @isPrime = 0
        ELSE
            WHILE @i <= @squareRoot
            BEGIN
               IF @iterator % @i = 0
               BEGIN
                   SET @isPrime = 0
                   BREAK;
               END
               SET @i += 1
           END
    IF @isPrime = 1
    BEGIN
        PRINT @iterator
        SET @counter += 1
    END
    IF @counter = @k
        BREAK;
    SET @iterator += 1
    END
END
/* kết quả:
29
31
37
41
43
47
53
59
61
67
71
73
*/