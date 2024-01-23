----------- 멤버 테이블 생성---------
create table MC_MEMBER(
    mid varchar2(20) constraint PK_MID primary key,
    mpw varchar2(20) not null, 
    memail varchar2(50) not null,
    mname varchar2(13) not null,
    mnick varchar2(30) not null,
    mtel varchar2(13) not null,
    mpoint number default 0,
    mactive char(1) default 'Y' check(mactive in ('Y', 'N')),
    mregdate date default sysdate
);