----------- 영화 하트 테이블 생성 -----------
CREATE TABLE MC_HEART(
    MID VARCHAR2(20) CONSTRAINT FK_HEART_MID REFERENCES MC_MEMBER(MID) ON DELETE CASCADE,	--멤버 아이디
    MOV_CODE CHAR(8) CONSTRAINT FK_MOV_CODE REFERENCES MC_MOVIE(MOV_CODE) ON DELETE CASCADE --영화코드
);

DROP TABLE MC_HEART;