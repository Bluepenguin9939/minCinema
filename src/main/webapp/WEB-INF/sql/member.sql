----------- 멤버 테이블 생성---------
create table MC_MEMBER(
	mno number not null, -- 관리자할때 필요
    mid varchar2(20) constraint PK_MID primary key,         -- id
    mpw varchar2(20) not null, 								-- 비밀번호
    memail varchar2(50) not null,							-- 이메일주소
    mname varchar2(13) not null,							-- 이름
    mnick varchar2(30) not null,							-- 닉네임
    mtel varchar2(13) not null,								-- 전화번호
    mpoint number default 0,								-- 포인트
    mactive char(1) default 'Y' check(mactive in ('Y', 'N')), 	--밴유무
    mregdate date default sysdate							-- 가입날짜
);

create sequence seq_mno

DROP table MC_MEMBER;