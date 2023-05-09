-- QUOTES 

create database some;
use some;
create table god(
name varchar(100) not null,
age int not null
);

insert into god(name,age)
values("sai the \"god\" himself is here, too good", 26);
insert into god(name,age)
values("sai the 'god' himself is here, too good", 26);

select * from god;

show databases;
show tables;
select database();