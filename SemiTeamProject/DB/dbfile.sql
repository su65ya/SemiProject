------------------------------------------------
-- 관리자 테이블 --
------------------------------------------------

CREATE TABLE admin(
admin_no number	PRIMARY KEY,
admin_id varchar2(20) NOT NULL UNIQUE,
admin_pw varchar2(20) NOT NULL,
admin_phone	char(11) NOT NULL,
admin_mail varchar2(50)	NOT NULL,
admin_birth	DATE NOT NULL
);

CREATE SEQUENCE admin_seq nocache;

--------------------------------------------------------------------------
-- 판매자 테이블 --
--------------------------------------------------------------------------
CREATE TABLE seller(
seller_no NUMBER PRIMARY KEY,
seller_id varchar2(20) NOT NULL UNIQUE,
seller_pw varchar2(20) NOT NULL,
seller_name varchar2(21) NOT NULL,
seller_birth DATE NOT NULL,
seller_phone char(11) NOT NULL,
seller_email varchar2(50) NOT NULL,
seller_post char(11),
seller_basic_addr varchar2(300),
seller_detail_addr varchar2(300),
seller_join DATE DEFAULT sysdate NOT NULL,
company_no char(10) NOT NULL
);

CREATE SEQUENCE seller_seq nocache;

-----------------------------------------------------
-- 사용자 --
-----------------------------------------------------
CREATE TABLE member (
   member_no NUMBER PRIMARY KEY,
   member_id varchar2(20) NOT NULL UNIQUE,
   member_pw varchar2(20) NOT NULL,
   member_name varchar2(21) NOT NULL,
   member_birth DATE NOT NULL,
   member_mail varchar2(50) NOT NULL,
   member_post char(6),
   member_basic_addr varchar2(300),
   member_detail_addr varchar2(300),
   member_phone char(11) NOT NULL,
   member_rate varchar2(6) NOT NULL CHECK (member_rate IN ('일반', '우수', 'VIP')),
   member_join DATE DEFAULT sysdate NOT NULL
);

CREATE SEQUENCE member_seq nocache;

----------------------------------------------------
-- 펜션등록 --
----------------------------------------------------
CREATE TABLE pension(
pension_no NUMBER PRIMARY KEY,
pension_seller_no NOT NULL references seller(seller_no) ON DELETE CASCADE,
pension_name VARCHAR2(50) NOT NULL,
pension_post CHAR(6) NOT NULL,
pension_basic_addr VARCHAR2(300) NOT NULL,
pension_detail_addr   VARCHAR2(300) NOT NULL,
pension_regist_date   DATE DEFAULT sysdate NOT NULL,
pension_phone CHAR(11) NOT NULL
);

CREATE SEQUENCE pension_seq nocache;
----------------------------------------------------------
-- 펜션 사진 --
----------------------------------------------------------
CREATE TABLE pension_image(
pen_image_no NUMBER PRIMARY KEY,
pen_image_pen_no  NOT NULL references pension(pension_no) ON DELETE CASCADE,
pen_image_name VARCHAR2(256) NOT NULL, 
pen_image_size NUMBER NOT NULL check(pen_image_size > 0 ),
pen_image_type CHAR(10)   NOT NULL
);

CREATE SEQUENCE pen_img_seq nocache;

----------------------------------------------------------
--객실등록 테이블--
----------------------------------------------------------
CREATE TABLE room (
room_no NUMBER PRIMARY KEY,
room_pension_no  NOT NULL REFERENCES pension(pension_no) ON DELETE CASCADE,
room_name VARCHAR2(60) NOT NULL,
room_type VARCHAR2(30),--10글자 이내
standard_people NUMBER NOT NULL,
max_people NUMBER NOT NULL,
room_width NUMBER NOT NULL,
toilet_count NUMBER NOT NULL,
off_weekday NUMBER NOT NULL,
off_weekend NUMBER NOT NULL,
on_weekday NUMBER NOT NULL,
on_weekend NUMBER NOT NULL,
amenity number NOT NULL,
microwave NUMBER NOT NULL,
bed NUMBER  NOT NULL,
tv NUMBER  NOT NULL,
room_sofa NUMBER  NOT NULL,
room_aircon NUMBER  NOT NULL,
fridge NUMBER  NOT NULL,
tub NUMBER  NOT NULL,
hairdryer NUMBER  NOT NULL,
cookoo  NUMBER NOT NULL,
dog NUMBER  NOT NULL
);

CREATE SEQUENCE room_seq nocache;

----------------------------------------------------------
--객실사진 테이블--
----------------------------------------------------------
CREATE TABLE room_image (
room_image_no NUMBER PRIMARY KEY, 
room_image_room_no  NOT NULL REFERENCES room(room_no) ON DELETE CASCADE,
room_image_name VARCHAR2(256) NOT NULL,
room_image_size NUMBER NOT NULL CHECK(room_image_size > 0),
room_image_type CHAR(10)
);

CREATE SEQUENCE room_image_seq nocache;

----------------------------------------------------------
--예약--
----------------------------------------------------------
CREATE TABLE reservation(
res_no NUMBER PRIMARY KEY,
res_write REFERENCES member(member_no)ON DELETE SET NULL,
res_room_no REFERENCES room(room_no)ON DELETE CASCADE,
res_name VARCHAR2(21),
res_date DATE NOT NULL,
res_in DATE NOT NULL,
res_out DATE NOT NULL,
res_paytype VARCHAR2(30) NOT NULL check(res_paytype IN('카카오페이','네이버페이','계좌이체')),
res_price NUMBER NOT NULL
);

CREATE SEQUENCE res_seq nocache;

----------------------------------------------------------
--리뷰--
----------------------------------------------------------
 CREATE TABLE review( 
 review_no NUMBER PRIMARY KEY, 
 review_writer REFERENCES MEMBER(member_no) ON DELETE SET NULL, 
 review_pension_no NOT NULL REFERENCES pension(pension_no) ON DELETE CASCADE, 
 review_res_no REFERENCES reservation(res_no) ON DELETE SET NULL, 
 review_title varchar2(300) NOT NULL,
 review_content varchar2(4000) NOT NULL, 
 review_date DATE DEFAULT sysdate NOT NULL, 
 review_count NUMBER DEFAULT 0 NOT NULL 
);

CREATE SEQUENCE review_seq nocache;


----------------------------------------------------------
--팬션옵션--
----------------------------------------------------------
CREATE TABLE pension_option (
option_no NUMBER PRIMARY KEY,
pension_key NOT NULL REFERENCES pension (pension_no) ON DELETE CASCADE,
option_name varchar2(100) NOT NULL,
option_price NUMBER NOT NULL,
option_select NUMBER(1) NOT NULL
);

CREATE SEQUENCE pension_option_seq nocache;

----------------------------------------------------------
--댓글 테이블--
----------------------------------------------------------
CREATE TABLE review_reply(
	reply_no NUMBER PRIMARY KEY,
	reply_writer REFERENCES member(member_no) ON DELETE SET null,
	reply_origin NOT NULL REFERENCES review(review_no) ON DELETE CASCADE,--리뷰번호
	reply_content varchar2(4000) NOT NULL,
	reply_date DATE DEFAULT sysdate NOT NULL
);

CREATE SEQUENCE review_reply_seq nocache;

-------------------------------------------------------------------------------------
-- 문의 --
-------------------------------------------------------------------------------------

CREATE TABLE question (
   que_no NUMBER PRIMARY KEY,
   que_head varchar2(15) CHECK (que_head IN ('예약', '예약취소', '예약변경', '기타')),
   que_title varchar2(300) NOT NULL,
   que_content varchar2(4000) NOT NULL,
   que_date DATE DEFAULT sysdate NOT NULL,
   que_reply NUMBER(1) DEFAULT 0 NOT NULL,--답변유무
   que_view NUMBER DEFAULT 0 NOT NULL,
   group_no NUMBER NOT NULL,
   super_no REFERENCES question(que_no) ON DELETE CASCADE, -- 상위글
   depth NUMBER DEFAULT 0 NOT NULL,--차수
   que_write REFERENCES member(member_no) ON DELETE SET NULL--작성자
);

CREATE SEQUENCE que_seq nocache;

-------------------------------------------------------------------------------------
-- 첨부파일 
-------------------------------------------------------------------------------------
CREATE TABLE review_file (
review_file_no NUMBER PRIMARY KEY,
review_origin REFERENCES review (review_no) ON DELETE CASCADE,
review_file_name VARCHAR2(256) NOT NULL,
review_file_size NUMBER NOT NULL CHECK(review_file_size > 0),
review_file_type CHAR(10) NOT NULL
);

CREATE SEQUENCE review_file_seq nocache;

-------------------------------------------------------
--환불--
-------------------------------------------------------
CREATE TABLE refund(
refund_no NUMBER PRIMARY KEY,
refund_res_no REFERENCES reservation(res_no)ON DELETE CASCADE,
refund_member_no NUMBER REFERENCES member(member_no)ON DELETE CASCADE,
refund_price NUMBER NOT NULL,
refund_type varchar2(30)
);
CREATE SEQUENCE refund_seq nocache;
