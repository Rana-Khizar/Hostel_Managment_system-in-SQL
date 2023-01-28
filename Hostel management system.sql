create database hostel;

-- Boys hostel table
create table boys_hostel (building_no int primary key, no_of_rooms int not null, 
no_of_student int not null,annual_expences int not null,location varchar (10) not null);



insert into boys_hostel values
(1001,'25','50','2450000','attock'),
(1002,'30','60','2740000','attock'),
(1003,'31','62','2870000','attock'),
(1004,'22','44','2120000','attock');

select * from boys_hostel;


-- Room table
create table room(room_id int not null primary key ,capacity int not null,
hostel_id int references boys_hostel (building_no),no_of_student int not null, 
room_status varchar(10) not null);



insert into room values
(2001,'2','1001',2,'full'),
(2002,'2','1001',2,'full'),
(2003,'2','1001',2,'full'),
(2004,'2','1001',2,'full'),
(2005,'2','1001',2,'full'),
(2006,'2','1001',1,'not_full'),
(2007,'2','1001',2,'full'),
(2008,'2','1001',2,'full'),
(2009,'2','1001',1,'not_full'),
(2010,'2','1001',1,'not_full'),
(2011,'2','1001',1,'not_full');

select * from room;

--Student table
create table student (student_id int primary key, student_name varchar (40) not null, student_father_name varchar (40),
department varchar (30) not null, address varchar (40) not null, cell_no varchar (20) not null, student_age int not null, 
student_DOB date not null,building_no int references boys_hostel(building_no), room_id int references room (room_id) );



insert into student values
(101,'Asad','masood elahi','computer science','mardan cantt','0334-3234555','20','6/15/2001','1001',2001),
(102,'qayyum','momen shah','management','garm chashma chatral','0345-5654666','23','7/13/1998','1001',2001),
(103,'hassan','M.tariq','management','DI khan','0302-0097878','21','2/13/2000','1001',2002),
(104,'amin','m.fazal','computer science','takht bai','0308-1123233','22','5/1/1999','1001',2003),
(105,'atiq khan','shamshat khan','computer science','hango','0314-8877656','21','4/19/2000','1001',2003),
(106,'juniad','m.munir','management','fatih jung','03xx-9878788','23','5/28/1998','1001',2002),
(107,'asif hussain','m.hussain','computer science','liyya gorak pur','0305-4545455','22','4/19/1999','1001',2004),
(108,'kashif ktk','m.ijaz','computer science','karak','0344-4545454','20','9/1/2001','1001',2005),
(109,'bahadur khan','mazdoor khan','management','akorha khatak','0300-6767608','21','9/20/2000','1001',2005),
(110,'bilal','m.younas','computer science','mardan cantt','0323-3430544','22','5/1/1999','1001',2006),
(111,'atiq-ur-rehman','saifullah','computer science','peshawer','0322-3434343','22','3/1/1999','1001',2007),
(112,'sajawal','m.shafiq','computer science','attock','0302-3434344','23','3/20/1998','1001',2007),
(113,'noman','m.shafiq','computer science','haripur','0304-3434005','21','8/14/2000','1001',2008),
(114,'m.ahsan','ijaz ahmad','computer science','pendigape','0301-4543962','21','4/20/2000','1001',2008),
(115,'m.danish','jahanzeb khan','Electrical engineering','deer','0307-3467909','22','9/2/1999','1001',2009),
(116,'kashif','masood','Electrical engineering','swat','0345-5656788','23','1/2/1998','1001',2010),
(117,'faisal khan','allah dita','Electrical engineering','mardan cantt','0341-0044596','21','10/2/2000','1001',2011);

select * from student;


-- Mess table
create table mess( mess_incharge_Id varchar (20) not null primary key, monthly_avg_expence varchar (30) not null,
mess_bf_timing varchar (45) not null,mess_dinner_timing varchar (45) not null,sunday_bf_timing varchar (45) not null);



insert into mess values
('9321','102400','7:00 AM to 8:45 AM','7:30 PM to 8:45 PM','9:00 AM to 11:00 AM'),
('9322','106400','7:30 AM to 8:45 AM','7:00 PM to 8:45 PM','9:00 AM to 11:00 AM');

 select * from mess;


-- Staff table
create table staff(emp_name varchar (40) not null, emp_id int not null primary key, emp_address varchar (50) not null,
emp_salary int not null, emp_cellno varchar (20) not null, building_no int not null references boys_hostel(building_no),
emp_designation varchar (40) not null, mess_incharge_Id varchar (20) references mess (mess_incharge_id));



insert into staff values
('habib','8321','sheen bagh attock','15000','0343-4545778',1001,'cook','9321'),
('zahid','8322','awan sharif attock','15042','0342-4590899',1001,'sweeper',null),
('abdul rehman','8323','sheen bagh attock','15042','0303-3445543',1001,'mess manager','9322'),
('waqar','8324','fowara chock attock','12050','0306-4545454',1001,'sweeper',null),
('taimur','8325','madni chock,attock','18000','0312-8787898',1001,'technician',null),
('mazhar','8327','sheen bagh attock','12050','0335-4540007',1001,'laundryman',null),
('zaheen','8326','awan sharif attock','18000','0324-4555676',1002,'technician',null);

insert into staff values
('habib','8328','sheen bagh attock','25000','0343-4545778',1001,'Supervisor',null),
('zahid','8329','awan sharif attock','14042','0342-4590899',1001,'H_security',null),
('habib','8330','sheen bagh attock','12000','0343-4545778',1001,'H_security',null),
('Ali','8331','awan sharif attock','11000','0342-4590899',1002,'H_security',null),
('aslam','8332','awan sharif attock','10500','0342-4590899',1002,'H_security',null);
select * from staff;


--	Visitor table
CREATE table visitor(visitor_id int not null primary key,
student_id int not null references student (student_id),
visitor_name varchar (40) not null,visitor_time_in varchar (40) not null,
visitor_time_out varchar (40) not null,
student_name varchar (40) not null,date_entring date not null);



insert into visitor values
(4561,'101','fahad','8:45 PM','9:25 PM','asad','5/1/2014'),
(4562,'101','zahid','8:45 PM','9:25 PM','asad','5/1/2014'),
(4563,'105','tanveer','6:50 PM','7:10 PM','atiq khan','4/2/2014'),
(4564,'106','fawad','2:00 PM','2:30 PM','junaid','4/2/2014'),
(4565,'107','ali','3:24 Pm','4:45 Pm','asif husain','4/10/2014'),
(4566,'107','noman','10:00 AM','11:00 AM','asif husain','4/10/2014'),
(4567,'110','yasir','2:23 PM','3:08 PM','bilal','4/20/2014'),
(4568,'112','umair','3:09 pM','4:43 PM','sajawal','5/3/2014'),
(4569,'114','jawad','7:00 PM','8:45 PM','m.ahsan','5/4/2014'),
(4560,'116','muazzam','8:00 AM','9:56 AM','kashif','4/23/2014');

select * from visitor;


--  Furniture table
create table furniture(furniture_id varchar (34) not null primary key,quantity int not null,
room_id int not null references room (room_id), furniture_type varchar (40) not null);



insert into furniture values
('AK97',2,'2001','bed'),
('AK98',1,'2001','study chair'),
('AK99',2,'2002','bed'),
('AK10',1,'2002','study chair'),
('AK11',1,'2002','study table'),
('AK12',2,'2003','bed'),
('AK13',1,'2004','study chair'),
('AK14',1,'2004','study table'),
('AK15',2,'2004','bed'),
('AK16',2,'2005','bed'),
('AK17',1,'2006','study chair'),
('AK18',1,'2006','study table'),
('AK19',2,'2006','bed'),
('AK20',2,'2007','bed'),
('AK21',1,'2007','study table'),
('AK22',2,'2008','bed'),
('AK23',1,'2008','study chair');

select * from furniture;
select room_id,furniture_id from furniture where furniture_type!='bed';


-- Fee table
create table Fee (fee_month_year varchar(20) not null, fee_status varchar (40) not null,T_fee int,
student_id int not null references student (student_id),
student_name varchar (40) not null,primary key (fee_month_year,student_id));



insert into Fee values
('january-2014','paid',6000,'101','asad'),
('february-2014','not paid',6000,'101','asad'),
('march-2014','paid',6000,'101','asad'),
('april-2014','not paid',6000,'101','asad'),
('may-2014','paid',6000,'101','asad');
insert into Fee values
('january-2014','paid',6000,'102','qayyum'),
('february-2014','not paid',6000,'102','qayyum'),
('march-2014','paid',6000,'102','qayyum'),
('april-2014','paid',6000,'102','qayyum'),
('may-2014','not paid',6000,'102','qayyum');
insert into Fee values
('january-2014','not paid',6000,'103','hassan'),
('february-2014','not paid',6000,'103','hassan'),
('march-2014','paid',6000,'103','hassan'),
('april-2014','paid',6000,'103','hassan'),
('may-2014','paid',6000,'103','hassan');
insert into Fee values
('january-2014','paid',6000,'104','amin'),
('february-2014','not paid',6000,'104','amin'),
('march-2014','paid',6000,'104','amin'),
('april-2014','not paid',6000,'104','amin'),
('may-2014','not paid',6000,'104','amin');
select * from fee;


-- Drop all tables
drop table Fee;
drop table furniture;
drop table  visitor;
drop table staff;
drop table mess;
drop table student;
drop table room;
drop table boys_hostel;

-- Drop database
drop database hostel;