/*
Cú pháp:
INSERT INTO 
    [db_name.][schema.]table_name(column_list)
VALUES
    (value_list1),
    (value_list2),
    (value_list3)

1.Chèn nhiều dòng và không trả về dữ liệu vừa chèn
2.Chèn nhiều dòng và trả về dữ liệu sau khi chèn
*/

--1
INSERT INTO
    tblCustomers(PK_Customers, Name, Address, PhoneNumber, BirthDate, Email)
VALUES
    ('C102', N'Trần Quốc Doanh', N'Hà Nội', '0978123660', '2000-05-16', 'doanhquoc@xmail.com'),
    ('C103', N'Ngô Văn Chính', N'Hà Nội', '0978123661', '2000-11-19', 'chinhngo@xmail.com'),
    ('C104', N'Lê Văn Nam', N'Hà Nội', '0978123662', '2000-02-17', 'namle@xmail.com')

--2
INSERT INTO
    tblCustomers(PK_Customers, Name, Address, PhoneNumber, BirthDate, Email)
OUTPUT 
    inserted.PK_Customers, inserted.Name, inserted.BirthDate, inserted.Email
VALUES
    ('C105', N'Hoàng Thanh Mai', N'Hà Nội', '0978123664', '2001-05-18', 'thanhmai@xmail.com'),
    ('C107', N'Lương Trần Đạt', N'Hà Nội', '0978123665', '2001-11-13', 'trandat@xmail.com'),
    ('C109', N'Vũ Đức Mạnh', N'Hà Nội', '0978123666', '2000-03-15', 'manhducvu@xmail.com')