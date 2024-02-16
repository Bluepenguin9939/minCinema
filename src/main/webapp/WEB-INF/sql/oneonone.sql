CREATE TABLE MC_ONEONONE(
    rn NUMBER PRIMARY KEY, --시퀀스 적용할 번호 큰의미는 없음
    msg_id  VARCHAR2(50), --ID 기본키
    sender VARCHAR2(50) CONSTRAINT FK_SENDER REFERENCES MC_MEMBER(MID) ON DELETE CASCADE, --(2024/02/16 수정) 멤버 ID 참조 
    mtitle VARCHAR2(50) NOT NULL,
    message VARCHAR2(500), --문의사항
    remessage varchar2(500),
    send_date DATE DEFAULT SYSDATE, 
    open_date DATE
);

CREATE SEQUENCE seq_rn;

SELECT * FROM MC_ONEONONE;