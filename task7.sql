USE Library;


-- 1.Use CREATE VIEW with complex SELECT
-- 2.Use views for abstraction and security

 -- create view (complex select)
 CREATE VIEW book_loans_view AS
    SELECT 
        l.loan_id, b.title, m.fullname, l.loan_date, l.return_date
    FROM
        loan l
            JOIN
        book b ON l.book_id = b.book_id
            JOIN
        member m ON l.member_id = m.member_id;

-- use views for abstraction and security
-- restrict access to raw loan table, allow only view:
select * from book_loans_view;


 