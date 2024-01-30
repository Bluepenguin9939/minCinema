-------- 이벤트 테이블 --------
CREATE TABLE MC_EVENT(
    ENO NUMBER PRIMARY KEY,											--이벤트 번호
    MID VARCHAR2(20) CONSTRAINT FK_MID REFERENCES MC_MEMBER(MID),	-- 멤버 아이디
    EDATE DATE DEFAULT SYSDATE,										-- 이벤트 날짜
    ECHECK CHAR(1) DEFAULT 'Y' NOT NULL								-- 이벤트 체크
);

CREATE SEQUENCE SEQ_ENO;




DROP TABLE MC_EVENT;

DROP SEQUENCE SEQ_ENO;