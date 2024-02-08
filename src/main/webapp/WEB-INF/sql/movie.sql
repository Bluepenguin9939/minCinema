----------- 영화 상세정보 테이블 생성 -----------
CREATE TABLE MC_MOVIE(
    MOV_CODE CHAR(8) CONSTRAINT PK_MOV_CODE PRIMARY KEY,               -- 영화 코드
    MOV_TITLE VARCHAR2(100) NOT NULL,                                  -- 영화 타이틀
    MOV_DIRECTOR VARCHAR2(50) NOT NULL,                                -- 영화 감독
    MOV_ACTOR VARCHAR2(2000),                             		       -- 영화 배우
    MOV_RELEASEDATE CHAR(10) NOT NULL,                                 -- 영화 개봉일
    MOV_PLOT VARCHAR2(3000) NOT NULL,                                  -- 영화 줄거리
    MOV_RUNTIME NUMBER(3) NOT NULL,                                    -- 영화 런타임
    MOV_RATING VARCHAR2(30) NOT NULL,                                  -- 영화 관람기준
    MOV_GENRE VARCHAR2(40) NOT NULL,                                   -- 영화 장르
    MOV_TRAILER VARCHAR2(200) NOT NULL     		                   -- 영화 트레일러
);

DROP TABLE MC_MOVIE;


-----영화관 날짜일정 배정 테이블------
CREATE TABLE MC_MOVIE_DATE(
	MOV_DATE_CODE VARCHAR2(40) PRIMARY KEY, --영화날짜코드 --()
	MOV_TITLE VARCHAR2(40) NOT NULL, -- 영화 제목
	MOV_CODE CHAR(8) REFERENCES MC_MOVIE(MOV_CODE) NOT NULL ON DELETE CASCADE,    --영화코드
	MOV_SCREEN_DATE varchar2(10) NOT NULL,	--상영날짜 2024-02-01 
	MOV_START_TIME VARCHAR2(5) NOT NULL,		--상영 시작시간 
	MOV_END_TIME VARCHAR2(5) NOT NULL,			--영화 종료시간
	MOV_THEATER VARCHAR2(4) NOT NULL		--상영관 (1~7) 관
);-- 영화마다 몇날 영화를하는지 나타내기위해 

CREATE SEQUENCE SEQ_DATE;

DROP TABLE MC_MOVIE_DATE;

DROP SEQUENCE SEQ_DATE;

--테이블 2개를 그냥 다시 하나로 만듬


-----상영관 예약 or 예약정보 테이블------ ex) /1관_2024.02_1100_A01 /1관 /1100 /A01  
CREATE TABLE MC_MOVIE_THEATER(
	MOV_THEATER_CODE VARCHAR2(30) PRIMARY KEY, --primarykey
	MOV_DATE_CODE VARCHAR2(40) references MC_MOVIE_DATE(MOV_DATE_CODE) ON DELETE CASCADE , --영화날짜코드 --()
	MOV_THEATER VARCHAR2(4) NOT NULL, --상영관 		1관
	MOV_THEATER_DATE varchar2(10) NOT NULL, --영화날짜    11시 am
	MOV_THEATER_TIME VARCHAR2(5) NOT NULL, --영화시간    11시 am
	SEAT_NAME_RES VARCHAR2(4) NOT NULL, --좌석이름 	(A01~12) ~ (F01~F12)
	MID VARCHAR2 (20) NOT NULL references MC_MEMBER(MID)

); 

CREATE SEQUENCE SEQ_THEATER;

DROP TABLE MC_MOVIE_THEATER;

DROP SEQUENCE SEQ_THEATER;



SELECT 
TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI'), --현재날짜 / 시 분
TO_CHAR(SYSDATE, 'HH24:MI')--현재시간 포맷 (24시간)
FROM
DUAL;

