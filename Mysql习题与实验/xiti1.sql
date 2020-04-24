#################习题1
create database 习题1;
use 习题1;
create table table1(a float(7,3),b double(7,2),c decimal(7,6));
select * from table1;
######
create table table2(a year);
insert into table2 value(35),(90),('00');
select * from table2;
######
create table table3(a time);
insert into table3 value('2 20:20:11'),('00:11:11'),(50);
select * from table3;
######
create table table4(a datetime);
insert into table4 value('3000-1-1 20:20:11'),(current_time());
select * from table4;
######
create table table5(name char,gender bool);
insert into table5 value('温','1');
select * from table5;
######
create table table6(
学生姓名 varchar(10) not null,
student_id varchar(14),
籍贯 varchar(20),
性别 bool,
是否为党员 bool);
alter table table6 engine=INNODB;
