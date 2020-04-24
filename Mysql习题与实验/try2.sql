show databases;
use lll;
show tables;
drop tables intdata1;
create table intdata1(a tinyint zerofill,
b smallint zerofill, c mediumint zerofill,d int zerofill,e bigint unsigned);
desc intdata;
insert into intdata1 values(1,1,1,1,1);
select * from intdata1;
########################################
drop table intdata2;
create table intdata2(a int(4), b int);
desc intdata2;
insert intdata2 values(12345,11111);
## insert intdata2 values(123456789101,11111);超出int(4)的范围可以，但不能超出int的范围
select * from intdata2;
desc intdata2;
######################################
drop table float1;
create table float1(a float(6,2), b double(6,2), c decimal(6,2));
desc float1;
insert into float1 values( 123.123,123.456,123.264);
show warnings;
select * from float1;
#######################################
drop table float2;
create table float2(a float,b double, c decimal);
desc float2;
insert into float2 values( 123.123,123.456,123.264);
select * from float2;
########################################
drop table year;
create table year(a year);
desc year;
insert into year values('2019'),(2019),(19),(70);
select * from year;
insert into year values(0),('0');
#######################################
drop table time;
create table time(a time);
insert into time values('2 23:50:50'),('22:22:22'),('11:11'),('2 20:20'),('2 20'),('30');
insert into time values(current_time());
select * from time;
##########################################
create table datetime(a datetime);
insert into datetime values(NOW());
select * from datetime;
#######################################TIMESTAMP
create table timestamp(a timestamp);
insert into timestamp values(current_timestamp());
select * from timestamp;
######################################
drop table enum1;
create table enum1(a enum('woman','man'));
insert into enum1 values('man');
select * from enum1;
#########################################
## Binary verbinary
drop table binary1;
create table binary1(b binary(4),vb varbinary(4));
insert into binary1 values('d','d');
insert into binary1 values('c','c');
select * from binary1;
select length(b),length(vb) from binary1;
select b,b='d',b='d\0\0\0',vb,vb='d',vb='d\0\0\0' from binary1;
##########################################
#bit二进制
drop table bit1;
create table bit1(b bit(4));
insert into bit1 values(0),(8),(14);
select * from bit1;
select bin(b+0) from bit1;
#########################################
#Blob 特殊的二级制类型
#########################################
# BOOL 类型 True False 等价于Tinyint 长度为1
# 双斜杠 代表 斜杠 



