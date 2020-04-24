create database test;
use test;
create table work_info(id int primary key,
		name varchar(20) not null,
        sex varchar(4) not null,
        age int(5),
        address varchar(50),
        tel varchar(20));
desc work_info;
insert into work_info values(2600,'丘竞昆','M',20,'asdfasdf','');
insert into work_info values(2799,'谢以轩','M',20,'dfdfdf','');
insert into work_info values(2701,'赵哲','M',20,'dfddfdffdf','');
select * from work_info;
create view info_view(id,name,address) 
as
select id,name,address from work_info;
show create view info_view;
select * from info_view;
create or replace algorithm=undefined view info_view(name,address,age) 
as
select name,address,age from work_info;
select * from info_view;
select * from work_info;
update work_info set age=22 where name = '丘竞昆';
update info_view set age=18 where name = '丘竞昆';
drop view info_view;

############
drop table college;
create table college(student_num int(15)
		,student_name varchar(20),sex char(4),
        student_age int,department varchar(50));
insert into college values(2600,'丘竞昆','M',20,'asdfasdf');
insert into college values(2799,'谢以轩','M',20,'dfdfdf');
insert into college values(2701,'赵哲','M',20,'dfddfdffdf');
# drop view college_view;
create view college_view(num,name,department) 
as
select student_num,student_name,department from college 
with local check option;
show create view college_view;

