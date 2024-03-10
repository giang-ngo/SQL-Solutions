/*
SELECT 
     columns 
FROM 
     tables 
ORDER BY 
     columns [ASC|DESC] 
OFFSET offset_row {ROW | ROWS} 
FETCH {FIRST | NEXT} fetch_row {ROW | ROWS} ONLY


1.Cho biết mã, tên, điểm của 5 sinh viên đầu tiên có điểm cao nhất.
2.Cho biết mã, tên, điểm của 5 sinh viên từ sinh viên thứ 6 đến thứ 10 có điểm cao tiếp theo.
3.Cho biết mã, tên, điểm của 5 sinh viên cuối có điểm từ thấp đến cao.
*/

--1
SELECT 
     Id, FirstName, Gpa 
FROM 
     Student 
ORDER BY 
     Gpa DESC 
OFFSET 0 ROWS 
FETCH NEXT 5 ROWS ONLY



--2
SELECT 
      Id, FirstName, Gpa 
FROM 
      Student 
ORDER BY 
      Gpa DESC 
OFFSET 5 ROWS 
FETCH NEXT 5 ROWS ONLY

--3
SELECT 
     Id, FirstName, Gpa 
FROM 
     Student 
ORDER BY 
     Gpa ASC 
OFFSET 0 ROWS 
FETCH FIRST 5 ROWS ONLY

