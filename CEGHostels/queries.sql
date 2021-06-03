create database hms;

use hms;

create table accounts(uname varchar(20),passwd varchar(20),level integer,h_no integer);

create table Hall(hid integer primary key auto_increment,Name varchar(40) not null,no_of_emp,no_of_hostels);

create table Hostel(hid integer primary key auto_increment,name varchar(40),capacity integer,no_of_rooms integer,no_of_emp integer,mess_contractor varchar(20),mess_capacity integer);

create table Student(sid integer primary key,name varchar(40),course varchar(10),dept varchar(20),year integer,city varchar(20),state varchar(20),phone integer);

create table Employee(eid integer primary key,name varchar(40),designation varchar(20), salary float);

create table Visitors(sid integer,name varchar(40),entry_time date,exit_time date,foreign key(sid) references Student(sid));

create table employee_hall(eid integer ,hid integer,foreign key(eid) references Employee(eid),foreign key(hid) references Hall(hid));

create table employee_hostel(eid integer,hid integer,foreign key(eid) references Employee(eid),
foreign key hid referenes Hall(hid));

create table hostel_hall(Hostel_id integer,Hall_id integer , foreign key(Hostel_id) references Hostel(hid), foreign key(Hall_id) references Hall(hid));

create table student_hostel(student_id integer,hostel_id integer,room_no integer,foreign key(student_id) references Student(sid), foreign key (hostel_id) references Hostel(hid));

insert into accounts values ('admin','123456',0,0);



