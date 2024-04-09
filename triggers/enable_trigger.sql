/*
Cú pháp kích hoạt trigger:
ENABLE TRIGGER [schema_name.][trigger_name]
ON [object_name | DATABASE | ALL SERVER]
*/
--Ví dụ 1: kích hoạt 1 trigger: ta sẽ kích hoạt trigger đã vô hiệu hóa trong bài học trước.
ENABLE TRIGGER TR_Subject_Inserts
ON Subjects;
-- Sau khi chạy lệnh sql trên ta thử chèn bản ghi mới vào bảng:
INSERT INTO Subjects(SubjectId, Name, Credit, NumOfLesson, Type) 
VALUES('SUBJ1203', N'Xác xuất thống kê', 3, 36, N'Cơ sở ngành');
-- hiển thị thông báo:
--Một dòng mới đã được thêm vào bảng Subjects

--Ví dụ 2: kích hoạt tất cả các trigger liên quan đến 1 bảng:
ENABLE TRIGGER ALL ON Subjects;
-- kết quả sau khi kích hoạt:

--Ví dụ 3: kích hoạt tất cả trigger liên quan đến database hiện tại:
ENABLE TRIGGER ALL ON DATABASE; 
-- sau đó tất cả các trigger có trong CSDL hiện tại sẽ được kích hoạt về trạng thái đang hoạt động 
-- và phản ứng lại các sự kiện tương ứng nếu xảy ra.

