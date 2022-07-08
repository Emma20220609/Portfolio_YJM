create database myboard;
use myboard;

drop table comment;
drop table attach;
drop table board;
drop table user;

create table user
(
	user_no int primary key auto_increment comment'ȸ����ȣ',
	user_id varchar(20) comment'���̵�',
	user_pw varchar(50) comment'��й�ȣ',
	user_name varchar(10) comment'�̸�',
	user_interest varchar(200) comment'���ɺо�',
	user_gender varchar(10) comment'����',
	join_date datetime default now() comment'��������',
	user_autho varchar(5) default 'U' comment'����',
	user_retire varchar(2) default 'N' comment'Ż�𿩺�'
); 

insert into user (user_id,user_pw,user_name,user_gender,user_autho) 
values ('yjmny',md5('1111'),'������','F','A');

create table board
(
	board_no int primary key auto_increment comment'�Խù� ��ȣ',
	user_no int comment'ȸ����ȣ',
	board_type varchar(2) default 'A' comment'�Խù� ����',
	board_title varchar(50) comment'����',
	board_note text comment'����',
	board_name varchar(10) comment'�ۼ���',
	board_phone varchar(20) comment'����ó',
	board_start varchar(100) comment'�����Ⱓ ������',
	board_end varchar(100) comment'�����Ⱓ ������',
	board_date datetime default now() comment'�ۼ���',
	board_province varchar(20) comment'�õ�',
	board_city varchar(20) comment'�ñ�',
	board_loca varchar(100) comment'����',
	board_proc varchar(2) default 'O' comment'�������',
	board_hit int default 0 comment'��ȸ��',
	foreign key (user_no) references user(user_no)
);

create table comment
(
	comt_no int primary key auto_increment comment'��۹�ȣ',
	board_no int comment'�Խù���ȣ',
	-- user_no int comment'�Խù� ȸ����ȣ',
	comt_userno int comment'��� �ۼ��� ȸ����ȣ',
	comt_name varchar(10) comment'��� �ۼ���',
	comt_note text comment'����',
	comt_date datetime default now() comment '�ۼ���',
	foreign key (board_no) references board(board_no)
	-- foreign key (user_no) references user(user_no)
);



create table attach
(
	attach_no int primary key auto_increment comment'÷�����Ϲ�ȣ',
	board_no int comment'�Խù���ȣ',
	-- user_no int comment'ȸ����ȣ',
	attach_pname varchar(255) comment'�������ϸ�',
	attach_lname varchar(255) comment'�����ϸ�',
	foreign key (board_no) references board(board_no)
	-- foreign key (user_no) references board(user_no)
);

create table ask
(
	ask_no int primary key auto_increment comment'���ǹ�ȣ',
	user_no int comment'ȸ����ȣ',
	ask_email varchar(50) comment'�̸���',
	ask_title varchar(20) comment'����',
	ask_note text comment'����',
	foreign key (user_no) references user(user_no)
);



-- alter table board add board_notice varchar(2) default 'N' comment '��������'