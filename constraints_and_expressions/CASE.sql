/*
Biểu thức CASE đơn giản:
CASE input
    WHEN e1 THEN r1
    WHEN e2 THEN r2
    WHEN e3 THEN r3
    ...
    WHEN en THEN rn
    [ELSE rx]
END

1.Hãy cho biết số lượng bản ghi ở từng trạng thái đăng ký của các sinh viên trong bảng đăng ký môn học?
2.Chuyển trạng thái đăng ký từ tiếng Việt sang tiếng Anh
3.Sử dụng biểu thức CASE trong hàm tổng hợp để đếm số lượng các bản đăng ký theo từng trạng thái
4.Phân loại học lực cho các sinh viên trong bảng Student
*/
--1
SELECT
    RegisterStatus,
    COUNT(StudentId) AS RegisterCount
FROM
    Registers
GROUP BY
    RegisterStatus


--2
SELECT
    CASE RegisterStatus
        WHEN N'Đã hủy' THEN 'Canceled'
        WHEN N'Thành công' THEN 'Success'
        WHEN N'Lỗi đăng ký' THEN 'Error'
    END AS RegisterStatus,
    COUNT(StudentId) AS RegisterCount
FROM
    Registers
GROUP BY
    RegisterStatus

--3
SELECT
    SUM(CASE RegisterStatus
            WHEN N'Đã hủy' THEN 1 ELSE 0
    END) AS Canceled,
    SUM(CASE RegisterStatus
            WHEN N'Thành công' THEN 1 ELSE 0
    END) AS Success,
    SUM(CASE RegisterStatus
            WHEN N'Lỗi đăng ký' THEN 1 ELSE 0
    END) AS Error,
    COUNT(*) AS Total
FROM
    Registers

--4
SELECT
    s.*,
    CASE 
        WHEN s.Gpa >= 3.6 AND s.Gpa <= 4.0 THEN N'Xuất Sắc'
        WHEN s.Gpa >= 3.2 THEN N'Giỏi'
        WHEN s.Gpa >= 2.8 THEN N'Khá'
        WHEN s.Gpa >= 2.5 THEN N'Trung Bình'
        WHEN s.Gpa >= 2.0 THEN N'TB Yếu'
        WHEN s.Gpa >= 0 THEN N'Yếu'
        ELSE N'Điểm Không Hợp Lệ'
        END AS Capacity
FROM
    Students s
ORDER BY
    s.Gpa DESC