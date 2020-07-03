-------------------------------------------------------------------------------------
-- 사용자 --
-------------------------------------------------------------------------------------
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