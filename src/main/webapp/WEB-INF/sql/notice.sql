create table mc_notice(
    nno number not null,				--공지번호
    ntitle varchar2(100) not null,		--공지제목
    ncontent varchar2(4000) not null,	--공지내용
    nregdate date default sysdate,		--공지날짜
    ncount number default 0				--공지 조회수
);

create sequence seq_nno;