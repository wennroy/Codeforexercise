#触发器
show databases;
use ll;
CREATE TABLE trigger_time(exec_time TIME);
create table department(id int primary key auto_increment, dname varchar(20));
create trigger dept_trig1 before 
	insert on department for each row 
    insert into trigger_time values(NOW());
create trigger dept_trig2 after
	insert on department for each row 
    insert into trigger_time values(NOW());
insert into department values(NULL,'丘竞昆');
select * from department;
select * from trigger_time;
delimiter $$
create trigger dept_trig3 before 
	insert on department for each row
	begin
    insert into trigger_time values('19:38:38');
    insert into trigger_time values('19:38:41');
    end$$
delimiter ;
## 查询triggers
show triggers;
select * from information_schema.triggers where trigger_name='dept_trig3';
create table trigger_test (id int primary key auto_increment, info varchar(20));
create trigger before_insert before insert on department for each row 
	insert into trigger_test values(null,'before_insert');
create trigger after_insert after insert on department for each row 
	insert into trigger_test values(null,'after_insert');
insert into department values(null,'insert');
select * from trigger_test;

####################20191126查询操作
use ll;
CREATE TABLE employee(num INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
     d_id INT NOT NULL,
     name VARCHAR(20),
     age INT,
     sex VARCHAR(4),
     homeaddr VARCHAR(50)
     );
INSERT INTO employee VALUES(NULL,1001,'张三',26,'男','厦门市思明区'),
     (NULL,1002,'李四',26,'女','厦门市湖里区'),
     (NULL,1003,'王五',25,'男','龙岩市新罗区'),
     (NULL,1004,'Aric',16,'男','America');
SELECT name,sex,homeaddr FROM employee;# 选择只看哪些列
select name,sex,homeaddr from employee where num = 3;
select name,sex,homeaddr from employee where d_id not in (1001,1003);
select num,name,sex,homeaddr from employee where d_id between 1001 and 1003;
#####like 匹配字符串
select * from employee where homeaddr not like '%厦门%'; ##当然也有not like
#####下划线代替一个字符_
select * from employee where homeaddr like '厦门市湖里_';
select * from employee where sex is not null;
select * from employee where age>16 and sex = '男';
select * from employee where age>16 or sex = '女';
#### group by
SELECT distinct age FROM employee GROUP BY sex;
SELECT sex,GROUP_CONCAT(name,d_id) FROM employee GROUP BY sex;
select sex,count(sex) from employee group by sex;
select sex,AVG(age) from employee group by sex;
#### order by
select * from employee where age>15 order by age asc;

#### 
select * from employee limit 1,2; ## 从第二条记录开始的两条记录。
