/*
Cú pháp:
COALESCE(e1, [e2, ..., en])

1.Sử dụng COALESCE để tính hoa hồng cho các nhân viên: nếu TargetId của nhân viên đó là NULL thì thay nó bằng 1.
2.Tính tổng lương cho các nhân viên trong bảng Salaries. Nếu nhân viên mới thì mặc định là mục tiêu hoa hồng 10%.

*/
--Sử dụng COALESCE để trả về giá trị đầu tiên khác NULL trong chuỗi các kí tự:
SELECT
    COALESCE(NULL, NULL, 'Thùy','Giang', NULL) AS FirstNoneNull
-- kết quả: Thùy

--Sử dụng COALESCE để trả về giá trị đầu tiên khác NULL trong chuỗi giá trị số:
SELECT
    COALESCE(NULL, NULL, 1, 2, NULL) AS FirstNoneNull
-- kết quả: 1

--Sử dụng COALESCE để thay thế giá trị NULL thành giá trị khác:
SELECT 
    StaffId,
    TargetId,
    BaseAmount,
    BaseSalary 
FROM
    Salaries

SELECT
    StaffId,
    COALESCE(TargetId, 1) AS TargetId,
    BaseAmount,
    BaseSalary
FROM
    Salaries

--1
SELECT
    s.StaffId,
    s.TargetId,
    s.BaseAmount,
    s.BaseSalary,
    s.BaseAmount * t.Percentage
FROM
    Salaries s,
    Targets t
WHERE
    t.TargetId = COALESCE(s.TargetId, 1)

--2
SELECT
    s.StaffId,
    COALESCE(s.TargetId, 1) TargetId,
    s.BaseAmount,
    s.BaseSalary,
    s.BaseAmount * t.Percentage Commission,
    Commission + s.BaseSalary TotalSalary
FROM
    Salaries s,
    Targets t
WHERE
    t.TargetId = COALESCE(s.TargetId, 1)