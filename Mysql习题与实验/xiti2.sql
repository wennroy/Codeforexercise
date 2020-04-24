create database xiti1 charset=GBK;
use xiti1;
######example0
create table example0(
		id int,
        name varchar(20),
        sex tinyint(1));
desc example0;

############example1
create table example1(
		stu_id int not null primary key,
        stu_name varchar(20),
        stu_sex tinyint(1));
desc example1;

############example2
create table example2(
		stu_id int default 0,
        course_id int default 0,
        grade float,
        primary key(stu_id,course_id));
desc example2;

#############example3
create table example3(
		id int not null primary key,
        stu_id int,
        course_id int,
        constraint d_fk foreign key(stu_id,course_id) references example2(stu_id,course_id)
        );
desc example3;

#############example4
create table example4(
		id int not null primary key,
        name varchar(20) not null,
        stu_id int,
        constraint e_fk foreign key(stu_id) references example1(stu_id));
desc example4;

#############example5
create table example5(
		id int not null primary key,
        stu_id int unique,
        name varchar(20) not null);
desc example5;

#############example6
create table example6(
		id int not null primary key auto_increment,
        stu_id int unique,
        name varchar(20)
        );
desc example6;

############example7
create table example7(
		id int not null primary key auto_increment,
        stu_id int unique,
        name varchar(20) not null,
        Engelish varchar(20) default 'zero',
        Math float default 0,
        Computer float default 0);
desc example7;
#drop database xiti1;