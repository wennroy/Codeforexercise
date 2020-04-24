create database example1203;
use example1203;
############第一题
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
## (1)
 select * from student;
## (2)
select * from student limit 1,3;
## (3)
select id, name, department from student;
## (4)
select * from student where department='英语系' or department='计算机系';
## (5)
select * from student where birth between 2019-36 and 2019-28;
## (6)
select department,count(department) from student group by department;
## (7)
select c_name,max(grade) from score group by c_name;
## (8)
select score.c_name,score.grade from score,student where name='李四' 
			and score.stu_id=student.id;
## (9)
select * from student,score where score.stu_id=student.id;
## (10)
select student.name,sum(score.grade) from student,score 
	where student.id=score.stu_id group by score.stu_id;
## (11)
select c_name, avg(grade) from score group by c_name;
## (12)
select student.* from student,score where score.stu_id=student.id and 
		score.grade<95 and score.c_name='计算机';
## (13)
select distinct student.* from student,score where score.stu_id=student.id and 
		score.stu_id in (
        select stu_id from score where c_name='英语') and
        score.stu_id in (
        select stu_id from score where c_name='计算机');
## (14)
select grade from score where c_name='计算机' order by grade desc;
## (15)
select stu_id from score union all select id from student;
## (16)
select student.name,student.department,score.c_name,score.grade 
		from student,score where score.stu_id = student.id and(
        student.name like '王%' or student.name like '张%');
## (17)
select student.name,student.department,score.c_name,score.grade 
		from student,score where score.stu_id = student.id and
        student.address like '%湖南%';

#########第二题
## (1)
create table department(d_id int primary key,
		d_name varchar(20) not null,
        function1 varchar(20),
        address varchar(30));
create table employee(id int primary key,
		name varchar(20) not null,
        sex varchar(4),
        age int(5),
        d_id int,
        salary float,
        address varchar(50));
## (2)
insert into department values ( 1001,'人事部', '人事管理', '北京'),
 ( 1002,'科研部', '研发产品', '北京'),
 ( 1003,'生产部', '产品生产', '天津'),
 ( 1004,'销售部', '产品销售', '上海');
 
 insert into employee values ( 9001,'Aric', '男',25, 1002,4000, '北京市海淀区'),
 ( 9002,'Jim ', '男',26, 1001,2500, '北京市昌平区'),
 ( 9003,'Tom', '男',20, 1003,1500, '湖南省永州市'),
 ( 9004,'Eric', '男',30, 1001,3500, '北京市顺义区'),
 ( 9005,'Lily', '女',21, 1002,3000, '北京市昌平区'),
 ( 9006,'Jack', '男',28, 1003,1800, '天津市南开区');
 ## (3)
 select * from employee;
 ## (4)
 select * from employee limit 3,2;
 ## (5)
 select d_id,d_name,d_function1 from department;
 ## (6)
 select * from employee where d_id= any (select d_id from department
		where d_name='人事部' or d_name='科研部');
 ## (7)
 select * from employee where age between 25 and 30;
 ## (8)
 select department.d_name, count(employee.d_id) from department,employee
		where department.d_id=employee.d_id group by employee.d_id;
 ## (9)
 select department.d_name,max(employee.salary) from department,employee
		where department.d_id=employee.d_id group by employee.d_id;
 ## (10)
 select * from department left join employee on 
		department.d_id = employee.d_id;
## (11)
 select department.d_name,sum(employee.salary) from department,employee
		where department.d_id=employee.d_id group by employee.d_id;
## (12)
select salary from employee order by salary desc;
## (13)
select d_id from department union all select d_id from employee;
## (14)
select name,age,address from employee where address like '%北京%';