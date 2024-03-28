/*
**Bước đầu tiên trong vòng đời của con trỏ là khai báo con trỏ. Cú pháp:
DECLARE cursor_name CURSOR
    FOR select_statement

**Sau đó đến bước mở con trỏ:
OPEN cursor_name

**Tiếp theo, nạp một dòng từ con trỏ vào một hoặc nhiều biến:
FETCH NEXT FROM cursor INTO variable_list

**Ta có thể sử dụng lệnh lặp WHILE để nạp tất cả các dòng từ con trỏ.
WHILE @@FETCH_STATUS = 0
BEGIN
    FETCH NEXT FROM cursor_name
END

**Sau đó đóng con trỏ và giải phóng con trỏ:
CLOSE cursor_name
DEALLOCATE cursor_name
*/

--Ví dụ: Hiển thị danh sách mã sinh viên và điểm GPA tương ứng:
-- khai báo biến lưu mã sinh viên và điểm gpa
DECLARE @studentId VARCHAR(20);
DECLARE @gpa FLOAT(2) = 0;

-- khai báo con trỏ
DECLARE cursorStudent CURSOR
FOR
    SELECT
        StudentId,
        Gpa
    FROM
        Students;

-- mở con trỏ
OPEN cursorStudent;

-- nạp dữ liệu vào biến
FETCH NEXT FROM cursorStudent INTO
    @studentId,
    @gpa;

-- lấy tất cả dữ liệu các dòng có được từ con trỏ
WHILE @@FETCH_STATUS = 0
    BEGIN
        IF @gpa >= 3.5 -- nếu điểm gpa >= 3.5 thì in ra
            PRINT @studentId + ' - ' + STR(@gpa, 4, 2);
        FETCH NEXT FROM cursorStudent INTO
            @studentId,
            @gpa;
    END

-- đóng con trỏ và giải phóng nó
CLOSE cursorStudent;
DEALLOCATE cursorStudent;
/* kết quả:
B25DCCN104 - 3.67
B25DCCN106 - 3.67
B25DCCN107 - 3.67
B25DCCN108 - 3.96
B25DCCN120 - 3.64
B25DCCN122 - 3.67
B25DCCN123 - 3.62
B25DCCN224 - 3.56
B25DCDT115 - 3.64
B25DCHT100 - 3.68
B25DCQT109 - 3.64
B25DCQT150 - 3.71
*/
