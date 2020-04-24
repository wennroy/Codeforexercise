#####20191119
show databases;
use ll;
create table product(id int primary key,
			name varchar(20) not null,
            function1 varchar(20),
            company varchar(20) not null,
            address varchar(50));
create table operate(op_id int primary key auto_increment,
			op_type varchar(20) not null,
            op_time time not null);
delimiter $$
create trigger product_af_insert after 
	insert on product 
    for each row 
    BEGIN
    insert into operate values(null,'after_insert',now());
    insert into operate values(null,'after_insert2',now());
    END $$
delimiter ;
create trigger product_bf_update before 
	update on product 
    for each row 
    insert into operate values(null,'before_update',now());
create trigger product_bf_del after 
	delete on product 
    for each row 
    insert into operate values(null,'before_del',now());

insert into product values(1001,'计算方法','无功能','厦门大学','思明南路422号');
insert into product values(1002,'计量','Regression','厦门大学','思明南路422号');
delete from product where id=1001;
update product set address='芙蓉二' where name='计量';
select * from product;
select * from operate;
drop trigger product_bf_update;
drop trigger product_bf_del;
