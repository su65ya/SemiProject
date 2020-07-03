--팬션옵션
CREATE TABLE pension_option (
pension_no NUMBER PRIMARY KEY,
pension_key NUMBER REFERENCES pension (pension_no) ON DELETE CASCADE,
option_name varchar2(100) NOT NULL,
option_price NUMBER NOT NULL,
);
CREATE SEQUENCE member_seq nocache;