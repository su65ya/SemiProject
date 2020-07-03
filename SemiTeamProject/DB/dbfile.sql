CREATE TABLE review(
	review_no NUMBER NOT NULL,
	review_writer REFERENCES member(member_no) ON DELETE SET NULL,
	review_pension_no REFERENCES pension(pension_no) ON DELETE CASCADE NOT NULL,
	review_res_no REFERENCES reservation(res_no) ON DELETE SET NULL,
	review_content varchar2(4000) NOT NULL,
	review_title varchar2(300) NOT NULL,
	review_date DATE DEFAULT sysdate NOT NULL,
	review_count NUMBER DEFAULT 0 NOT NULL
);

CREATE SEQUENCE review_seq nocache;