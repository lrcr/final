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

--�������� ���̺�
drop table rest purge;
create table rest(
no number(5) NOT NULL,
nm varchar2(50) PRIMARY KEY,
addr varchar2(300), --�ּ�
tel varchar2(20), --��ȭ��ȣ
info varchar2(4000), --�Ұ�
site varchar2(80), --������ ����Ʈ
keyword varchar2(100), --Ű����
time varchar2(35), --�����ð�
reserve varchar2(10) NOT NULL, --����
delivery varchar2(10) NOT NULL, --���
tv varchar2(100), -- ��� ���α׷���
link varchar2(100), --��۸�ũ
loc varchar2(100), --����,�浵
indu varchar2(15), --����
eval number(5,1) --����
);


