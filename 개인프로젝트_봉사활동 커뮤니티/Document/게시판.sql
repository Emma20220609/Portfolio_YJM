create database myboard;
use myboard;

drop table comment;
drop table attach;
drop table board;
drop table user;

create table user
(
	user_no int primary key auto_increment comment'회원번호',
	user_id varchar(20) comment'아이디',
	user_pw varchar(50) comment'비밀번호',
	user_name varchar(10) comment'이름',
	user_interest varchar(200) comment'관심분야',
	user_gender varchar(10) comment'성별',
	join_date datetime default now() comment'가입일자',
	user_autho varchar(5) default 'U' comment'권한',
	user_retire varchar(2) default 'N' comment'탈퇴여부'
); 

insert into user (user_id,user_pw,user_name,user_gender,user_autho) 
values ('yjmny',md5('1111'),'관리자','F','A');

create table board
(
	board_no int primary key auto_increment comment'게시물 번호',
	user_no int comment'회원번호',
	board_type varchar(2) default 'A' comment'게시물 구분',
	board_title varchar(50) comment'제목',
	board_note text comment'내용',
	board_name varchar(10) comment'작성자',
	board_phone varchar(20) comment'연락처',
	board_start varchar(100) comment'모집기간 시작일',
	board_end varchar(100) comment'모집기간 종료일',
	board_date datetime default now() comment'작성일',
	board_province varchar(20) comment'시도',
	board_city varchar(20) comment'시군',
	board_loca varchar(100) comment'지역',
	board_proc varchar(2) default 'O' comment'진행상태',
	board_hit int default 0 comment'조회수',
	foreign key (user_no) references user(user_no)
);

create table comment
(
	comt_no int primary key auto_increment comment'댓글번호',
	board_no int comment'게시물번호',
	-- user_no int comment'게시물 회원번호',
	comt_userno int comment'댓글 작성자 회원번호',
	comt_name varchar(10) comment'댓글 작성자',
	comt_note text comment'내용',
	comt_date datetime default now() comment '작성일',
	foreign key (board_no) references board(board_no)
	-- foreign key (user_no) references user(user_no)
);



create table attach
(
	attach_no int primary key auto_increment comment'첨부파일번호',
	board_no int comment'게시물번호',
	-- user_no int comment'회원번호',
	attach_pname varchar(255) comment'물리파일명',
	attach_lname varchar(255) comment'논리파일명',
	foreign key (board_no) references board(board_no)
	-- foreign key (user_no) references board(user_no)
);

create table ask
(
	ask_no int primary key auto_increment comment'문의번호',
	user_no int comment'회원번호',
	ask_email varchar(50) comment'이메일',
	ask_title varchar(20) comment'제목',
	ask_note text comment'내용',
	foreign key (user_no) references user(user_no)
);



-- alter table board add board_notice varchar(2) default 'N' comment '공지여부'