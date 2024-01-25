create table MC_POINT(
	pid number constraint PK_PID primary key,
	mid varchar2(20) constraint F_MID references MC_MEMBER(MID),
	ppoint number not null,
	pcode char(2) check(pcode in ('PU','PC')) not null,
	pdate date default sysdate
 );
 
 create sequence seq_pid;