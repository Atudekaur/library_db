select * from author;
select * from member;

select author_name from author where author_id>2;

select fullname  from member  where member_id=2 or member_id=3 ;

select *from loan order by book_id desc;
select *from category order by category_name asc;

select *from book  where published_year between 1950 and 2015 ;

select fullname  from member  where fullname like "%a";