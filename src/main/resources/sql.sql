--sql ��ɾ�� ����� ����
--data�� resource�� �޸���(cvs)���� ����

drop table member;
--ȸ������ ���̺�
create table member(
email varchar2(30) primary key,
pw varchar2(30) not null,
nickname varchar2(50) not null,
phone number(15) not null,
agree varchar2(10) not null
);