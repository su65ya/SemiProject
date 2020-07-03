--객실등록 테이블--
CREATE TABLE room (
room_no NUMBER PRIMARY KEY,
room_pension_no REFERENCES pension(pension_no) ON DELETE CASCADE,
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

--객실사진 테이블--
CREATE TABLE room_image (
room_image_no NUMBER PRIMARY KEY, 
room_image_room_no REFERENCES room(room_no) ON DELETE CASCADE,
room_image_name VARCHAR2(256) NOT NULL,
room_image_size NUMBER NOT NULL CHECK(room_image_size > 0),
room_image_type CHAR(10),
);
CREATE SEQUENCE room_image_seq nocache;

