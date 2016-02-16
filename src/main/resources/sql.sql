--sql 명령어는 여기다 저장
--data는 resource에 메모장(cvs)으로 저장

drop table member;
--회원정보 테이블
create table member(
email varchar2(30) primary key,
pw number(20) not null,
nickname varchar2(50)not null,
phone number(15),
agree number(5),
auth number(5)
);