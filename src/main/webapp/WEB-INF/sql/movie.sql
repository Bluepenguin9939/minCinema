----------- 영화 상세정보 테이블 생성 -----------
CREATE TABLE MC_MOVIE(
    MOV_CODE NUMBER CONSTRAINT PK_MOV_CODE PRIMARY KEY,                -- 영화 코드
    MOV_TITLE VARCHAR2(100) NOT NULL,                                  -- 영화 타이틀
    MOV_DIRECTOR VARCHAR2(50) NOT NULL,                                -- 영화 감독
    MOV_ACTOR VARCHAR2(2000),                             		       -- 영화 배우
    MOV_RELEASEDATE DATE NOT NULL,                                     -- 영화 개봉일
    MOV_PLOT VARCHAR2(3000) NOT NULL,                                  -- 영화 줄거리
    MOV_RUNTIME NUMBER(3) NOT NULL,                                    -- 영화 런타임
    MOV_RATING VARCHAR2(30) NOT NULL,                                  -- 영화 관람기준
    MOV_GENRE VARCHAR2(40) NOT NULL,                                   -- 영화 장르
//  MOV_NATION VARCHAR2(40) NOT NULL,          현재 안씀                 -- 영화 제작국가
//  MOV_POSTERURL VARCHAR2(100) NOT NULL,      현재 안씀                 -- 영화 포스터URL
//  MOV_STILLURL VARCHAR2(100) NOT NULL        현재 안씀                 -- 영화 스틸컷URL
);