use lll;
#############存储过程
DROP PROCEDURE IF EXISTS num_from_employee ;
DELIMITER $$
CREATE PROCEDURE num_from_employee (IN emp_id INT, OUT count_num INT)
	READS SQL DATA
    BEGIN
		SELECT COUNT(*) INTO count_num
        FROM employee
        WHERE d_id = emp_id;
    END$$
DELIMITER ;
CALL num_from_employee(1001,@e) ;
SELECT @e;

#############存储函数
DROP FUNCTION IF EXISTS name_from_employee;
DELIMITER $$
CREATE FUNCTION name_from_employee (emp_id INT)
	RETURNS VARCHAR(20)
	READS SQL DATA 
    BEGIN
		RETURN (SELECT name
        FROM employee
        WHERE id=emp_id);
	END$$
DELIMITER ;
SELECT * FROM employee;
SELECT name_from_employee(9002);

#############定义变量 declare
DELIMITER $$
CREATE PROCEDURE num_from_emp(in emp_id INT, OUT count_num INT)
	BEGIN
		DECLARE my_x INT DEFAULT 12;
		SET my_x = 60;
		SELECT d_id INTO my_x FROM employee WHERE id = 9001;
	END$$
DELIMITER ;
### 查看创建过程
SHOW STATUS;
SHOW CREATE PROCEDURE num_from_employee;
SELECT * FROM information_schema.processlist;

###### 存储过程与函数 READS SQL DATA | MODIFIES| SQL DATA|
ALTER PROCEDURE num_from_employee MODIFIES SQL DATA SQL SECURITY INVOKER;
