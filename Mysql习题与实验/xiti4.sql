DROP database job;
create database job charset = gbk;
use job;
####drop table user;
#####drop table information;
create table user(useid int(10) not null unique,
		username varchar(20) not null,
        password varchar(20) not null,
        info text,
        index index_name(username));
show create table user;
desc user;
SELECT * FROM user;
INSERT INTO user value(2019,'smartQiu','123',null);
INSERT INTO user value(2020,'smartQiu2','123',null);
INSERT INTO user value(2021,'smartQiu1','123',null);
create table information(id int(10) unique primary key auto_increment,
			name varchar(20) not null,
            sex varchar(20) not null,
            address varchar(50),
            birthday date,
            tel varchar(20),
            pic blob);
show create table information;
desc information;

create index index_bir on information(birthday,id);
alter table user add unique index index_id(useid);
show create table user;
drop index index_bir on information;
drop index index_name on user;
create table workinfo(id int(10) unique primary key auto_increment,
			name varchar(20) not null,
            type varchar(10),
            address varchar(50),
            wage int,
            conetents tinytext,
            extra text,
            unique index index_id(id desc));