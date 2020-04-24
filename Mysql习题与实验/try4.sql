use ll;
create table example111(a int);
show tables;
#################33modify  rename  add
alter table example111 modify a varchar(20);
alter table example111 rename example12;
alter table example12 add b varchar(20);
alter table example12 add c int;
desc example12;
###################### change
alter table example12 change a stu_name varchar(30);
desc example12;
-- alter table example12 drop stu_no;
alter table example12 add stu_no char(14) primary key after stu_name;
desc example12;
alter table example12 add stu_adress char(50) after stu_no;
desc example12;

-- modify 可以修改数据类型 还能修改位置 
alter table example12 modify b varchar(20) first;
desc example12;
-- 修改当前的存储引擎 
show variables like "%engine%";
alter table example12 engine=innodb;
show create table example12;
create table example11(c char(14),stu_id int, constraint kk foreign key(c) references example12(stu_no));
desc example12;
alter table example11 drop foreign key kk;

###########################################################20191105
-- 普通索引
use lll;
show tables;
create table index1(id int,name varchar(20),sex bool,index(id));
desc index1;
show create table index1;
-- 唯一性索引
create table index2(id int unique,name varchar(20),unique index index2_id(id asc));#升序排列
show create table index2;
-- 全文索引 必须是myisam引擎
create table index3(id int, info varchar(20),fulltext index index3_info(info)) engine=MyISAM;#要设置为myisam
show create table index3;
--  单列索引
create table index4(id int,subject varchar(30),index index4_st(subject(10)));
show create table index4;
-- 多列索引 第一个字段(建立索引的第一个字段)必须要被用到
create table index5(id int,name varchar(30),sex char(4),index index5_ns(name,sex)); 
show create table index5;
explain select * from index5 where name='a' and sex='man';
-- 空间索引 (也必须使用MyISAM)
drop table index6;
create table index6(id int,space geometry not null, spatial index index6_sp(space)); 
show create table index6;
-- 已存在的表上创建索引
#### drop table example0;
create table example0(id int,name varchar(20),sex tinyint);
create index index7_id on example0(id);
show create table example0;

########################################
#20191112
use ll;
create table department(d_name int,d_function varchar(20),address varchar(30),sex bool);
# create table department_view1(d_name int,d_function varchar(20),d_address varchar(20));
create view department_view2(name,ffunction,address) as select d_name,d_function,d_address from department;
desc department_view2;
create algorithm=merge view worker_view1(name,department,sex,age,address)
	as select name, department.d_;

-- 查看view有四种方式 
desc department_view2;
show table status like ‘department%’; #控制台终端可以
show create view department_view2;
show databases;
select * from information_schema.views;

-- create or replace view语句修改视图  algorithm = undefined未定义的 merge融合的 temptable临时表
-- as select ... with cascaded local check option 
create or replace algorithm=undefined view department_view1(department,ffunction,location) as select d_name,d_function,address from department;
-- alter 其他都基本一致
-- 更新视图
insert into department values(1001,'sdfsdf','lslslls',1);
update department_view1 set location='hhh' where location = 'lslslls';
desc department_view1;
select * from department_view1;
