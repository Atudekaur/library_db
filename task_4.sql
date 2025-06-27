-- 1.Apply aggregate functions on numeric columns
-- 2.Use GROUP BY to categorize
-- 3.Filter groups using HAVING

 select sum(author_id) from author;
 
 select count(book_id) from book group by category_id ;
 select * from member group by member_id having member_id between 3 and 4;
 select * from member ;