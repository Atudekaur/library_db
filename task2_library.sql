USE Library;

-- task  2----insert /update/dlt data
insert into book values(11,"hanne hanne pathshahi",2025,2000);

-- not null 
alter table book modify column published_year int  not null;

-- set default
 alter table book alter category_id set default "0";
 
 -- update
 update  member set email="herry@gmail.com" where fullname="Alice Johnson";
 set sql_safe_updates=0;
 select * from member;

-- delete 
 delete from category where category_name = 'Mystery';
 select * from category;