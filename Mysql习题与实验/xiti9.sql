CREATE DATABASE example1210;
use example1210;
######### 第一题
## (1)
CREATE TABLE food(id int PRIMARY KEY auto_increment,
				name VARCHAR(20) NOT NULL,
                company VARCHAR(30) NOT NULL,
                price FLOAT,
                poduce_time YEAR,
                validity_time int(4),
                address VARCHAR(50));
## (2)
INSERT INTO food values (1,'AA饼干','AA饼干厂', 2.5 ,'2008', 3 ,'北京'),
		(2,'CC牛奶','CC牛奶厂', 3.5 ,'2009', 1 ,'河北'),
		(NULL,'EE果冻','EE果冻厂', 1.5 ,'2007', 2 ,'北京'),
		(NULL,'FF咖啡','FF咖啡厂', 20 ,'2002', 5 ,'天津'),
		(NULL,'GG奶糖','GG奶糖', 14 ,'2003', 3 ,'广东');
## (3)
UPDATE food SET address='内蒙古',price=3.2 WHERE name='CC牛奶';
## (4)
UPDATE food set validity_time=5 WHERE address LIKE '%北京%';
## (5)
## 更新保质期为15年
UPDATE food set validity_time = 15;
DELETE FROM food WHERE validity_time < 2019 - produce_time;
## (6)
DELETE FROM food WHERE address LIKE '%北京%';

######### 第二题
## (1)
CREATE TABLE teacher(id int(4) PRIMARY KEY AUTO_INCREMENT,
		Num int NOT NULL,
        name VARCHAR(20) NOT NULL,
        Sex VARCHAR(4) NOT NULL,
        Birthday DATETIME,
        address VARCHAR(50));
INSERT INTO teacher VALUES(1, 1001, '张三','男' ,'1984-11-08','北京市昌平区'),
		(2, 1002, '李四','女' ,'1970-01-21' ,'北京市海淀区'),
		(NULL, 1003, '王五','男' ,'1976-10-30' ,'北京市昌平区'),
		(NULL, 1004, '赵六','男' ,'1980-06-05' ,'北京市顺义区');

## (2)
UPDATE teacher set Birthday='1982-11-08' WHERE id=1;
## (3)
UPDATE teacher set address = '北京市朝阳区' WHERE Sex = '男';
## (4)
DELETE FROM teacher WHERE Num=1002;
SELECT * FROM teacher;