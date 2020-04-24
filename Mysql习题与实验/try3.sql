############ 操作数据库 数据库的添加与删除
create database examples;
show databases;
use examples;
drop database examples;
show databases;
############ 操作表 表的添加与删除
create database examples;
##表的存储引擎不同。 表的类型。
show engines;
## InnoDB MyISAM Memory 三种较为常用
show variables;
show variables like 'have%';
show variables like '%engine%';

###############2019/10/22
#######完整性约束条件 
###主键、多主键、外键、非空约束、唯一性约束：
use lll;
create table example1 (stu_id INT primary key,
stu_name varchar(20), stu_sex boolean);
select * from example1;
desc example1;
create table example2 (stu_id int,
course_id int, grade float, primary key(stu_id,course_id));
desc example2;

create table example3 (id int primary key, stu_id int,
course_id int, constraint c_fk foreign key(stu_id, course_id) references example2(stu_id, course_id));
desc example3;

create table example4(id int not null primary key,
					name varchar(20) not null,
                    stu_id int,
                    constraint d_fk foreign key(stu_id) references example2(stu_id));
desc example4;

create table example5(id int primary key,
					stu_id int unique,
                    name varchar(20) not null);
desc example5;

create table example6(
	id int primary key auto_increment,
    stu_id int unique,
	name varchar(20) not null);
desc example6;

create table example7(
	id int primary key auto_increment,
    stu_id int unique,
	name varchar(20) not null,
    English varchar(20) default 'zeros',
    Math float default 0,
    Computer float default 0);
desc example7;
show create table example7;

