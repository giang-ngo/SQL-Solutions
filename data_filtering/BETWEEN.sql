/*
Cú pháp của toán tử: column | expression BETWEEN start AND end.

1.Cho biết thông tin các sinh viên có ngày sinh từ 1/1 đến 30/6.
2.Cho biết thông tin các sinh viên có điểm TB từ 3.2 đến 3.6.
3.Cho biết các môn học có độ dài tên không nằm trong khoảng từ 1-6 kí tự.
4.Cho biết thông tin các môn học sinh viên mã X đăng ký.
*/

--1
SELECT 
   * 
FROM 
   Student 
WHERE 
   MONTH(BirthDate) BETWEEN 1 AND 6

--2
SELECT 
   * 
FROM 
   Student 
WHERE 
   Gpa BETWEEN 3.2 AND 3.6

--3
SELECT 
   * 
FROM 
   Subject 
WHERE 
   LEN(Name) NOT BETWEEN 1 AND 6

