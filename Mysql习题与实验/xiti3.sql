show databases;
-- 2 
create database example1029;
use example1029;
-- 3 
# drop table grade;
# drop table student;
create table student(course int);
create table grade(course int, grade float, s_num char(14));
-- 4
alter table grade modify course varchar(20);
desc grade;
-- 5
desc grade;
alter table grade modify course varchar(20) after s_num;
-- 6
alter table grade change grade score float;
-- 7
alter table student add s_num char(14); 
alter table grade modify s_num char(14) primary key;
alter table student add constraint k10 foreign key(s_num)
references grade(s_num);
desc student;
desc grade;
alter table student drop foreign key k10;
show create table student;
desc student;
desc grade;
-- 8
alter table grade engine=mysiam;
-- 9 
alter table student drop course;
-- 10
alter table student add phone varchar(20);
-- 11
alter table grade rename gradeinfo;
-- 12
drop table student;