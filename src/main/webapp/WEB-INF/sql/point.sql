create table MC_POINT(
	pid number constraint PK_PID primary key,						--포인트 아이디
	mid varchar2(20) constraint F_MID references MC_MEMBER(MID),	--맴버 아이디
	ppoint number not null,											--변동 포인트
	pcode char(2) check(pcode in ('PU','PC')) not null,				--pu 영화 예매 pc 포인트충전
	pdate date default sysdate										-- 포인트 변동날짜
 );
 
 create sequence seq_pid;
 
 
 DROP table MC_POINT;
 
 DROP sequence seq_pid;