/*
1.Đặt tên cho cột kết quả truy vấn.
2.Đặt bí danh cho bảng khi truy vấn.
*/

--1
SELECT 
   (FirstName + ' ' + LastName + ' ' + MidName) AS FullName 
FROM 
   Student

--2
SELECT DISTINCT 
    st.Id, st.FirstName, st.Gpa 
FROM 
    Student AS st, Register AS rg 
WHERE 
    st.Id = rg.StudentId

