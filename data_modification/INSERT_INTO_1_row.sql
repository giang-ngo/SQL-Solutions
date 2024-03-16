/*
Cú pháp:
INSERT INTO 
    [db_name.][schema.]table_name(column_list)
VALUES(value_list)

1.Chèn dữ liệu đơn giản vào bảng Customer.
2.Chèn và trả về giá trị vừa chèn vào bảng. Để lấy giá trị vừa chèn ta sử dụng mệnh đều OUTPUT.
*/

--1
INSERT INTO
    tblCustomers(PK_Customers, Name, Address, PhoneNumber, BirthDate, Email)
VALUES('C100', N'Nguyễn Văn Hưng', N'Hồ Chí Minh', '0978123654', '2000-10-20', 'hungvan@xmail.com')


--2
INSERT INTO
    tblCustomers(PK_Customers, Name, Address, PhoneNumber, BirthDate, Email)
OUTPUT 
    inserted.PK_Customers, inserted.Name, inserted.BirthDate
VALUES
    ('C101', N'Nguyễn Thanh Thủy', N'Hà Nội', '0978123650', '2000-05-14', 'thanhthuy@xmail.com')