--sql ��ɾ�� ����� ����
--data�� resource�� �޸���(cvs)���� ����

drop table member;
--ȸ������ ���̺�
create table member(
email varchar2(30) primary key,
pw number(20) not null,
nickname varchar2(50)not null,
phone number(15),
agree number(5),
auth number(5)
);