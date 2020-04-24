use ll;
create table Person(id int primary key auto_increment,Email varchar(20));
insert into Person values(Null,'a@b.com'),(Null,'a@c.com'),(Null,'a@b.com');
select * from Person;
create view Person_view as select Email,count(Email) from Person group by Email;
select * from Person_view;
SELECT Email FROM Person 
GROUP BY Email
HAVING COUNT(Email) > 1;

create table person1 as select Email,count(Email) from Person group by Email;

#############################20191203
select * from employee where d_id in (select d_id from department);
select * from employee;
select * from department;

############################20191210
SELECT * FROM product;
INSERT INTO product SELECT * FROM product WHERE id=1002;

