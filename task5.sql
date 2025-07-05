USE Library;
--  SQL DEVELOPER INTERNSHIP
-- Hints/Mini Guide:
-- 1.Create two related tables (e.g., Customers, Orders)
-- 2.Use INNER, LEFT, RIGHT, FULL JOIN


select l.loan_id, b.title, m.fullname, l.loan_date, l.return_date
from loan l
inner join book b on l.book_id = b.book_id
inner join member m on l.member_id = m.member_id;

select b.title, l.loan_date, l.return_date
from book b
left join loan l on b.book_id = l.book_id;


select m.fullname, l.loan_date, l.return_date
from loan l
right join member m on l.member_id = m.member_id;
 
 -- full outer  join
 select b.title, l.loan_date
from book b
left join loan l on b.book_id = l.book_id
union
select b.title, l.loan_date
from loan l
right join book b on b.book_id = l.book_id;
