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
//  MOV_NATION VARCHAR2(40) NOT NULL,          현재 안씀                 -- 영화 제작국가
//  MOV_POSTERURL VARCHAR2(100) NOT NULL,      현재 안씀                 -- 영화 포스터URL
//  MOV_STILLURL VARCHAR2(100) NOT NULL        현재 안씀                 -- 영화 스틸컷URL
);

DROP TABLE MC_MOVIE;


-----영화관 날짜일정 배정 테이블------
CREATE TABLE MC_MOVIE_DATE(
	MOV_DATE_CODE VARCHAR2(40) CONSTRAINT PK_MOV_DATE_CODE PRIMARY KEY, --영화시간코드 --()
	MOV_CODE CHAR(8) REFERENCES MC_MOVIE(MOV_CODE) NOT NULL,    --영화코드
	MOV_SCREEN_DATE varchar2(10) NOT NULL	--상영날짜 2024-02-01 

); -- 영화마다 몇날 영화를하는지 나타내기위해 

DROP TABLE MC_MOVIE_DATE;


-----영화관 시간일정 배정 테이블------
CREATE TABLE MC_MOVIE_TIME(
	MOV_TIME_CODE VARCHAR2(20) CONSTRAINT PK_MOV_TIME_CODE PRIMARY KEY, --영화시간코드 --()
	MOV_DATE_CODE VARCHAR2(40) REFERENCES MC_MOVIE_DATE(MOV_DATE_CODE) NOT NULL, --영화날짜 코드
	MOV_START_TIME VARCHAR2(5) NOT NULL,	--상영시간 
	MOV_LOC VARCHAR2(4) NOT NULL		--상영관 (1~7) 관
	
);

DROP TABLE MC_MOVIE_TIME;



-----상영관 예약 테이블------ ex) /1관_2024.02_1100_A01 /1관 /1100 /A01  
CREATE TABLE MC_MOVIE_LOC(
	MOV_LOC_CODE VARCHAR2(30) PRIMARY KEY, --상영관 코드 (1관_1100_A01) primarykey
	MOV_LOC VARCHAR2(4) NOT NULL, --상영관 		1관
	MOV_LOC_DATE varchar2(10) NOT NULL, --영화날짜    11시 am
	MOV_LOC_TIME VARCHAR2(5) NOT NULL, --영화시간    11시 am
	SEAT_NAME_RES VARCHAR2(4) NOT NULL --좌석이름 	(A01~12) ~ (F01~F12)
); --몇시 몇관에서 예약된좌석 구분

DROP TABLE MC_MOVIE_LOC;


SELECT 
TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI'), --현재날짜 / 시 분
TO_CHAR(SYSDATE, 'HH24:MI')--현재시간 포맷 (24시간)
FROM
DUAL;

