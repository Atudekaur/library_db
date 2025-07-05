use Library;

-- 1.Use CREATE PROCEDURE and CREATE FUNCTION
-- 2.Use parameters and conditional logic

-- procedure – add new member

delimiter //

create procedure add_member(
  in p_name varchar(100),
  in p_email varchar(100),
  in p_date date
)
begin
  insert into member (fullname, email, membership_date)
  values (p_name, p_email, p_date);
end;
//

delimiter ;

call add_member("radha","radha@123.gmail.com","2025-07-06");


-- function – count loans per member
delimiter //

create function count_loans(p_member_id int)
returns int
deterministic
begin
  declare total int;
SELECT 
    COUNT(*)
INTO total FROM
    loan
WHERE
    member_id = p_member_id;
  return total;
end;
//

delimiter ;
select fullname, member_id,count_loans(member_id) as total_loans
from member;
call count_loans(5);

delimiter //

create procedure return_book(
    in p_book_id int,
    in p_member_id int,
    in p_return_date date
)
begin
    update loan
    set return_date = p_return_date
    where book_id = p_book_id
    and member_id = p_member_id;
    select  * from loan;
end;
//

delimiter ;

call return_book(2, 2, '2025-07-05');
select  * from loan;

-- Procedure with conditional logic – check if a member exists before inserting

delimiter //

create procedure safe_add_member(
    in p_fullname varchar(100),
    in p_email varchar(100),
    in p_date date
)
begin
    if not exists (select 1 from member where email = p_email) then
        insert into member (fullname, email, membership_date)
        values (p_fullname, p_email, p_date);
    else
        select 'member already exists' as message;
    end if;
end;
//

delimiter ;
call safe_add_member('carol davis', 'carol.davis@example.com', '2025-07-01');
select * from member;

 -- Function – get member name from id
 delimiter //

create function get_member_name(p_member_id int)
returns varchar(100)
deterministic
begin
    declare name varchar(100);
    select fullname into name
    from member
    where member_id = p_member_id;
    return name;
end;
//

delimiter ;

select get_member_name(2);
