create database student_management;
use student_management;

create table Class (
id int primary key auto_increment,
`name` varchar(50)
);

create table Teacher (
id int primary key auto_increment,
`name` varchar(50),
age int not null,
country varchar(50)
);

insert into Class values 
(1,"C06"),
(2,"C07");

insert into Teacher values
(1,"T",20,"VN");
