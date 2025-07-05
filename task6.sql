USE Library;


-- 1.Use scalar and correlated subqueries
-- 2.Use subqueries inside IN, EXISTS, =

-- scalar subquery – title of most recently loaned book
select (
  select title
  from book
  where book_id = (
    select book_id
    from loan
    order by loan_date desc
    limit 1
  )
) as latest_loaned_book;

--  correlated subquery – members with more than 1 loan
select fullname
from member m
where (
  select count(*)
  from loan l
  where l.member_id = m.member_id
) > 1;


-- in – books currently on loan
select title
from book
where book_id in (
  select book_id
  from loan
  where return_date is null
);

-- exists – authors of books that were loaned
select a.author_name
from author a
where exists (
  select 1
  from book_author ba
  join loan l on ba.book_id = l.book_id
  where ba.author_id = a.author_id
);

-- = – book title borrowed by 'bob smith'
select title
from book
where book_id = (
  select book_id
  from loan
  where member_id = (
    select member_id
    from member
    where fullname = 'bob smith'
  )
  limit 1
);


