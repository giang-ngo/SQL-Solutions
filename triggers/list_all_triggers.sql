--Để liệt kê tất cả trigger có trong SQL Server của bạn, làm như sau:
SELECT 
    name,
    is_instead_of_trigger
FROM 
    sys.triggers 
WHERE 
    type = 'TR';