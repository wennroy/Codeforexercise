CREATE DATABASE example1217;
USE example1217;

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
## (1)
DROP PROCEDURE IF EXISTS teacher_info1a;
DELIMITER $$
CREATE PROCEDURE teacher_info1a (IN teacher_id INT, OUT info VARCHAR(20))
	READS SQL DATA
    BEGIN
		SELECT name INTO info
        FROM teacher
        WHERE id = teacher_id;
	END $$
DELIMITER ;
## 
DROP PROCEDURE IF EXISTS teacher_info2a;
DELIMITER $$
CREATE PROCEDURE teacher_info2a (IN teacher_id INT, OUT info datetime)
	READS SQL DATA
    BEGIN
		SELECT year(from_days(datediff(now(), Birthday))) INTO info
        FROM teacher
        WHERE id = teacher_id;
	END $$
DELIMITER ;

## (2)
CALL teacher_info1a(1,@e1);
CALL teacher_info2a(2,@e2);
SELECT @e1 name_info;
SELECT @e2 age_info;

## (3)
DROP PROCEDURE IF EXISTS teacher_info1a;

## (4)
DROP FUNCTION IF EXISTS teacher_info2;
DELIMITER $$
CREATE FUNCTION teacher_info2(teacher_id INT)
	RETURNS int
	READS SQL DATA
    BEGIN
		DECLARE X int;
        DECLARE INFO int8;
		SELECT now()-Birthday INTO INFO
        FROM teacher
        WHERE id = teacher_id;
        SET X = INFO/10000000000;
        RETURN X;
	END $$
DELIMITER ;
