/*
Cú pháp:
expression comparison_operator ANY(subquery)

1.Cho biết những môn học có từ 3 sinh viên đăng ký trở lên
2.Hãy cho biết thông tin các nhân viên làm việc tại cửa hàng có địa chỉ tại quận Nam Từ Liêm?
*/
--1
SELECT
    sj.*,
    (
        SELECT
            COUNT(*)
        FROM
            Register
        WHERE
            SubjectId = sj.Id
    ) AS NumberOfRegister
FROM
    Subject sj
WHERE
    Id = ANY(
        SELECT
            s.Id
        FROM
            Subject s,
            Register r
        WHERE 
            s.Id = r.SubjectId
        GROUP BY
            s.Id
        HAVING
            COUNT(r.SubjectId) >= 3
)


--2
SELECT
    *
FROM
    Staffs
WHERE
    StoreId = ANY(
        SELECT 
            StoreId
        FROM
            Stores
        WHERE
            District = N'Nam Từ Liêm'
    )