/*
Cú pháp đầy đủ:
-- start a transaction 
BEGIN TRANSACTION; 
-- other statements need to be done
-- commit the transaction 
COMMIT

1.Thêm mới môn học vào bảng môn học sau đó sửa số tín chỉ và số tiết học thành 4 và 48. Chú ý mã môn học không được trùng nhau.
2.Thêm mới bản đăng ký của sinh viên vào bảng Register
*/
BEGIN TRAN;
-- thêm bản ghi mới còn thiếu thông tin
INSERT INTO Subjects(
    SubjectId, 
    Name, 
    Type
) 
VALUES
    ('SUBJ1205', N'Gải tích 1', N'Cơ bản');
-- lệnh update
UPDATE 
    Subjects
SET
    Credit = 4,
    NumOfLesson = 48
WHERE 
    SubjectId = 'SUBJ1205'
-- xác nhận thay đổi
COMMIT


--2
BEGIN TRAN
-- thêm bản ghi mới còn thiếu thông tin
INSERT INTO Subjects(
    SubjectId, 
    Name, 
    Type
) 
VALUES
    ('SUBJ1206', N'Gải tích 2', N'Cơ bản');
-- lệnh update
UPDATE 
    Subjects
SET
    Credit = 3,
    NumOfLesson = 36
WHERE 
    SubjectId = 'SUBJ1206';
-- thêm mới đăng ký
INSERT INTO Registers(
    StudentId, 
    SubjectId, 
    RegisterStatus
)
VALUES
    ('B25DCDT108', 'SUBJ1205', N'Thành công'),
    ('B25DCDT108', 'SUBJ1206', N'Thành công');
-- xác nhận thay đổi
COMMIT