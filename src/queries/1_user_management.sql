.open fittrackpro.db
.mode column

-- 1.1
select member_id, first_name, last_name, email, join_date from members;

-- 1.2
update members
 set phone_number = '07000 100005', 
     email = 'emily.jones.updated@email.com' 
where member_id = 5;


-- 1.3


-- 1.4


-- 1.5


-- 1.6

