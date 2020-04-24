create database example1126 charset=gbk;
use example1126;
create table student(id int primary key,
			name varchar(20) not null,
            sex varchar(4),
            birth year,
            department varchar(20) not null,
            address varchar(50));
create table score(id int primary key auto_increment,
		stu_id int not null,
        c_name varchar(20),
        grade int);
insert into student values( 901,'张老大', '男',1985,'计算机系', '北京市海淀区'),
						( 902,'张老二', '男',1986,'中文系', '北京市昌平区'),
						( 903,'张三', '女',1990,'中文系', '湖南省永州市'),
						( 904,'李四', '男',1990,'英语系', '辽宁省阜新市'),
						( 905,'王五', '女',1991,'英语系', '福建省厦门市'),
						( 906,'王六', '男',1988,'计算机系', '湖南省衡阳市');
insert into score values (NULL,901, '计算机',98),
				(NULL,901, '英语', 80),
				(NULL,902, '计算机',65),
				(NULL,902, '中文',88),
				(NULL,903, '中文',95),
				(NULL,904, '计算机',70),
				(NULL,904, '英语',92),
				(NULL,905, '英语',94),
				(NULL,906, '计算机',90),
				(NULL,906, '英语',85);
-- (1)
select * from student;
-- (2)
select * from student limit 1,3;
-- (3)
select id,sex,department from student;
-- (4)
select * from student where department='英语系' or department='计算机系';
-- (5)
select * from student where birth between 1997 and 2001;
-- (6)
select department,count(department) from student group by department;
-- (7)
select c_name,max(grade) from score group by c_name;
-- (8)
select * from score limit 3,2;
-- (9)
select address from student where name like '王%';
-- (10)
select grade from score where c_name='计算机' order by grade desc;
-- (11)
select c_name,avg(grade),max(grade),min(grade) from score where c_name='英语';
