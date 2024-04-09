/*
Cú pháp của lệnh vô hiệu hóa trigger:
DISABLE TRIGGER [schema_name.][trigger_name]
ON [object_name | DATABASE | ALL SERVER]
*/

-- ta sẽ tạo một trigger gắn vào bảng Subjects:
CREATE TRIGGER TR_Subject_Inserts
ON Subjects
AFTER INSERT
AS
BEGIN
    PRINT N'Một dòng mới đã được thêm vào bảng Subjects';
END;

--Sau đó ta chèn dữ liệu vào bảng:
INSERT INTO Subjects(SubjectId, Name, Credit, NumOfLesson, Type)
VALUES('SUBJ1201', N'Android nâng cao', 3, 36, N'Chuyên ngành');
-- kết quả hiển thị:
--Một dòng mới đã được thêm vào bảng Subjects

--Vô hiệu hóa trigger trên:
DISABLE TRIGGER TR_Subject_Inserts 
ON Subjects;

--Sau đó thêm một môn học khác vào:
INSERT INTO Subjects(SubjectId, Name, Credit, NumOfLesson, Type)
VALUES('SUBJ1202', N'.NET nâng cao', 4, 48, N'Chuyên ngành');
-- kết quả: 1 dòng mới đc chèn vào bảng Subjects nhưng không còn hiển thị thông báo như lần insert trước.

--Để vô hiệu hóa toàn bộ trigger trên một bảng nào đó ta sử dụng lệnh:
DISABLE TRIGGER ALL ON table_name;

--Ví dụ ta tạo thêm một trigger khác liên kết với bảng Subjects:
CREATE TRIGGER TR_Subject_Updates
ON Subjects
AFTER INSERT
AS
BEGIN
    PRINT N'Một dòng trong bảng Subjects đã được cập nhật!';
END;

--Vô hiệu hóa toàn bộ trigger liên kết với bảng Subjects:
DISABLE TRIGGER ALL ON Subjects;

--Để vô hiệu hóa toàn bộ trigger trong CSDL ta sử dụng lệnh:
DISALBE TRIGGER ALL ON DATABASE;