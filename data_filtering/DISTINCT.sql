/*
SELECT DISTINCT
    column_names
FROM
    table_names

1.Cho biết tên các tỉnh/thành phố mà sinh viên đang cư trú.
2.Cho biết tên các chuyên ngành của các sinh viên trong danh sách.
3.Cho biết các chuyên ngành và đầu điểm mà sinh viên học chuyên ngành đó đang có.
*/

--1
SELECT DISTINCT
    Address 
FROM
    Student

--2
SELECT DISTINCT
    Major
FROM
    Student

--3
SELECT DISTINCT
    Major, Gpa
FROM
    Student