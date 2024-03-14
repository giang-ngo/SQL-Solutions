/*
Cú pháp:
expression comparison_operator ALL(subquery)

1.Hãy cho biết các sinh viên có điểm trung bình GPA >= điểm trung bình của sinh viên ở tất cả các ngành học(CNTT, ĐTVT, QTKD,…).
2.Hãy cho biết danh sách sinh viên có điểm GPA < điểm TB của tất cả các ngành học
*/

-- danh sách điểm trung bình cộng của từng ngành: 
SELECT 
   AVG(s.Gpa) AS AverageGpa 
FROM 
   Student s 
GROUP BY 
   s.Major

--1. danh sách sinh viên có điểm TB lớn hơn hoặc bằng điểm TB tất cả các ngành học: 
SELECT 
   * 
FROM 
   Student
WHERE 
   Gpa >= ALL( 
   SELECT 
      AVG(s.Gpa) 
   FROM 
      Student s 
   GROUP BY s.Major 
   )

--2
SELECT
    *
FROM
    Student
WHERE
    Gpa < ALL(
    SELECT 
        AVG(s.Gpa) AS AverageGpa
    FROM
        Student s
    GROUP BY
        s.Major
    )