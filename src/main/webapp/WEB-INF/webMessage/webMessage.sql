show tables;

create table webMessage(
	idx  int not null auto_increment,  /* 메세지 고유번호 */
	title varchar(100) not null,       /* 메세지 제목 */
	content text not null, 						 /* 메세지 내용 */
	sendId varchar(20) not null, 			 /* 보내는 사람 아이디 */
	sendSw char(1)		 not null default 's', 			 /* 보낸 메세지(s), 휴지통(g), 휴지통 삭제(x) 표시 */
	sendDate datetime default now(),   /* 메세지 보낸 날짜 */
	receiveId varchar(20) not null,    /* 받는 사람 아이디 */
	receiveSw char(1)		 not null default 'n', 		 /* 받은 메세지(n), 읽은 메세지(r), 휴지통(g), 휴지통 삭제(x) 표시 */
	receiveDate datetime default now(),/* 메세지 받은날짜/읽은날짜 */
	primary key(idx),
	foreign key(sendId) references member(mid),
	foreign key(receiveId) references member(mid)
);

desc webMessage;
drop table webMessage;

insert into webMessage value (default, '규희언니 안녕 !','이번주 주말에 뭐해??', 'mina', default,default,'kh010129','r',default);
insert into webMessage value (default, '답장: 반갑다 미나야',' 이번주 주말에는 프로젝트 작업으로 바빠 ㅜㅜ', 'kh010129', default,default,'mina','r',default);
insert into webMessage values (default,'물어볼게 있는데','프로젝트 끝나구 만나자..','mina',default,default,'kh010129','r',default);
insert into webMessage values (default,'OK!!','그래 편한시간에 보자','kh010129',default,default,'mina',default,default);
insert into webMessage values (default,'안녕! 아톰~~','이번주 주말에 뭐하니???','mina',default,default,'atom',default,default);

select *, timestampdiff(hour, sendDate, now()) as hour_diff from webMessage where receiveId='mina' and (receiveSw='n' or receiveSw='r') order by idx desc;
select *, timestampdiff(hour, sendDate, now()) as hour_diff from webMessage where receiveId='kh010129' and (receiveSw='n' or receiveSw='r') order by idx desc;

select * from webMessage;

