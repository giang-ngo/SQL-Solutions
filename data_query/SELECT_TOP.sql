/*
SELECT TOP(expression) [PERCENT] 
         [WITH TIES] 
FROM 
         tables 
ORDER BY 
         columns


1.Cho biết top 3 sinh viên có điểm TB cao nhất.
2.Cho biết top sinh viên nằm trong số 3 giá trị điểm trung bình cao nhất
3.Cho biết top 5% sinh viên có điểm TB thấp nhất.
4.Cho biết top 20% sinh viên có điểm TB cao nhất.
5.Cho biết mã, tên, điểm của top 30% sinh viên có điểm cao nhất, không bỏ sót các sinh viên nào thỏa mãn.
*/

--1
SELECT TOP 3 
     * 
FROM 
     Student 
ORDER BY 
     Gpa DESC



--2
SELECT TOP 3 WITH TIES 
     *
FROM 
     Student 
ORDER BY 
     Gpa DESC

--3
SELECT TOP 20 PERCENT 
     * 
FROM 
     Student 
ORDER BY 
     Gpa ASC

--4
SELECT TOP 20 PERCENT WITH TIES 
     * 
FROM 
     Student 
ORDER BY 
     Gpa DESC

--5
SELECT TOP 30 PERCENT WITH TIES 
     Id, FirstName, Gpa 
FROM 
     Student 
ORDER BY 
     Gpa DESC
