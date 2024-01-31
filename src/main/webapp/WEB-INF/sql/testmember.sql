CREATE TABLE TEST_MEMBER(
    tmno NUMBER NOT NULL,
    tmid VARCHAR2(20) PRIMARY KEY,
    tmpw VARCHAR2(20) NOT NULL,
    tmnick VARCHAR2(20) NOT NULL,
    tmname VARCHAR2(10) NOT NULL,
    tmemail VARCHAR2(40) NOT NULL,
    tmtel  VARCHAR2(50) NOT NULL
);

create sequence seq_tmno;