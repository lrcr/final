--sql 명령어는 여기다 저장
--data는 resource에 메모장(cvs)으로 저장

drop table member;
--회원정보 테이블
create table member(
email varchar2(30) primary key,
pw varchar2(30) not null,
nickname varchar2(50) not null,
phone number(15) not null,
agree varchar2(10) not null
);

--맛집정보 테이블
drop table rest;
create table rest(
no number(5) NOT NULL,
nm varchar2(30) PRIMARY KEY,
addr varchar2(300),
tel varchar2(20),
info varchar2(4000),
site varchar2(80),
time varchar2(35),
keyword varchar2(100),
reserve varchar2(10) NOT NULL,
delivery varchar2(10) NOT NULL,
tv varchar2(100),
link varchar2(100),
eval number(5,1)
);


