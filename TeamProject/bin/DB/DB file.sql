
-------------------
--
-예약
--
-------------------


CREATE TABLE reservation(
res_no NUMBER PRIMARY KEY,
res_write REFERENCES member(member_no)ON DELETE SET NULL,
res_rno REFERENCES room(room_no)ON DELETE SET NULL,
res_name varchar2(21),
res_date DATE DEFAULT 0 NOT NULL,
res_cancel DATE DEFAULT 0 NOT NULL,
res_in DATE DEFAULT 0 NOT NULL,
res_out DATE DEFAULT 0 NOT NULL,
res_paytype vachar2(30) NOT NULL check(res_paytype IN('카카오페이','네이버페이','계좌이체')),
res_price NUMBER NOT NULL,
);

CREATE SEQUENCE res_seq nocache;


