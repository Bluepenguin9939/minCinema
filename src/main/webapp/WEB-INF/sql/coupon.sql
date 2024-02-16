-------- 이벤트 테이블 --------
CREATE TABLE MC_COUPON(
    CNO NUMBER PRIMARY KEY,													-- 고유키
    MID VARCHAR2(20) CONSTRAINT FK_COUPON_MID REFERENCES MC_MEMBER(MID) ON DELETE CASCADE,	-- 참조인
    DISCOUNT NUMBER(2) NOT NULL												-- 할인율
);

CREATE SEQUENCE SEQ_CNO;

DROP TABLE MC_COUPON;

DROP SEQUENCE SEQ_CNO;