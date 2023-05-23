drop database QuanLySinhVien;
create database QuanLySinhVien;
use  QuanLySinhVien;
create table Class(
ClassID int not null
primary key
auto_increment,
ClassName varchar(60) not null,
StartDate Datetime not null,
Status bit 
);
create table Student(
StudentID int not null
primary key
auto_increment,
StudentName varchar(30) not null,
Address varchar(50),
Phone varchar(20),
Status bit ,
ClassID int
);
create table Subject(
SubID int not null
primary key
auto_increment,
SubName varchar(30) not null,
Credit tinyint not null
default 1
check(Credit>=1),
Status bit default 1

);
create table Mark(
MarkID int not null
primary key
auto_increment,
SubID int not null,
StudentID int not null,
unique key (SubID, StudentID),
Mark float default 0
check ( Mark between 0 and 100),
ExamTimes tinyint default 1,
foreign key(SubID) references Subject(SubID),
foreign key(StudentID) references Student(StudentID)

);
insert into Class
value (1,'A1','2008-12-20',1);
insert into Class
value (2,'A2','2008-11-1',1);
insert into Class
value(3,'B3',current_date, 0);
insert into Student(StudentName,Address,Phone,Status,ClassID)
value('Hung','Ha Noi','0913113113',1,1);
insert into Student(StudentName, Address, Status, ClassID)
value('Hoa','Hai Duong',1,1);
insert into Student(StudentName,Address,Phone,Status,ClassID)
value('Manh','HCM','0220002200',0,2);
insert into Subject
value(1,'CF',5,1),
	(2,'C',6,1),
    (3,'HDJ',5,1),
    (4,'RDBMS',10,1);
insert into Mark (SubId, StudentId, Mark, ExamTimes)
value (1,1,8,1),
		(1,2,10,2),
        (2,1,12,1);
select * from Student
where StudentName like 'h%';
select * from Class
where month(StartDate) = 12;
select * from Subject
where Credit between 3 and 5;
update Student
set ClassID = 2
where StudentID= 1;
select Student.StudentName, Subject.SubName, Mark.Mark
from Mark
join Student on Mark.StudentID= Student.StudentID
join Subject on Mark.SubID = Subject.SubID
order by Mark.Mark Desc, Student.StudentName asc;
