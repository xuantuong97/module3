create database student_management;
use student_management;

create table class (
id int primary key auto_increment,
class_name varchar(50)
);

create table teacher (
id int primary key auto_increment,
teacher_name varchar(50),
age int not null,
country varchar(50)
);

insert into class values 
(1,"C06"),
(2,"C07");

insert into teacher values
(1,"T",20,"VN");
