/*
Cú pháp sử dụng toán tử LIKE: column | expression LIKE pattern [ESCAPE escape_character]

1.Cho biết thông tin các sinh viên có tên bắt đầu bằng chữ ‘h’.
2.Cho biết thông tin các sinh viên bắt đầu bằng chữ ‘h’, chữ ‘a’ hoặc chữ ‘t’.
3.Cho biết mã, họ và tên, điểm TB các sinh viên ở địa chỉ bắt đầu bằng chữ ‘Đ’ hoặc chữ ‘H’.
4.Cho biết mã, tên, điểm TB các sinh viên trong tên có chữ cái thứ 2 là ‘o’.
5.Cho biết mã, tên, điểm TB các sinh viên có tên kết thúc bằng chữ ‘g’.
6.Cho biết mã, tên, điểm TB các sinh viên trong tên không có chữ ‘n’.
*/

--1
SELECT 
   * 
FROM 
   Student 
WHERE 
   FirstName LIKE 'H%';

--2
SELECT 
   * 
FROM 
   Student 
WHERE 
   FirstName LIKE 'H%' 
   OR FirstName LIKE 'T%' 
   OR FirstName LIKE 'A%';

--3
SELECT 
   st.Id, st.LastName, 
   st.MidName, 
   st.FirstName, 
   st.Address, 
   st.Gpa FROM Student AS st 
WHERE 
   Address LIKE N'Đ%' 
   OR 
   Address LIKE N'H%'


--4
SELECT 
   st.Id, 
   st.FirstName, 
   st.Gpa 
FROM 
   Student AS st 
WHERE 
   st.FirstName LIKE N'_o%'


--5
SELECT 
   st.Id, 
   st.FirstName, 
   st.Gpa 
FROM 
   Student AS st 
WHERE 
   st.FirstName LIKE N'%g'


--6
SELECT 
   st.Id, 
   st.FirstName, 
   st.Gpa 
FROM 
   Student AS st 
WHERE 
   st.FirstName NOT LIKE N'%n%'

