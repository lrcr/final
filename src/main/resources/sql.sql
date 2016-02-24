--sql 명령어는 여기다 저장
--data는 resource에 메모장(cvs)으로 저장

drop table member purge;
--회원정보 테이블
create table member(
email varchar2(30) primary key,
pw varchar2(30) not null,
nicknm varchar2(50) not null,
phone number(15) not null,
agree varchar2(10) not null
);

--맛집정보 테이블
drop table rest purge;
create table rest(
no number(5) NOT NULL,
nm varchar2(50) PRIMARY KEY,
addr varchar2(300), --주소
tel varchar2(20), --전화번호
info varchar2(4000), --소개
site varchar2(80), --음식점 사이트
keyword varchar2(100), --키워드
time varchar2(35), --영업시간
reserve varchar2(10) NOT NULL, --예약
delivery varchar2(10) NOT NULL, --배달
tv varchar2(100), -- 방송 프로그램명
link varchar2(100), --방송링크
loc varchar2(100), --위도,경도
indu varchar2(15), --업종
eval number(5,1) --평점
);


--공지사항 테이블
drop table board purge;
create table board(
no number(30) primary key,
title varchar2(500) not null,
content varchar2(4000) not null,
nicknm varchar2(100) not null,
hits number(30) not null,
submit date not null
);

--댓글 테이블
drop table reply purge;
create table reply(
no number(10) not null,
nickname varchar2(100) not null,
ment varchar2(4000) not null,
eval number(5,1) not null,
seq number(10) primary key,
submit date not null
);

--게시판 시퀀스
drop sequence seq;
create sequence seq
increment by 1
start with 1
;

--댓글 시퀀스
drop sequence ment;
create sequence ment
increment by 1
start with 1
;



