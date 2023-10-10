-------------------------------------------------------------------
---------------------------TABLE-----------------------------------
DROP TABLE notice_reply;
DROP TABLE review_reply;
DROP TABLE notice;
DROP TABLE reply;
DROP TABLE inquiry;
DROP TABLE review;
DROP TABLE cart;
DROP TABLE order_confirm;
DROP TABLE order_cancel;
DROP TABLE member_charge;
DROP TABLE order_list;
DROP TABLE product;
DROP TABLE product_detail;
DROP TABLE img_file;
DROP TABLE pet;
DROP TABLE member;

CREATE TABLE member (
   member_no   number   NOT NULL,
   member_id   varchar2(30)   NOT NULL,
   member_password   varchar2(100)   NOT NULL,
   member_name   varchar2(100)   NOT NULL,
    member_nickname varchar2(100) NOT NULL,
   member_birth_date   date   NOT NULL,
   member_phone   varchar2(15)   NOT NULL,
   member_email   varchar2(100)   NOT NULL,
   member_address   varchar2(500)   NOT NULL,
   member_join_date   date   default sysdate NOT NULL,
   member_emoney   number   default 0 NOT NULL,
   member_point   number   default 0NOT NULL,
   member_mod_date   date   default sysdate NOT NULL
);

CREATE TABLE pet (
   pet_no   number   NOT NULL,
   member_no   number   NOT NULL,
   pet_name   varchar2(100)   NOT NULL,
    pet_breed varchar2(100) NOT NULL,
    pet_gender char NOT NULL,
   pet_weight   number(3,1)   NOT NULL,
   pet_adoption_date   date   NOT NULL,
   pet_vaccination   varchar2(100)   NOT NULL,
   pet_vaccination_date   date   NULL
);

CREATE TABLE product (
   product_no   number   NOT NULL,
   product_detail_no   number   NOT NULL,
   img_no   number   NOT NULL,
   product_name   varchar2(100)   NOT NULL,
   product_price   number   NOT NULL,
   product_stock   number   NOT NULL,
   product_category   varchar2(100)   NOT NULL,
   product_cre_date   date   default sysdate NOT NULL,
   product_mod_date   date   default sysdate NOT NULL
);

CREATE TABLE product_detail (
   product_detail_no   number   NOT NULL,
   img_no   number,
   product_detail_content   varchar2(3000)   NOT NULL
);

CREATE TABLE review (
   review_no   number   NOT NULL,
   member_no   number   NOT NULL,
   product_no   number   NOT NULL,
   review_title   varchar2(100)   NOT NULL,
   review_content   varchar2(3000)   NOT NULL,
   review_cre_date   date   default sysdate NOT NULL,
   review_mod_date   date   default sysdate NOT NULL
);

CREATE TABLE review_reply (
   review_reply_no   number   NOT NULL,
   member_no   number   NOT NULL,
   review_no   number   NOT NULL,
   review_reply_content   varchar2(300)   NOT NULL,
   review_reply_cre_date   date   default sysdate NOT NULL
);

CREATE TABLE order_list (
   order_no   number   NOT NULL,
   member_no   number   NOT NULL,
    product_no number NOT NULL,
   order_date   date   default sysdate NOT NULL,
   order_request   varchar2(300),
   order_status   varchar2(20)   NOT NULL,
   product_quantity   number   NOT NULL
);

CREATE TABLE order_confirm (
   order_no   number   NOT NULL,
   order_confirm_date   date   default sysdate NOT NULL
);

CREATE TABLE order_cancel (
   order_no   number   NOT NULL,
   order_cancel_date   date   default sysdate NOT NULL
);

CREATE TABLE member_charge (
   member_charge_no   number   NOT NULL,
   member_no   number   NOT NULL,
   member_charge_amount   number   NOT NULL,
   member_charge_date   date   default sysdate NOT NULL
);

CREATE TABLE inquiry (
   inquiry_no   number   NOT NULL,
   member_no   number   NOT NULL,
   inquiry_type   varchar2(30)   NOT NULL,
   member_name   varchar2(100)   NOT NULL,
   inquiry_cre_date   date   default sysdate NOT NULL,
   inquiry_title   varchar2(100)   NOT NULL,
   inquiry_content   varchar2(3000)   NOT NULL,
   inquiry_is_reply   char   NOT NULL
);

CREATE TABLE reply (
   inquiry_no   number   NOT NULL,
   member_no   number   NOT NULL,
   reply_cre_date   date   default sysdate NOT NULL,
   reply_member_name   varchar2(100)   NOT NULL,
   reply_title   varchar2(100)   NOT NULL,
   reply_content   varchar2(3000)   NOT NULL
);

CREATE TABLE notice (
   notice_no   number   NOT NULL,
   member_no   number   NOT NULL,
   notice_title   varchar2(100)   NOT NULL,
   notice_content   varchar2(100)   NOT NULL,
   notice_cre_date   date   default sysdate NOT NULL
);

CREATE TABLE notice_reply (
   notice_reply_no   number   NOT NULL,
   member_no   number   NOT NULL,
   notice_no   number   NOT NULL,
   notice_reply_content   varchar2(300)   NOT NULL,
   notice_reply_cre_date   date   default sysdate NOT NULL
);

CREATE TABLE cart (
   product_no   number   NOT NULL,
   member_no   number   NOT NULL,
   product_name   varchar2(100)   NOT NULL,
   product_price   number   NOT NULL,
   product_quantity   number   NOT NULL
);

CREATE TABLE img_file (
   img_no   number   NOT NULL,
   original_file_name   varchar2(260 byte)   NOT NULL,
   stored_file_name   varchar2(36 byte)   NOT NULL,
   file_size   number   NOT NULL,
   img_cre_date   date   NOT NULL
);

ALTER TABLE member ADD CONSTRAINT PK_MEMBER PRIMARY KEY (
   member_no
   
);

ALTER TABLE pet ADD CONSTRAINT PK_PET PRIMARY KEY (
   pet_no
);

ALTER TABLE product ADD CONSTRAINT PK_PRODUCT PRIMARY KEY (
   product_no
);

ALTER TABLE product_detail ADD CONSTRAINT PK_PRODUCT_DETAIL PRIMARY KEY (
   product_detail_no
);

ALTER TABLE review ADD CONSTRAINT PK_REVIEW PRIMARY KEY (
   review_no
);

ALTER TABLE order_list ADD CONSTRAINT PK_order_list PRIMARY KEY (
   order_no
);

ALTER TABLE member_charge ADD CONSTRAINT PK_MEMBER_CHARGE PRIMARY KEY (
   member_charge_no
);

ALTER TABLE inquiry ADD CONSTRAINT PK_INQUIRY PRIMARY KEY (
   inquiry_no
);

ALTER TABLE notice ADD CONSTRAINT PK_NOTICE PRIMARY KEY (
   notice_no
);

ALTER TABLE img_file ADD CONSTRAINT PK_IMG_FILE PRIMARY KEY (
   img_no
);

ALTER TABLE cart ADD CONSTRAINT PK_cart_member_no_product_no PRIMARY KEY (
   member_no, product_no
);

ALTER TABLE member ADD CONSTRAINTS UK_member_id UNIQUE (
    member_id
);

ALTER TABLE pet ADD CONSTRAINT FK_member_no FOREIGN KEY (
   member_no
)
REFERENCES member (
   member_no
)ON DELETE CASCADE;

ALTER TABLE product ADD CONSTRAINT FK_product_detail_no FOREIGN KEY (
   product_detail_no
)
REFERENCES product_detail (
   product_detail_no
)ON DELETE CASCADE;

ALTER TABLE product ADD CONSTRAINT FK_product_img_no FOREIGN KEY (
   img_no
)
REFERENCES img_file (
   img_no
)ON DELETE CASCADE;

ALTER TABLE product_detail ADD CONSTRAINT FK_product_detail_img_no FOREIGN KEY (
   img_no
)
REFERENCES img_file (
   img_no
)ON DELETE CASCADE;

ALTER TABLE review ADD CONSTRAINT FK_review_member_no FOREIGN KEY (
   member_no
)
REFERENCES member (
   member_no
)ON DELETE CASCADE;

ALTER TABLE review ADD CONSTRAINT FK_review_product_no FOREIGN KEY (
   product_no
)
REFERENCES product (
   product_no
)ON DELETE CASCADE;

ALTER TABLE order_list ADD CONSTRAINT FK_order_list_member_no FOREIGN KEY (
   member_no
)
REFERENCES member (
   member_no
)ON DELETE CASCADE;

ALTER TABLE order_list ADD CONSTRAINT FK_order_list_product_no FOREIGN KEY (
   product_no
)
REFERENCES product (
   product_no
)ON DELETE CASCADE;

ALTER TABLE order_confirm ADD CONSTRAINT FK_order_confirm_order_no FOREIGN KEY (
   order_no
)
REFERENCES order_list (
   order_no
)ON DELETE CASCADE;

ALTER TABLE order_cancel ADD CONSTRAINT FK_order_cancel_order_no FOREIGN KEY (
   order_no
)
REFERENCES order_list (
   order_no
)ON DELETE CASCADE;

ALTER TABLE member_charge ADD CONSTRAINT FK_member_charge_member_no FOREIGN KEY (
   member_no
)
REFERENCES member (
   member_no
)ON DELETE CASCADE;

ALTER TABLE inquiry ADD CONSTRAINT FK_inquiry_member_no FOREIGN KEY (
   member_no
)
REFERENCES member (
   member_no
)ON DELETE CASCADE;

ALTER TABLE reply ADD CONSTRAINT FK_reply_inquiry_no FOREIGN KEY (
   inquiry_no
)
REFERENCES inquiry (
   inquiry_no
)ON DELETE CASCADE;

ALTER TABLE reply ADD CONSTRAINT FK_reply_member_no FOREIGN KEY (
   member_no
)
REFERENCES member (
   member_no
)ON DELETE CASCADE;

ALTER TABLE notice ADD CONSTRAINT FK_notice_member_no FOREIGN KEY (
   member_no
)
REFERENCES member (
   member_no
)ON DELETE CASCADE;

ALTER TABLE cart ADD CONSTRAINT FK_cart_product_no FOREIGN KEY (
   product_no
)
REFERENCES product (
   product_no
)ON DELETE CASCADE;

ALTER TABLE cart ADD CONSTRAINT FK_cart_member_no FOREIGN KEY (
   member_no
)
REFERENCES member (
   member_no
)ON DELETE CASCADE;

ALTER TABLE product
ADD CONSTRAINT CHK_product_category CHECK (product_category = '10' OR
                                            product_category = '20' OR
                                            product_category = '30' OR
                                            product_category = '40' OR
                                            product_category = '50' OR
                                            product_category = '60');

ALTER TABLE pet
ADD CONSTRAINT CHK_pet_vaccination CHECK (pet_vaccination = '미정' OR
                                            pet_vaccination = '1차' OR
                                            pet_vaccination = '2차' OR
                                            pet_vaccination = '3차' OR
                                            pet_vaccination = '4차' OR
                                            pet_vaccination = '5차' OR
                                            pet_vaccination = '6차');

ALTER TABLE order_list
ADD CONSTRAINT CHK_order_status CHECK (order_status = '미확정' OR
                                            order_status = '확정' OR
                                            order_status = '취소');

ALTER TABLE inquiry
ADD CONSTRAINT CHK_inquiry_is_reply CHECK (inquiry_is_reply = 'Y' OR
                                            inquiry_is_reply = 'N');
                           
ALTER TABLE pet
ADD CONSTRAINT CHK_pet_gender CHECK (pet_gender = 'M' OR
                                        pet_gender = 'W');
                                            
-------------------------------------------------------------------
---------------------------SEQUENCE--------------------------------
drop sequence inquiry_no_seq;
drop sequence notice_no_seq;
drop sequence pet_no_seq;
drop sequence member_no_seq;
drop sequence member_charge_no_seq;
drop sequence product_detail_no_seq;
drop sequence product_no_seq;
drop sequence review_no_seq;
drop sequence order_no_seq;
drop sequence img_no_seq;
drop sequence notice_reply_no_seq;
drop sequence review_reply_no_seq;

create sequence notice_reply_no_seq
start with 1
increment by 1;

create sequence review_reply_no_seq
start with 1
increment by 1;

create sequence inquiry_no_seq
start with 1
increment by 1;

create sequence notice_no_seq
start with 1
increment by 1;

create sequence pet_no_seq
start with 1
increment by 1;

create sequence member_no_seq
start with 1
increment by 1;

create sequence member_charge_no_seq
start with 1
increment by 1;

create sequence product_detail_no_seq
start with 1
increment by 1;

create sequence product_no_seq
start with 1
increment by 1;

create sequence review_no_seq
start with 1
increment by 1;

create sequence order_no_seq
start with 1
increment by 1;

create sequence img_no_seq
start with 1
increment by 1;


--------------------INSERT----------------------------
------------------------------------------------------
--member

insert into member
(MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NAME, MEMBER_NICKNAME,
    MEMBER_BIRTH_DATE, MEMBER_PHONE, MEMBER_EMAIL, MEMBER_ADDRESS,
    MEMBER_JOIN_DATE, MEMBER_EMONEY, MEMBER_POINT, MEMBER_MOD_DATE)
VALUES(member_no_seq.nextval, 'admin', '1234', '관리자', '관리자',
    sysdate, '01012345678', 'admin@daeng.com', '강남',
    sysdate, 1000000, 1000000, sysdate);

insert into member
(MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NAME, MEMBER_NICKNAME,
    MEMBER_BIRTH_DATE, MEMBER_PHONE, MEMBER_EMAIL, MEMBER_ADDRESS,
    MEMBER_JOIN_DATE, MEMBER_EMONEY, MEMBER_POINT, MEMBER_MOD_DATE)
VALUES(member_no_seq.nextval, 'qwer', '1234', '자르반', '자르반4세',
    sysdate, '01041231241', 'jar@naver.com', '강남',
    sysdate, 0, 0, sysdate);

insert into member
(MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NAME, MEMBER_NICKNAME,
    MEMBER_BIRTH_DATE, MEMBER_PHONE, MEMBER_EMAIL, MEMBER_ADDRESS,
    MEMBER_JOIN_DATE, MEMBER_EMONEY, MEMBER_POINT, MEMBER_MOD_DATE)
VALUES(member_no_seq.nextval, 'qe123', 'eqwe12', '한정민', '댕댕이',
    sysdate, '01041426485', 'aasd@naver.com', '분당',
    sysdate, 0, 0, sysdate);

insert into member
(MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NAME, MEMBER_NICKNAME,
    MEMBER_BIRTH_DATE, MEMBER_PHONE, MEMBER_EMAIL, MEMBER_ADDRESS,
    MEMBER_JOIN_DATE, MEMBER_EMONEY, MEMBER_POINT, MEMBER_MOD_DATE)
VALUES(member_no_seq.nextval, 'rq52124', '1234', '아현아', '제주민',
    sysdate, '01062363523', 'swqwe@asdsa.com', '서울',
    sysdate, 0, 0, sysdate);

insert into member
(MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NAME, MEMBER_NICKNAME,
    MEMBER_BIRTH_DATE, MEMBER_PHONE, MEMBER_EMAIL, MEMBER_ADDRESS,
    MEMBER_JOIN_DATE, MEMBER_EMONEY, MEMBER_POINT, MEMBER_MOD_DATE)
VALUES(member_no_seq.nextval, 'eqwe1512', '1234', '김미현', 'ch4123',
    sysdate, '01073487474', 'asdsa@naver.com', '노르웨이',
    sysdate, 0, 0, sysdate);

insert into member
(MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NAME, MEMBER_NICKNAME,
    MEMBER_BIRTH_DATE, MEMBER_PHONE, MEMBER_EMAIL, MEMBER_ADDRESS,
    MEMBER_JOIN_DATE, MEMBER_EMONEY, MEMBER_POINT, MEMBER_MOD_DATE)
VALUES(member_no_seq.nextval, 'eqwe114', '1234', '박태환', 'ch4123',
    sysdate, '01073487474', 'asdsa@naver.com', '노르웨이',
    sysdate, 0, 0, sysdate);

insert into member
(MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NAME, MEMBER_NICKNAME,
    MEMBER_BIRTH_DATE, MEMBER_PHONE, MEMBER_EMAIL, MEMBER_ADDRESS,
    MEMBER_JOIN_DATE, MEMBER_EMONEY, MEMBER_POINT, MEMBER_MOD_DATE)
VALUES(member_no_seq.nextval, 'ndoge', '1234', '박지운', '갈대밭',
    '1998-04-03', '01041521241', 'jar1@naver.com', '강남구어디',
    '2005-04-03', 0, 0, sysdate);
--7
insert into member
(MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NAME, MEMBER_NICKNAME,
    MEMBER_BIRTH_DATE, MEMBER_PHONE, MEMBER_EMAIL, MEMBER_ADDRESS,
    MEMBER_JOIN_DATE, MEMBER_EMONEY, MEMBER_POINT, MEMBER_MOD_DATE)
VALUES(member_no_seq.nextval, 'doged2', 'eqwe12', '임영빈', '댕댕2',
    '1999-12-03', '01041426785', 'aasd12@naver.com', '천당밑분당',
    '2006-05-03', 0, 0, sysdate);
--8
insert into member
(MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NAME, MEMBER_NICKNAME,
    MEMBER_BIRTH_DATE, MEMBER_PHONE, MEMBER_EMAIL, MEMBER_ADDRESS,
    MEMBER_JOIN_DATE, MEMBER_EMONEY, MEMBER_POINT, MEMBER_MOD_DATE)
VALUES(member_no_seq.nextval, 'threedog', '1234', '손진온', '제주살이',
    '1996-05-23', '01062898523', 'swqweqe@asdsa.com', '서울마포구',
    '2007-06-03', 0, 0, sysdate);
--9
insert into member
(MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NAME, MEMBER_NICKNAME,
    MEMBER_BIRTH_DATE, MEMBER_PHONE, MEMBER_EMAIL, MEMBER_ADDRESS,
    MEMBER_JOIN_DATE, MEMBER_EMONEY, MEMBER_POINT, MEMBER_MOD_DATE)
VALUES(member_no_seq.nextval, 'puppy2', '1234', '이찬우', 'justdoit',
    '1989-02-03', '01089997474', 'asdsa@naver.com', '서울도봉구',
    '2008-07-03', 0, 0, sysdate);
--10    
insert into member
(MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NAME, MEMBER_NICKNAME,
    MEMBER_BIRTH_DATE, MEMBER_PHONE, MEMBER_EMAIL, MEMBER_ADDRESS,
    MEMBER_JOIN_DATE, MEMBER_EMONEY, MEMBER_POINT, MEMBER_MOD_DATE)
VALUES(member_no_seq.nextval, 'jinwon', '1234', '이르다', '감좋다',
    '1991-03-23', '01002051241', 'jarlekj@naver.com', '강남구청역',
    '2009-04-03', 0, 0, sysdate);
--11
insert into member
(MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NAME, MEMBER_NICKNAME,
    MEMBER_BIRTH_DATE, MEMBER_PHONE, MEMBER_EMAIL, MEMBER_ADDRESS,
    MEMBER_JOIN_DATE, MEMBER_EMONEY, MEMBER_POINT, MEMBER_MOD_DATE)
VALUES(member_no_seq.nextval, 'freedom2', 'eqwe12', '김정빈', '아시르',
    '1983-01-03', '01064856485', 'sksmsehlsek@naver.com', '서울시서초구',
    '2010-04-03', 0, 0, sysdate);
--12
insert into member
(MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NAME, MEMBER_NICKNAME,
    MEMBER_BIRTH_DATE, MEMBER_PHONE, MEMBER_EMAIL, MEMBER_ADDRESS,
    MEMBER_JOIN_DATE, MEMBER_EMONEY, MEMBER_POINT, MEMBER_MOD_DATE)
VALUES(member_no_seq.nextval, 'bts3801', '1234', '손신원', '타향살이',
    '1985-07-03', '01078529865', 'whdgkqqptmxm@asdsa.com', '서울가양구',
    '2011-04-03', 0, 0, sysdate);
--13
insert into member
(MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NAME, MEMBER_NICKNAME,
    MEMBER_BIRTH_DATE, MEMBER_PHONE, MEMBER_EMAIL, MEMBER_ADDRESS,
    MEMBER_JOIN_DATE, MEMBER_EMONEY, MEMBER_POINT, MEMBER_MOD_DATE)
VALUES(member_no_seq.nextval, 'newwave', '1234', '온찬우', 'chll23',
    '1979-09-25', '01073023156', 'qptmxmtpffj@naver.com', '서울노원구',
    '2012-04-03', 0, 0, sysdate);
--14
insert into member
(MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NAME, MEMBER_NICKNAME,
    MEMBER_BIRTH_DATE, MEMBER_PHONE, MEMBER_EMAIL, MEMBER_ADDRESS,
    MEMBER_JOIN_DATE, MEMBER_EMONEY, MEMBER_POINT, MEMBER_MOD_DATE)
VALUES(member_no_seq.nextval, 'hotdog', '1234', '박미성', '23세일',
    '1994-02-03', '01068675254', 'dlfdnlwkrrk@naver.com', '서울광진구',
    '2013-04-03', 0, 0, sysdate);
--15
insert into member
(MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NAME, MEMBER_NICKNAME,
    MEMBER_BIRTH_DATE, MEMBER_PHONE, MEMBER_EMAIL, MEMBER_ADDRESS,
    MEMBER_JOIN_DATE, MEMBER_EMONEY, MEMBER_POINT, MEMBER_MOD_DATE)
VALUES(member_no_seq.nextval, 'tringle', 'eqwe12', '임정민', '집사란',
    '1979-04-13', '01041942485', 'wkrrkdbgywns@naver.com', '서울금천구',
    '2014-04-03', 0, 0, sysdate);
--16
insert into member
(MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NAME, MEMBER_NICKNAME,
    MEMBER_BIRTH_DATE, MEMBER_PHONE, MEMBER_EMAIL, MEMBER_ADDRESS,
    MEMBER_JOIN_DATE, MEMBER_EMONEY, MEMBER_POINT, MEMBER_MOD_DATE)
VALUES(member_no_seq.nextval, 'somedog', '1234', '김양원', '성실',
    '1999-11-03', '01062366266', 'dlfdnlwkrrk@asdsa.com', '서울강서구',
    '2015-04-03', 0, 0, sysdate);
--17
insert into member
(MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NAME, MEMBER_NICKNAME,
    MEMBER_BIRTH_DATE, MEMBER_PHONE, MEMBER_EMAIL, MEMBER_ADDRESS,
    MEMBER_JOIN_DATE, MEMBER_EMONEY, MEMBER_POINT, MEMBER_MOD_DATE)
VALUES(member_no_seq.nextval, 'elfman', '1234', '김세윤', '잘한다',
    '1999-12-23', '01088287474', 'skrhark@naver.com', '서울강동구 ',
    '2016-04-03', 0, 0, sysdate);
--18 
insert into member
(MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NAME, MEMBER_NICKNAME,
    MEMBER_BIRTH_DATE, MEMBER_PHONE, MEMBER_EMAIL, MEMBER_ADDRESS,
    MEMBER_JOIN_DATE, MEMBER_EMONEY, MEMBER_POINT, MEMBER_MOD_DATE)
VALUES(member_no_seq.nextval, 'fantasy', '1234', '김희도', '감각',
    '1992-08-13', '01041236643', 'cjswowkrrkdb@naver.com', '서울노원구',
    '2017-04-03', 0, 0, sysdate);
--19
insert into member
(MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NAME, MEMBER_NICKNAME,
    MEMBER_BIRTH_DATE, MEMBER_PHONE, MEMBER_EMAIL, MEMBER_ADDRESS,
    MEMBER_JOIN_DATE, MEMBER_EMONEY, MEMBER_POINT, MEMBER_MOD_DATE)
VALUES(member_no_seq.nextval, 'gotaDog', 'eqwe12', '김태구', '빠르다',
    '1973-01-23', '01041425535', 'skcjswo@naver.com', '서울양천구',
    '2018-04-03', 0, 0, sysdate);
--20
insert into member
(MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NAME, MEMBER_NICKNAME,
    MEMBER_BIRTH_DATE, MEMBER_PHONE, MEMBER_EMAIL, MEMBER_ADDRESS,
    MEMBER_JOIN_DATE, MEMBER_EMONEY, MEMBER_POINT, MEMBER_MOD_DATE)
VALUES(member_no_seq.nextval, 'doWhile', '1234', '송하위', '어쩌다가',
    '1978-09-15', '01013467985', 'sowlqdydtks@asdsa.com', '서울용산구',
    '2019-04-03', 0, 0, sysdate);
--21    
insert into member
(MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NAME, MEMBER_NICKNAME,
    MEMBER_BIRTH_DATE, MEMBER_PHONE, MEMBER_EMAIL, MEMBER_ADDRESS,
    MEMBER_JOIN_DATE, MEMBER_EMONEY, MEMBER_POINT, MEMBER_MOD_DATE)
VALUES(member_no_seq.nextval, 'APIjava', '1234', '감이안', '어쩌다가',
    '1998-09-05', '01013277985', 'socjswoks@asdsa.com', '서울용산구',
    '2020-04-03', 0, 0, sysdate);
--22
insert into member
(MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NAME, MEMBER_NICKNAME,
    MEMBER_BIRTH_DATE, MEMBER_PHONE, MEMBER_EMAIL, MEMBER_ADDRESS,
    MEMBER_JOIN_DATE, MEMBER_EMONEY, MEMBER_POINT, MEMBER_MOD_DATE)
VALUES(member_no_seq.nextval, 'comment', '1234', '김형수', '어쩌다가',
    '1988-02-05', '01016277985', 'socwoks@asGdsa.com', '서울용산구',
    '2021-04-03', 0, 0, sysdate);

-------------------------------------------------------------------
--pet

insert into pet
(PET_NO, MEMBER_NO, PET_NAME, PET_BREED, PET_GENDER, PET_WEIGHT,
    PET_ADOPTION_DATE, PET_VACCINATION, PET_VACCINATION_DATE)
VALUES(pet_no_seq.nextval, 1, '별이', '포메라니안', 'M', 3,
    '2020-04-12', '미정', '');
    
insert into pet
(PET_NO, MEMBER_NO, PET_NAME, PET_BREED, PET_GENDER, PET_WEIGHT,
    PET_ADOPTION_DATE, PET_VACCINATION, PET_VACCINATION_DATE)
VALUES(pet_no_seq.nextval, 2, '바둑이', '포메라니안', 'M', 3,
    '2020-04-12', '미정', '');

insert into pet
(PET_NO, MEMBER_NO, PET_NAME, PET_BREED, PET_GENDER, PET_WEIGHT,
    PET_ADOPTION_DATE, PET_VACCINATION, PET_VACCINATION_DATE)
VALUES(pet_no_seq.nextval, 3, '나르', '치와와', 'M', 4,
    '2017-03-15', '1차', '2020-03-03');

insert into pet
(PET_NO, MEMBER_NO, PET_NAME, PET_BREED, PET_GENDER, PET_WEIGHT,
    PET_ADOPTION_DATE, PET_VACCINATION, PET_VACCINATION_DATE)
VALUES(pet_no_seq.nextval, 4, '초코', '말티즈', 'W', 3,
    '2020-04-12', '3차', '2023-01-14');

insert into pet
(PET_NO, MEMBER_NO, PET_NAME, PET_BREED, PET_GENDER, PET_WEIGHT,
    PET_ADOPTION_DATE, PET_VACCINATION, PET_VACCINATION_DATE)
VALUES(pet_no_seq.nextval, 5, '멘토스', '세퍼드', 'W', 11,
    '2019-04-12', '6차', '2023-07-14');

insert into pet
(PET_NO, MEMBER_NO, PET_NAME, PET_BREED, PET_GENDER, PET_WEIGHT,
    PET_ADOPTION_DATE, PET_VACCINATION, PET_VACCINATION_DATE)
VALUES(pet_no_seq.nextval, 6, '솜이', '푸들', 'M', 3,
    '2005-01-03', '5차', '2005-06-03');

insert into pet
(PET_NO, MEMBER_NO, PET_NAME, PET_BREED, PET_GENDER, PET_WEIGHT,
    PET_ADOPTION_DATE, PET_VACCINATION, PET_VACCINATION_DATE)
VALUES(pet_no_seq.nextval, 7, '모찌', '불독', 'M', 4,
    '2006-09-15', '2차', '2007-03-03');

insert into pet
(PET_NO, MEMBER_NO, PET_NAME, PET_BREED, PET_GENDER, PET_WEIGHT,
    PET_ADOPTION_DATE, PET_VACCINATION, PET_VACCINATION_DATE)
VALUES(pet_no_seq.nextval, 8, '닐라', '닥스훈트', 'W', 3,
    '2007-04-12', '3차', '2008-01-14');

insert into pet
(PET_NO, MEMBER_NO, PET_NAME, PET_BREED, PET_GENDER, PET_WEIGHT,
    PET_ADOPTION_DATE, PET_VACCINATION, PET_VACCINATION_DATE)
VALUES(pet_no_seq.nextval, 9, '테오', '진돗개', 'W', 11,
    '2008-10-12', '4차', '2009-07-14');
insert into pet
(PET_NO, MEMBER_NO, PET_NAME, PET_BREED, PET_GENDER, PET_WEIGHT,
    PET_ADOPTION_DATE, PET_VACCINATION, PET_VACCINATION_DATE)
VALUES(pet_no_seq.nextval, 10, '솔이', '스피츠', 'M', 3,
    '2009-09-27', '미정', '');

insert into pet
(PET_NO, MEMBER_NO, PET_NAME, PET_BREED, PET_GENDER, PET_WEIGHT,
    PET_ADOPTION_DATE, PET_VACCINATION, PET_VACCINATION_DATE)
VALUES(pet_no_seq.nextval, 11, '둠치', '요크셔 테리어', 'M', 4,
    '2010-08-25', '5차', '2011-03-03');

insert into pet
(PET_NO, MEMBER_NO, PET_NAME, PET_BREED, PET_GENDER, PET_WEIGHT,
    PET_ADOPTION_DATE, PET_VACCINATION, PET_VACCINATION_DATE)
VALUES(pet_no_seq.nextval, 12, '장군', '시바 이누', 'W', 3,
    '2011-04-12', '2차', '2012-01-14');

insert into pet
(PET_NO, MEMBER_NO, PET_NAME, PET_BREED, PET_GENDER, PET_WEIGHT,
    PET_ADOPTION_DATE, PET_VACCINATION, PET_VACCINATION_DATE)
VALUES(pet_no_seq.nextval, 13, '해피', '일본 스피츠', 'W', 11,
    '2012-01-12', '6차', '2013-07-14');
insert into pet
(PET_NO, MEMBER_NO, PET_NAME, PET_BREED, PET_GENDER, PET_WEIGHT,
    PET_ADOPTION_DATE, PET_VACCINATION, PET_VACCINATION_DATE)
VALUES(pet_no_seq.nextval, 14, '키키', '슈나우저', 'M', 3,
    '2013-07-12', '미정', '');

insert into pet
(PET_NO, MEMBER_NO, PET_NAME, PET_BREED, PET_GENDER, PET_WEIGHT,
    PET_ADOPTION_DATE, PET_VACCINATION, PET_VACCINATION_DATE)
VALUES(pet_no_seq.nextval, 15, '차차', '코커 스패니얼', 'M', 4,
    '2014-12-15', '4차', '2015-03-03');

insert into pet
(PET_NO, MEMBER_NO, PET_NAME, PET_BREED, PET_GENDER, PET_WEIGHT,
    PET_ADOPTION_DATE, PET_VACCINATION, PET_VACCINATION_DATE)
VALUES(pet_no_seq.nextval, 16, '복순이', '골든 리트리버', 'W', 3,
    '2015-04-12', '3차', '2016-01-14');

insert into pet
(PET_NO, MEMBER_NO, PET_NAME, PET_BREED, PET_GENDER, PET_WEIGHT,
    PET_ADOPTION_DATE, PET_VACCINATION, PET_VACCINATION_DATE)
VALUES(pet_no_seq.nextval, 17, '검둥이', '래브라도 리트리버', 'W', 11,
    '2016-04-12', '1차', '2017-07-14');
    
insert into pet
(PET_NO, MEMBER_NO, PET_NAME, PET_BREED, PET_GENDER, PET_WEIGHT,
    PET_ADOPTION_DATE, PET_VACCINATION, PET_VACCINATION_DATE)
VALUES(pet_no_seq.nextval, 18, '차오', '비글', 'M', 3,
    '2017-06-12', '미정', '');

insert into pet
(PET_NO, MEMBER_NO, PET_NAME, PET_BREED, PET_GENDER, PET_WEIGHT,
    PET_ADOPTION_DATE, PET_VACCINATION, PET_VACCINATION_DATE)
VALUES(pet_no_seq.nextval, 19, '바로', '보더 콜리', 'M', 4,
    '2018-05-25', '5차', '2019-03-03');
    
insert into pet
(PET_NO, MEMBER_NO, PET_NAME, PET_BREED, PET_GENDER, PET_WEIGHT,
    PET_ADOPTION_DATE, PET_VACCINATION, PET_VACCINATION_DATE)
VALUES(pet_no_seq.nextval, 20, '하루', '보더 콜리', 'M', 14,
    '2019-07-15', '5차', '2020-03-03');
    
insert into pet
(PET_NO, MEMBER_NO, PET_NAME, PET_BREED, PET_GENDER, PET_WEIGHT,
    PET_ADOPTION_DATE, PET_VACCINATION, PET_VACCINATION_DATE)
VALUES(pet_no_seq.nextval, 21, '삼오', '보더 콜리', 'M', 9,
    '2020-07-15', '5차', '2021-03-03');

insert into pet
(PET_NO, MEMBER_NO, PET_NAME, PET_BREED, PET_GENDER, PET_WEIGHT,
    PET_ADOPTION_DATE, PET_VACCINATION, PET_VACCINATION_DATE)
VALUES(pet_no_seq.nextval, 22, '군동', '보더 콜리', 'M', 4,
    '2021-07-15', '5차', '2022-03-03');

insert into pet
(PET_NO, MEMBER_NO, PET_NAME, PET_BREED, PET_GENDER, PET_WEIGHT,
    PET_ADOPTION_DATE, PET_VACCINATION, PET_VACCINATION_DATE)
VALUES(pet_no_seq.nextval, 23, '고동', '보더 콜리', 'M', 6,
    '2016-07-15', '3차', '2020-03-03');
-----------------------------------------------------------------------
--img_file

insert into img_file
(IMG_NO, ORIGINAL_FILE_NAME, STORED_FILE_NAME, FILE_SIZE, IMG_CRE_DATE)
VALUES(img_no_seq.nextval, '전경용 kg 루이E 10', 'food1.png', 10, '2015-03-24');

insert into img_file
(IMG_NO, ORIGINAL_FILE_NAME, STORED_FILE_NAME, FILE_SIZE, IMG_CRE_DATE)
VALUES(img_no_seq.nextval, '시저 5종세트', 'food2.png', 10, '2015-03-24');

insert into img_file
(IMG_NO, ORIGINAL_FILE_NAME, STORED_FILE_NAME, FILE_SIZE, IMG_CRE_DATE)
VALUES(img_no_seq.nextval, '베이컨 간식', 'snack1.png', 10, '2015-03-24');

insert into img_file
(IMG_NO, ORIGINAL_FILE_NAME, STORED_FILE_NAME, FILE_SIZE, IMG_CRE_DATE)
VALUES(img_no_seq.nextval, '진짜 소고기 강아지 영양식', 'supplements1.png', 10, '2015-03-25');

insert into img_file
(IMG_NO, ORIGINAL_FILE_NAME, STORED_FILE_NAME, FILE_SIZE, IMG_CRE_DATE)
VALUES(img_no_seq.nextval, '댕댕 샴푸', 'bath1.png', 10, '2015-03-26');

insert into img_file
(IMG_NO, ORIGINAL_FILE_NAME, STORED_FILE_NAME, FILE_SIZE, IMG_CRE_DATE)
VALUES(img_no_seq.nextval, '댕댕장난감', 'toy1.png', 10, '2015-03-26');

insert into img_file
(IMG_NO, ORIGINAL_FILE_NAME, STORED_FILE_NAME, FILE_SIZE, IMG_CRE_DATE)
VALUES(img_no_seq.nextval, '뼈다구장난감', 'toy2.png', 10, '2015-04-01');

insert into img_file
(IMG_NO, ORIGINAL_FILE_NAME, STORED_FILE_NAME, FILE_SIZE, IMG_CRE_DATE)
VALUES(img_no_seq.nextval, '고급 이동장', 'etc1.png', 10, '2015-04-01');

insert into img_file
(IMG_NO, ORIGINAL_FILE_NAME, STORED_FILE_NAME, FILE_SIZE, IMG_CRE_DATE)
VALUES(img_no_seq.nextval, '닥터 바이 아이즈 4.0', 'etc2.jpg', 10, '2015-04-01');

insert into img_file
(IMG_NO, ORIGINAL_FILE_NAME, STORED_FILE_NAME, FILE_SIZE, IMG_CRE_DATE)
VALUES(img_no_seq.nextval, '푹신 수건 장갑', 'bath_glove1.jpg', 10, '2015-04-01');

insert into img_file
(IMG_NO, ORIGINAL_FILE_NAME, STORED_FILE_NAME, FILE_SIZE, IMG_CRE_DATE)
VALUES(img_no_seq.nextval, '튼튼 강아지 목줄', 'leash1.jpg', 10, '2015-04-01');

insert into img_file
(IMG_NO, ORIGINAL_FILE_NAME, STORED_FILE_NAME, FILE_SIZE, IMG_CRE_DATE)
VALUES(img_no_seq.nextval, '냠냠 개껌', 'gum1.jpg', 10, '2015-04-01');

insert into img_file
(IMG_NO, ORIGINAL_FILE_NAME, STORED_FILE_NAME, FILE_SIZE, IMG_CRE_DATE)
VALUES(img_no_seq.nextval, '밀키츄', 'snack2.jpg', 10, '2017-04-01');

insert into img_file
(IMG_NO, ORIGINAL_FILE_NAME, STORED_FILE_NAME, FILE_SIZE, IMG_CRE_DATE)
VALUES(img_no_seq.nextval, 'spray1', 'spray1.jpg', 10, '2017-04-02');

insert into img_file
(IMG_NO, ORIGINAL_FILE_NAME, STORED_FILE_NAME, FILE_SIZE, IMG_CRE_DATE)
VALUES(img_no_seq.nextval, 'snack3', 'snack3.jpg', 10, '2017-04-03');

insert into img_file
(IMG_NO, ORIGINAL_FILE_NAME, STORED_FILE_NAME, FILE_SIZE, IMG_CRE_DATE)
VALUES(img_no_seq.nextval, 'feed_machine1', 'feed_machine1.jpg', 10, '2017-04-03');

insert into img_file
(IMG_NO, ORIGINAL_FILE_NAME, STORED_FILE_NAME, FILE_SIZE, IMG_CRE_DATE)
VALUES(img_no_seq.nextval, 'shampoo2', 'shampoo2.jpg', 10, '2017-04-03');

insert into img_file
(IMG_NO, ORIGINAL_FILE_NAME, STORED_FILE_NAME, FILE_SIZE, IMG_CRE_DATE)
VALUES(img_no_seq.nextval, 'hair_clipper1', 'hair_clipper1.jpg', 10, '2017-04-03');

insert into img_file
(IMG_NO, ORIGINAL_FILE_NAME, STORED_FILE_NAME, FILE_SIZE, IMG_CRE_DATE)
VALUES(img_no_seq.nextval, 'towel1', 'towel1.jpg', 10, '2017-04-03');

insert into img_file
(IMG_NO, ORIGINAL_FILE_NAME, STORED_FILE_NAME, FILE_SIZE, IMG_CRE_DATE)
VALUES(img_no_seq.nextval, 'clothes1', 'clothes1.jpg', 10, '2017-04-03');

insert into img_file
(IMG_NO, ORIGINAL_FILE_NAME, STORED_FILE_NAME, FILE_SIZE, IMG_CRE_DATE)
VALUES(img_no_seq.nextval, 'tag1', 'tag1.jpg', 10, '2017-04-13');

insert into img_file
(IMG_NO, ORIGINAL_FILE_NAME, STORED_FILE_NAME, FILE_SIZE, IMG_CRE_DATE)
VALUES(img_no_seq.nextval, 'supplements9', 'supplements9.jpg', 10, '2018-05-04');

insert into img_file
(IMG_NO, ORIGINAL_FILE_NAME, STORED_FILE_NAME, FILE_SIZE, IMG_CRE_DATE)
VALUES(img_no_seq.nextval, 'supplements10', 'supplements10.jpg', 10, '2018-05-04');

insert into img_file
(IMG_NO, ORIGINAL_FILE_NAME, STORED_FILE_NAME, FILE_SIZE, IMG_CRE_DATE)
VALUES(img_no_seq.nextval, 'toy5', 'toy5.jpg', 10, '2017-04-12');

insert into img_file
(IMG_NO, ORIGINAL_FILE_NAME, STORED_FILE_NAME, FILE_SIZE, IMG_CRE_DATE)
VALUES(img_no_seq.nextval, 'snack4', 'snack4.jpg', 10, '2017-04-12');

insert into img_file
(IMG_NO, ORIGINAL_FILE_NAME, STORED_FILE_NAME, FILE_SIZE, IMG_CRE_DATE)
VALUES(img_no_seq.nextval, 'snack5', 'snack5.jpg', 10, '2017-04-12');

insert into img_file
(IMG_NO, ORIGINAL_FILE_NAME, STORED_FILE_NAME, FILE_SIZE, IMG_CRE_DATE)
VALUES(img_no_seq.nextval, 'food3', 'food3.jpg', 10, '2017-04-13');

insert into img_file
(IMG_NO, ORIGINAL_FILE_NAME, STORED_FILE_NAME, FILE_SIZE, IMG_CRE_DATE)
VALUES(img_no_seq.nextval, 'food4', 'food4.jpg', 10, '2017-04-13');

insert into img_file
(IMG_NO, ORIGINAL_FILE_NAME, STORED_FILE_NAME, FILE_SIZE, IMG_CRE_DATE)
VALUES(img_no_seq.nextval, 'supplements2', 'supplements2.jpg', 10, '2017-04-12');

insert into img_file
(IMG_NO, ORIGINAL_FILE_NAME, STORED_FILE_NAME, FILE_SIZE, IMG_CRE_DATE)
VALUES(img_no_seq.nextval, 'supplements3', 'supplements3.jpg', 10, '2017-04-21');

insert into img_file
(IMG_NO, ORIGINAL_FILE_NAME, STORED_FILE_NAME, FILE_SIZE, IMG_CRE_DATE)
VALUES(img_no_seq.nextval, 'supplements4', 'supplements4.jpg', 10, '2017-04-22');

insert into img_file
(IMG_NO, ORIGINAL_FILE_NAME, STORED_FILE_NAME, FILE_SIZE, IMG_CRE_DATE)
VALUES(img_no_seq.nextval, 'food5', 'food5.jpg', 10, '2018-05-01');

insert into img_file
(IMG_NO, ORIGINAL_FILE_NAME, STORED_FILE_NAME, FILE_SIZE, IMG_CRE_DATE)
VALUES(img_no_seq.nextval, 'food6', 'food6.jpg', 10, '2018-05-01');

insert into img_file
(IMG_NO, ORIGINAL_FILE_NAME, STORED_FILE_NAME, FILE_SIZE, IMG_CRE_DATE)
VALUES(img_no_seq.nextval, 'food7', 'food7.jpg', 10, '2018-05-01');

insert into img_file
(IMG_NO, ORIGINAL_FILE_NAME, STORED_FILE_NAME, FILE_SIZE, IMG_CRE_DATE)
VALUES(img_no_seq.nextval, 'food8', 'food8.jpg', 10, '2018-05-02');

insert into img_file
(IMG_NO, ORIGINAL_FILE_NAME, STORED_FILE_NAME, FILE_SIZE, IMG_CRE_DATE)
VALUES(img_no_seq.nextval, 'food9', 'food9.jpg', 10, '2018-05-02');

insert into img_file
(IMG_NO, ORIGINAL_FILE_NAME, STORED_FILE_NAME, FILE_SIZE, IMG_CRE_DATE)
VALUES(img_no_seq.nextval, 'food10', 'food10.jpg', 10, '2018-05-02');

insert into img_file
(IMG_NO, ORIGINAL_FILE_NAME, STORED_FILE_NAME, FILE_SIZE, IMG_CRE_DATE)
VALUES(img_no_seq.nextval, 'supplements5', 'supplements5.jpg', 10, '2018-05-03');

insert into img_file
(IMG_NO, ORIGINAL_FILE_NAME, STORED_FILE_NAME, FILE_SIZE, IMG_CRE_DATE)
VALUES(img_no_seq.nextval, 'supplements6', 'supplements6.jpg', 10, '2018-05-03');

insert into img_file
(IMG_NO, ORIGINAL_FILE_NAME, STORED_FILE_NAME, FILE_SIZE, IMG_CRE_DATE)
VALUES(img_no_seq.nextval, 'supplements7', 'supplements7.jpg', 10, '2018-05-03');

insert into img_file
(IMG_NO, ORIGINAL_FILE_NAME, STORED_FILE_NAME, FILE_SIZE, IMG_CRE_DATE)
VALUES(img_no_seq.nextval, 'supplements8', 'supplements8.jpg', 10, '2018-05-03');

insert into img_file
(IMG_NO, ORIGINAL_FILE_NAME, STORED_FILE_NAME, FILE_SIZE, IMG_CRE_DATE)
VALUES(img_no_seq.nextval, 'toy3', 'toy3.jpg', 10, '2017-04-14');

insert into img_file
(IMG_NO, ORIGINAL_FILE_NAME, STORED_FILE_NAME, FILE_SIZE, IMG_CRE_DATE)
VALUES(img_no_seq.nextval, 'toy4', 'toy4.jpg', 10, '2017-04-15');

-----------------------------------------------------------------------
--product_detail

insert into product_detail
(PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_DETAIL_CONTENT)
VALUES(product_detail_no_seq.nextval, 1, '1. 건강한 피부와 모질 향상 도움<div>2. 활동에 필요한 필수영양소 함유</div><div>3. 뛰어난 맛과 높은 소화흡수력</div><div>4. 변 냄새 감소에 도움</div>');

insert into product_detail
(PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_DETAIL_CONTENT)
VALUES(product_detail_no_seq.nextval, 2, '영양소가 잡힌 시저 5종 세트');

insert into product_detail
(PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_DETAIL_CONTENT)
VALUES(product_detail_no_seq.nextval, 3, '반려견 맞춤 저염식 베이컨 간식');

insert into product_detail
(PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_DETAIL_CONTENT)
VALUES(product_detail_no_seq.nextval, 4, '진짜 소고기 강아지 영양식');

insert into product_detail
(PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_DETAIL_CONTENT)
VALUES(product_detail_no_seq.nextval, 5, '댕댕에서 만든 반려견을 생각한 샴푸');

insert into product_detail
(PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_DETAIL_CONTENT)
VALUES(product_detail_no_seq.nextval, 6, '가성비 최고 친환경 장난감');

insert into product_detail
(PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_DETAIL_CONTENT)
VALUES(product_detail_no_seq.nextval, 7, '아이들이 갖고놀기 좋게 튼튼한<div>뼈다구 모양 장난감</div>');

insert into product_detail
(PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_DETAIL_CONTENT)
VALUES(product_detail_no_seq.nextval, 8, '안전하게 이동 가능한 고급 이동장');

insert into product_detail
(PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_DETAIL_CONTENT)
VALUES(product_detail_no_seq.nextval, 9, '닥터 바이 아이즈 4.0');

insert into product_detail
(PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_DETAIL_CONTENT)
VALUES(product_detail_no_seq.nextval, 10, '체온을 따듯하게 해주고<div>평상시에도 좋아하는 수건 장갑</div>');

insert into product_detail
(PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_DETAIL_CONTENT)
VALUES(product_detail_no_seq.nextval, 11, '최대 3m까지 늘어나는 안전 목줄');

insert into product_detail
(PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_DETAIL_CONTENT)
VALUES(product_detail_no_seq.nextval, 12, '냠냠 개껌');

insert into product_detail
(PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_DETAIL_CONTENT)
VALUES(product_detail_no_seq.nextval, 13, '진짜 한우 우피에 산양유를 가득 담았다!<div>취향에 따라 즐기는 4가지 형태의 페스룸 밀키츄</div>');

insert into product_detail
(PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_DETAIL_CONTENT)
VALUES(product_detail_no_seq.nextval, 14, '깔끔한 무향, 인증 받은 소취(악취 제거)력 99.9%!<div>신개념 원료로 악취균을 근본적으로 분해 및 제거하는</div><div>제로 오도어 스프레이</div>');

insert into product_detail
(PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_DETAIL_CONTENT)
VALUES(product_detail_no_seq.nextval, 15, '피부튼튼, 면역튼튼, 활력튼튼<div>건강견볼 튼튼 3세트</div>');

insert into product_detail
(PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_DETAIL_CONTENT)
VALUES(product_detail_no_seq.nextval, 16, '반려동물 푸쉬 반자동 급식기(핑크)<div>강아지 노즈워크 장난감</div>');

insert into product_detail
(PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_DETAIL_CONTENT)
VALUES(product_detail_no_seq.nextval, 17, '코코넛 천연성분 보습효과 퍼피 개샴푸 1L 목욕');

insert into product_detail
(PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_DETAIL_CONTENT)
VALUES(product_detail_no_seq.nextval, 18, ' 애견이발기 교체형날 (VG704)');

insert into product_detail
(PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_DETAIL_CONTENT)
VALUES(product_detail_no_seq.nextval, 19, '강력흡수 강아지 털말림 목욕후 펫 부드러운 샤워타올');

insert into product_detail
(PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_DETAIL_CONTENT)
VALUES(product_detail_no_seq.nextval, 20, '애견 패딩조끼만 네이비<div>따뜻함은 물론 안전까지 더했습니다</div>');

insert into product_detail
(PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_DETAIL_CONTENT)
VALUES(product_detail_no_seq.nextval, 21, '강아지 고양이 인식 목걸이 입니다.<div>각인과 체인은 모두 써지컬 스틸입니다.</div><div>사이즈는 25CM</div>');

insert into product_detail
(PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_DETAIL_CONTENT)
VALUES(product_detail_no_seq.nextval, 22, '엘라이신/타우린/비타민 첨가');

insert into product_detail
(PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_DETAIL_CONTENT)
VALUES(product_detail_no_seq.nextval, 23, '엘라이신/타우린/비타민 첨가');

insert into product_detail
(PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_DETAIL_CONTENT)
VALUES(product_detail_no_seq.nextval, 24, '쁘띠 옥수수 터그 강아지 장난감<div>진짜 옥수수로 보이지만 먹을 수 없습니다.</div>');

insert into product_detail
(PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_DETAIL_CONTENT)
VALUES(product_detail_no_seq.nextval, 25, '반려견의 건강에 좋은 양고기와 치즈가 들어간<div>촉촉하고 부드러운 간식</div>');

insert into product_detail
(PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_DETAIL_CONTENT)
VALUES(product_detail_no_seq.nextval, 26, '맛있는 덴탈껌!<div>우리아이 구강건강</div><div>덴탈껌으로 관리하세요!</div>');

insert into product_detail
(PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_DETAIL_CONTENT)
VALUES(product_detail_no_seq.nextval, 27, '신선한 닭고기와 계유를 사용하여<div>맛와 영양이 뛰어난 </div><div>중대형 성견용 제품입니다.</div>');

insert into product_detail
(PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_DETAIL_CONTENT)
VALUES(product_detail_no_seq.nextval, 28, '활동량이 많은 반려견을 위한 고에너지 사료');

insert into product_detail
(PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_DETAIL_CONTENT)
VALUES(product_detail_no_seq.nextval, 29, '건강한장을위한 영양제');

insert into product_detail
(PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_DETAIL_CONTENT)
VALUES(product_detail_no_seq.nextval, 30, '우리강아지를 종합영양보충');

insert into product_detail
(PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_DETAIL_CONTENT)
VALUES(product_detail_no_seq.nextval, 31, '옵티펫 강아지 영양제 300g 5종세트<div>아이케어</div><div>스킨케어</div><div>데일리케어</div><div>조인트케어</div><div>오메가 비타민케어</div>');

insert into product_detail
(PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_DETAIL_CONTENT)
VALUES(product_detail_no_seq.nextval, 32, '짧은 기간에 빠르게 성장하는 대형견을 위한<div>균형잡힌 맞춤 영양 사료입니다.</div><div>원산지:프랑스</div>');

insert into product_detail
(PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_DETAIL_CONTENT)
VALUES(product_detail_no_seq.nextval, 33, '1. 100% 식물성원료 비건라벨<div>2. 건강한 피부와 피모</div><div>3. 소화기능 개선</div><div>4. 체중관리 도움</div>');

insert into product_detail
(PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_DETAIL_CONTENT)
VALUES(product_detail_no_seq.nextval, 34, '생후 1~7년 성견의 어덜트 반려견 전용 주식');

insert into product_detail
(PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_DETAIL_CONTENT)
VALUES(product_detail_no_seq.nextval, 35, '고칼슘 고단백 전연령 반려동물 사료 3kg');

insert into product_detail
(PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_DETAIL_CONTENT)
VALUES(product_detail_no_seq.nextval, 36, '우리강아지를 종합영양보충');

insert into product_detail
(PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_DETAIL_CONTENT)
VALUES(product_detail_no_seq.nextval, 37, '1세이상 성견에 적합한 사료입니다.<div>신체활동이 활발한 성견을 위한 균형잡힌 영양식</div>');

insert into product_detail
(PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_DETAIL_CONTENT)
VALUES(product_detail_no_seq.nextval, 38, '강아지 종합 영양제 완 벽 하군 250g');

insert into product_detail
(PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_DETAIL_CONTENT)
VALUES(product_detail_no_seq.nextval, 39, '간 심장 영양제 튼튼하군 250g');

insert into product_detail
(PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_DETAIL_CONTENT)
VALUES(product_detail_no_seq.nextval, 40, '강아지 관절 골격 영양제 잘달릴걸 250g');

insert into product_detail
(PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_DETAIL_CONTENT)
VALUES(product_detail_no_seq.nextval, 41, '강아지 피부피모 영양제 매끈하군 250g');

insert into product_detail
(PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_DETAIL_CONTENT)
VALUES(product_detail_no_seq.nextval, 42, '강아지 고양이 인식 목걸이 입니다.<div>각인과 체인은 모두 써지컬 스틸입니다.</div><div>사이즈는 25CM</div>');

insert into product_detail
(PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_DETAIL_CONTENT)
VALUES(product_detail_no_seq.nextval, 43, '강아지장난감 삑삑이 노즈워크<div>귀여운 버섯 모양입니다.</div>');

---------------------------------------------------------------------------
--product
insert into product
(PRODUCT_NO, PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_NAME, PRODUCT_PRICE,
    PRODUCT_STOCK, PRODUCT_CATEGORY, PRODUCT_CRE_DATE, PRODUCT_MOD_DATE)
VALUES(product_no_seq.nextval, 1, 1, '전경용 kg 루이E 10', 33500,
    2000, '10', '2015-03-24', '2020-03-03');

insert into product
(PRODUCT_NO, PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_NAME, PRODUCT_PRICE,
    PRODUCT_STOCK, PRODUCT_CATEGORY, PRODUCT_CRE_DATE, PRODUCT_MOD_DATE)
VALUES(product_no_seq.nextval, 2, 2, '시저 5종세트', 19900,
    300, '10', '2015-03-24', '2021-03-21');

insert into product
(PRODUCT_NO, PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_NAME, PRODUCT_PRICE,
    PRODUCT_STOCK, PRODUCT_CATEGORY, PRODUCT_CRE_DATE, PRODUCT_MOD_DATE)
VALUES(product_no_seq.nextval, 3, 3, '베이컨 간식', 9900,
    2500, '20', '2015-03-25', '2020-01-07');
    
insert into product
(PRODUCT_NO, PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_NAME, PRODUCT_PRICE,
    PRODUCT_STOCK, PRODUCT_CATEGORY, PRODUCT_CRE_DATE, PRODUCT_MOD_DATE)
VALUES(product_no_seq.nextval, 4, 4, '진짜 소고기 강아지 영양식', 14900,
    2500, '30', '2015-03-26', '2023-01-24');


insert into product
(PRODUCT_NO, PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_NAME, PRODUCT_PRICE,
    PRODUCT_STOCK, PRODUCT_CATEGORY, PRODUCT_CRE_DATE, PRODUCT_MOD_DATE)
VALUES(product_no_seq.nextval, 5, 5, '댕댕샴푸', 15900,
    3500, '40', '2015-03-26', '2015-09-01');

insert into product
(PRODUCT_NO, PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_NAME, PRODUCT_PRICE,
    PRODUCT_STOCK, PRODUCT_CATEGORY, PRODUCT_CRE_DATE, PRODUCT_MOD_DATE)
VALUES(product_no_seq.nextval, 6, 6, '댕댕장난감', 9900,
    1100, '50', '2015-03-26', '2021-05-24');

insert into product
(PRODUCT_NO, PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_NAME, PRODUCT_PRICE,
    PRODUCT_STOCK, PRODUCT_CATEGORY, PRODUCT_CRE_DATE, PRODUCT_MOD_DATE)
VALUES(product_no_seq.nextval, 7, 7, '뼈다귀 장난감', 15900,
    1200, '50', '2015-03-26', '2021-05-21');

insert into product
(PRODUCT_NO, PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_NAME, PRODUCT_PRICE,
    PRODUCT_STOCK, PRODUCT_CATEGORY, PRODUCT_CRE_DATE, PRODUCT_MOD_DATE)
VALUES(product_no_seq.nextval, 8, 8, '고급 이동장', 55900,
    50, '60', '2015-03-26', '2023-03-11');
    
insert into product
(PRODUCT_NO, PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_NAME, PRODUCT_PRICE,
    PRODUCT_STOCK, PRODUCT_CATEGORY, PRODUCT_CRE_DATE, PRODUCT_MOD_DATE)
VALUES(product_no_seq.nextval, 9, 9, '닥터 바이 아이즈 4.0', 9900,
    500, '60', '2015-04-01', '2023-03-11');
    
insert into product
(PRODUCT_NO, PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_NAME, PRODUCT_PRICE,
    PRODUCT_STOCK, PRODUCT_CATEGORY, PRODUCT_CRE_DATE, PRODUCT_MOD_DATE)
VALUES(product_no_seq.nextval, 10, 10, '푹신 수건 장갑', 12900,
    200, '40', '2015-04-01', '2023-03-11');
    
insert into product
(PRODUCT_NO, PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_NAME, PRODUCT_PRICE,
    PRODUCT_STOCK, PRODUCT_CATEGORY, PRODUCT_CRE_DATE, PRODUCT_MOD_DATE)
VALUES(product_no_seq.nextval, 11, 11, '튼튼 강아지 목줄', 15900,
    500, '60', '2015-04-01', '2023-03-11');
    
insert into product
(PRODUCT_NO, PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_NAME, PRODUCT_PRICE,
    PRODUCT_STOCK, PRODUCT_CATEGORY, PRODUCT_CRE_DATE, PRODUCT_MOD_DATE)
VALUES(product_no_seq.nextval, 12, 12, '냠냠 개껌', 8900,
    50, '20', '2015-04-01', '2023-03-11');
    
insert into product
(PRODUCT_NO, PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_NAME, PRODUCT_PRICE,
    PRODUCT_STOCK, PRODUCT_CATEGORY, PRODUCT_CRE_DATE, PRODUCT_MOD_DATE)
VALUES(product_no_seq.nextval, 13, 13, '밀키츄', 10000,
    500, '20', '2017-04-01', '2021-03-11');
    
    
insert into product
(PRODUCT_NO, PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_NAME, PRODUCT_PRICE,
    PRODUCT_STOCK, PRODUCT_CATEGORY, PRODUCT_CRE_DATE, PRODUCT_MOD_DATE)
VALUES(product_no_seq.nextval, 14, 14, '안티 오도어 세트 (오도어스프레이+리필)', 49900,
    100, '40', '2017-04-02', '2021-03-11'); 
    
insert into product
(PRODUCT_NO, PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_NAME, PRODUCT_PRICE,
    PRODUCT_STOCK, PRODUCT_CATEGORY, PRODUCT_CRE_DATE, PRODUCT_MOD_DATE)
VALUES(product_no_seq.nextval, 15, 15, '건강견볼 튼튼 3세트', 13000,
    500, '20', '2017-04-03', '2021-03-12');
    
insert into product
(PRODUCT_NO, PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_NAME, PRODUCT_PRICE,
    PRODUCT_STOCK, PRODUCT_CATEGORY, PRODUCT_CRE_DATE, PRODUCT_MOD_DATE)
VALUES(product_no_seq.nextval, 16, 16, '반려동물 푸쉬 반자동 급식기(핑크)', 43000,
    200, '50', '2017-04-04', '2021-03-11');
    
insert into product
(PRODUCT_NO, PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_NAME, PRODUCT_PRICE,
    PRODUCT_STOCK, PRODUCT_CATEGORY, PRODUCT_CRE_DATE, PRODUCT_MOD_DATE)
VALUES(product_no_seq.nextval, 17, 17, '코코넛 천연성분 보습효과 퍼피 개샴푸 1L 목욕', 10000,
    500, '40', '2017-04-03', '2021-03-13');
    
insert into product
(PRODUCT_NO, PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_NAME, PRODUCT_PRICE,
    PRODUCT_STOCK, PRODUCT_CATEGORY, PRODUCT_CRE_DATE, PRODUCT_MOD_DATE)
VALUES(product_no_seq.nextval, 18, 18, ' 애견이발기 교체형날 (VG704)', 28900,
    500, '40', '2017-04-03', '2021-03-13');
    
insert into product
(PRODUCT_NO, PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_NAME, PRODUCT_PRICE,
    PRODUCT_STOCK, PRODUCT_CATEGORY, PRODUCT_CRE_DATE, PRODUCT_MOD_DATE)
VALUES(product_no_seq.nextval, 19, 19, '강력흡수 강아지 털말림 목욕후 펫 부드러운 샤워타올', 10000,
    500, '20', '2017-04-01', '2021-03-11');
    
insert into product
(PRODUCT_NO, PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_NAME, PRODUCT_PRICE,
    PRODUCT_STOCK, PRODUCT_CATEGORY, PRODUCT_CRE_DATE, PRODUCT_MOD_DATE)
VALUES(product_no_seq.nextval, 20, 20, '애견 패딩조끼만 네이비', 30400,
    130, '60', '2017-04-11', '2021-03-21');
    
insert into product
(PRODUCT_NO, PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_NAME, PRODUCT_PRICE,
    PRODUCT_STOCK, PRODUCT_CATEGORY, PRODUCT_CRE_DATE, PRODUCT_MOD_DATE)
VALUES(product_no_seq.nextval, 21, 21, '반려견 강아지 인식표 목걸이 각인 이름 AA', 11900,
    500, '60', '2017-04-13', '2021-03-11');
    
insert into product
(PRODUCT_NO, PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_NAME, PRODUCT_PRICE,
    PRODUCT_STOCK, PRODUCT_CATEGORY, PRODUCT_CRE_DATE, PRODUCT_MOD_DATE)
VALUES(product_no_seq.nextval, 22, 22, '소간 파우더 50g x 10', 51300,
    500, '30', '2017-04-13', '2021-03-13');
    
insert into product
(PRODUCT_NO, PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_NAME, PRODUCT_PRICE,
    PRODUCT_STOCK, PRODUCT_CATEGORY, PRODUCT_CRE_DATE, PRODUCT_MOD_DATE)
VALUES(product_no_seq.nextval, 23, 23, '북어 파우더 50g x 10', 51300,
    500, '30', '2017-04-14', '2021-03-11');
    
insert into product
(PRODUCT_NO, PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_NAME, PRODUCT_PRICE,
    PRODUCT_STOCK, PRODUCT_CATEGORY, PRODUCT_CRE_DATE, PRODUCT_MOD_DATE)
VALUES(product_no_seq.nextval, 24, 24, '쁘띠 옥수수 터그 강아지 장난감', 16300,
    500, '50', '2017-04-16', '2021-03-16');
    
insert into product
(PRODUCT_NO, PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_NAME, PRODUCT_PRICE,
    PRODUCT_STOCK, PRODUCT_CATEGORY, PRODUCT_CRE_DATE, PRODUCT_MOD_DATE)
VALUES(product_no_seq.nextval, 25, 25, '강아지전용 간식 양고기 치즈버거 100g 80EA', 70200,
    200, '20', '2017-04-17', '2021-03-17');
    
insert into product
(PRODUCT_NO, PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_NAME, PRODUCT_PRICE,
    PRODUCT_STOCK, PRODUCT_CATEGORY, PRODUCT_CRE_DATE, PRODUCT_MOD_DATE)
VALUES(product_no_seq.nextval, 26, 26, '치석제거 입냄새완화 반려간식 43P 340g', 35400,
    300, '20', '2017-04-17', '2021-03-17');
    
insert into product
(PRODUCT_NO, PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_NAME, PRODUCT_PRICE,
    PRODUCT_STOCK, PRODUCT_CATEGORY, PRODUCT_CRE_DATE, PRODUCT_MOD_DATE)
VALUES(product_no_seq.nextval, 27, 27, '중대형견용 14kg 건식사료', 29800,
    500, '10', '2017-04-20', '2021-03-20');
    
insert into product
(PRODUCT_NO, PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_NAME, PRODUCT_PRICE,
    PRODUCT_STOCK, PRODUCT_CATEGORY, PRODUCT_CRE_DATE, PRODUCT_MOD_DATE)
VALUES(product_no_seq.nextval, 28, 28, '스페셜 특수견 프로 15kg', 46700,
    500, '10', '2017-04-21', '2021-03-21');
    
insert into product
(PRODUCT_NO, PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_NAME, PRODUCT_PRICE,
    PRODUCT_STOCK, PRODUCT_CATEGORY, PRODUCT_CRE_DATE, PRODUCT_MOD_DATE)
VALUES(product_no_seq.nextval, 29, 29, '강아지영양보충 애견영양보충제 건강식 비타민 250g', 17500,
    500, '30', '2017-04-21', '2021-03-21');
    
insert into product
(PRODUCT_NO, PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_NAME, PRODUCT_PRICE,
    PRODUCT_STOCK, PRODUCT_CATEGORY, PRODUCT_CRE_DATE, PRODUCT_MOD_DATE)
VALUES(product_no_seq.nextval, 30, 30, '강아지영양보충 애견영양보충제 건강식 비타민', 17500,
    500, '30', '2017-04-21', '2021-03-21');
    
insert into product
(PRODUCT_NO, PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_NAME, PRODUCT_PRICE,
    PRODUCT_STOCK, PRODUCT_CATEGORY, PRODUCT_CRE_DATE, PRODUCT_MOD_DATE)
VALUES(product_no_seq.nextval, 31, 31, '옵티펫 강아지 영양제 300g 5종세트', 71000,
    570, '30', '2017-04-22', '2021-03-22');
    
insert into product
(PRODUCT_NO, PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_NAME, PRODUCT_PRICE,
    PRODUCT_STOCK, PRODUCT_CATEGORY, PRODUCT_CRE_DATE, PRODUCT_MOD_DATE)
VALUES(product_no_seq.nextval, 32, 32, '로얄캐닌 맥시 도매 주니어 10kg', 167500,
    50, '10', '2018-05-01', '2021-05-21');
    
insert into product
(PRODUCT_NO, PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_NAME, PRODUCT_PRICE,
    PRODUCT_STOCK, PRODUCT_CATEGORY, PRODUCT_CRE_DATE, PRODUCT_MOD_DATE)
VALUES(product_no_seq.nextval, 33, 33, '강아지 처방식 채식사료 민감피부 NVD (2.5kg)', 46300,
    120, '10', '2018-05-01', '2021-05-21');
    
insert into product
(PRODUCT_NO, PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_NAME, PRODUCT_PRICE,
    PRODUCT_STOCK, PRODUCT_CATEGORY, PRODUCT_CRE_DATE, PRODUCT_MOD_DATE)
VALUES(product_no_seq.nextval, 34, 34, '아미오 독 홀리스틱 어덜트 5kg 500gx10개', 67500,
    220, '10', '2018-05-02', '2021-05-22');
    
insert into product
(PRODUCT_NO, PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_NAME, PRODUCT_PRICE,
    PRODUCT_STOCK, PRODUCT_CATEGORY, PRODUCT_CRE_DATE, PRODUCT_MOD_DATE)
VALUES(product_no_seq.nextval, 35, 35, '고칼슘 고단백 전연령 반려동물 사료 3kg', 41300,
    120, '10', '2018-05-02', '2021-05-22');
    
insert into product
(PRODUCT_NO, PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_NAME, PRODUCT_PRICE,
    PRODUCT_STOCK, PRODUCT_CATEGORY, PRODUCT_CRE_DATE, PRODUCT_MOD_DATE)
VALUES(product_no_seq.nextval, 36, 36, ' 강아지 애견 사료 피부 모질 개선', 15500,
    500, '10', '2018-05-02', '2021-05-21');
    
insert into product
(PRODUCT_NO, PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_NAME, PRODUCT_PRICE,
    PRODUCT_STOCK, PRODUCT_CATEGORY, PRODUCT_CRE_DATE, PRODUCT_MOD_DATE)
VALUES(product_no_seq.nextval, 37, 37, '강아지 애견 사료 피부 모질 개선 전연령', 33500,
    500, '10', '2018-05-02', '2021-05-21');

insert into product
(PRODUCT_NO, PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_NAME, PRODUCT_PRICE,
    PRODUCT_STOCK, PRODUCT_CATEGORY, PRODUCT_CRE_DATE, PRODUCT_MOD_DATE)
VALUES(product_no_seq.nextval, 38, 38, '강아지 종합 영양제 완 벽 하군 250g', 42500,
    500, '30', '2018-05-04', '2021-05-21');

insert into product
(PRODUCT_NO, PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_NAME, PRODUCT_PRICE,
    PRODUCT_STOCK, PRODUCT_CATEGORY, PRODUCT_CRE_DATE, PRODUCT_MOD_DATE)
VALUES(product_no_seq.nextval, 39, 39, '간 심장 영양제 튼튼하군 250g', 39500,
    500, '30', '2018-05-04', '2021-05-21');

insert into product
(PRODUCT_NO, PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_NAME, PRODUCT_PRICE,
    PRODUCT_STOCK, PRODUCT_CATEGORY, PRODUCT_CRE_DATE, PRODUCT_MOD_DATE)
VALUES(product_no_seq.nextval, 40, 40, '강아지 관절 골격 영양제 잘달릴걸 250g', 39500,
    500, '30', '2018-05-04', '2021-05-21');

insert into product
(PRODUCT_NO, PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_NAME, PRODUCT_PRICE,
    PRODUCT_STOCK, PRODUCT_CATEGORY, PRODUCT_CRE_DATE, PRODUCT_MOD_DATE)
VALUES(product_no_seq.nextval, 41, 41, '강아지 피부피모 영양제 매끈하군 250g', 39500,
    500, '30', '2018-05-04', '2021-05-21');

insert into product
(PRODUCT_NO, PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_NAME, PRODUCT_PRICE,
    PRODUCT_STOCK, PRODUCT_CATEGORY, PRODUCT_CRE_DATE, PRODUCT_MOD_DATE)
VALUES(product_no_seq.nextval, 42, 42, '강아지장난감 삑삑이 노즈워크', 16900,
    500, '50', '2018-05-05', '2021-05-21');
    
insert into product
(PRODUCT_NO, PRODUCT_DETAIL_NO, IMG_NO, PRODUCT_NAME, PRODUCT_PRICE,
    PRODUCT_STOCK, PRODUCT_CATEGORY, PRODUCT_CRE_DATE, PRODUCT_MOD_DATE)
VALUES(product_no_seq.nextval, 43, 43, '강아지 간식 장난감공 분리불안해소 노즈워크공', 12300,
    500, '50', '2018-05-05', '2021-05-21');

-------------------------------------------------------------------------------
--order_list
insert into order_list
(ORDER_NO, MEMBER_NO, PRODUCT_NO, ORDER_DATE, ORDER_REQUEST, ORDER_STATUS, PRODUCT_QUANTITY)
VALUES(order_no_seq.nextval, 2, 1, '2023-07-07', '문앞에 놔주세요', '확정', 1);

insert into order_list
(ORDER_NO, MEMBER_NO, PRODUCT_NO, ORDER_DATE, ORDER_REQUEST, ORDER_STATUS, PRODUCT_QUANTITY)
VALUES(order_no_seq.nextval, 2, 2, '2023-08-07', '문앞에 놔주세요', '미확정', 2);

insert into order_list
(ORDER_NO, MEMBER_NO, PRODUCT_NO, ORDER_DATE, ORDER_REQUEST, ORDER_STATUS, PRODUCT_QUANTITY)
VALUES(order_no_seq.nextval, 3, 3, '2023-05-07', '경비실에 맡겨주세요', '확정', 3);

insert into order_list
(ORDER_NO, MEMBER_NO, PRODUCT_NO, ORDER_DATE, ORDER_REQUEST, ORDER_STATUS, PRODUCT_QUANTITY)
VALUES(order_no_seq.nextval, 4, 4, '2022-02-15', '문앞에 놔주세요', '미확정', 1);

insert into order_list
(ORDER_NO, MEMBER_NO, PRODUCT_NO, ORDER_DATE, ORDER_REQUEST, ORDER_STATUS, PRODUCT_QUANTITY)
VALUES(order_no_seq.nextval, 5, 5, '2023-07-15', '문앞에 놔주세요', '취소', 1);

insert into order_list
(ORDER_NO, MEMBER_NO, PRODUCT_NO, ORDER_DATE, ORDER_REQUEST, ORDER_STATUS, PRODUCT_QUANTITY)
VALUES(order_no_seq.nextval, 2, 3, '2023-07-07', '문앞에 놔주세요', '확정', 1);

insert into order_list
(ORDER_NO, MEMBER_NO, PRODUCT_NO, ORDER_DATE, ORDER_REQUEST, ORDER_STATUS, PRODUCT_QUANTITY)
VALUES(order_no_seq.nextval, 4, 5, '2023-08-07', '문앞에 놔주세요', '미확정', 2);

insert into order_list
(ORDER_NO, MEMBER_NO, PRODUCT_NO, ORDER_DATE, ORDER_REQUEST, ORDER_STATUS, PRODUCT_QUANTITY)
VALUES(order_no_seq.nextval, 4, 3, '2023-05-07', '경비실에 맡겨주세요', '확정', 3);

insert into order_list
(ORDER_NO, MEMBER_NO, PRODUCT_NO, ORDER_DATE, ORDER_REQUEST, ORDER_STATUS, PRODUCT_QUANTITY)
VALUES(order_no_seq.nextval, 5, 4, '2022-02-15', '문앞에 놔주세요', '미확정', 1);

insert into order_list
(ORDER_NO, MEMBER_NO, PRODUCT_NO, ORDER_DATE, ORDER_REQUEST, ORDER_STATUS, PRODUCT_QUANTITY)
VALUES(order_no_seq.nextval, 6, 5, '2023-07-15', '문앞에 놔주세요', '취소', 1);
--11
insert into order_list
(ORDER_NO, MEMBER_NO, PRODUCT_NO, ORDER_DATE, ORDER_REQUEST, ORDER_STATUS, PRODUCT_QUANTITY)
VALUES(order_no_seq.nextval, 7, 3, '2023-07-07', '문앞에 놔주세요', '확정', 1);

insert into order_list
(ORDER_NO, MEMBER_NO, PRODUCT_NO, ORDER_DATE, ORDER_REQUEST, ORDER_STATUS, PRODUCT_QUANTITY)
VALUES(order_no_seq.nextval, 7, 5, '2023-08-07', '문앞에 놔주세요', '미확정', 2);

insert into order_list
(ORDER_NO, MEMBER_NO, PRODUCT_NO, ORDER_DATE, ORDER_REQUEST, ORDER_STATUS, PRODUCT_QUANTITY)
VALUES(order_no_seq.nextval, 7, 6, '2023-05-07', '경비실에 맡겨주세요', '확정', 3);

insert into order_list
(ORDER_NO, MEMBER_NO, PRODUCT_NO, ORDER_DATE, ORDER_REQUEST, ORDER_STATUS, PRODUCT_QUANTITY)
VALUES(order_no_seq.nextval, 8, 4, '2022-02-15', '문앞에 놔주세요', '미확정', 1);

insert into order_list
(ORDER_NO, MEMBER_NO, PRODUCT_NO, ORDER_DATE, ORDER_REQUEST, ORDER_STATUS, PRODUCT_QUANTITY)
VALUES(order_no_seq.nextval, 8, 5, '2023-07-15', '문앞에 놔주세요', '취소', 1);

--16
insert into order_list
(ORDER_NO, MEMBER_NO, PRODUCT_NO, ORDER_DATE, ORDER_REQUEST, ORDER_STATUS, PRODUCT_QUANTITY)
VALUES(order_no_seq.nextval, 9, 8, '2023-07-07', '문앞에 놔주세요', '확정', 1);

insert into order_list
(ORDER_NO, MEMBER_NO, PRODUCT_NO, ORDER_DATE, ORDER_REQUEST, ORDER_STATUS, PRODUCT_QUANTITY)
VALUES(order_no_seq.nextval, 9, 9, '2023-08-07', '문앞에 놔주세요', '미확정', 2);

insert into order_list
(ORDER_NO, MEMBER_NO, PRODUCT_NO, ORDER_DATE, ORDER_REQUEST, ORDER_STATUS, PRODUCT_QUANTITY)
VALUES(order_no_seq.nextval, 9, 6, '2023-05-07', '경비실에 맡겨주세요', '확정', 3);

insert into order_list
(ORDER_NO, MEMBER_NO, PRODUCT_NO, ORDER_DATE, ORDER_REQUEST, ORDER_STATUS, PRODUCT_QUANTITY)
VALUES(order_no_seq.nextval, 9, 2, '2022-02-15', '문앞에 놔주세요', '미확정', 1);

insert into order_list
(ORDER_NO, MEMBER_NO, PRODUCT_NO, ORDER_DATE, ORDER_REQUEST, ORDER_STATUS, PRODUCT_QUANTITY)
VALUES(order_no_seq.nextval, 10, 5, '2023-07-15', '문앞에 놔주세요', '취소', 1);

--21
insert into order_list
(ORDER_NO, MEMBER_NO, PRODUCT_NO, ORDER_DATE, ORDER_REQUEST, ORDER_STATUS, PRODUCT_QUANTITY)
VALUES(order_no_seq.nextval, 11, 8, '2023-07-07', '문앞에 놔주세요', '확정', 1);

insert into order_list
(ORDER_NO, MEMBER_NO, PRODUCT_NO, ORDER_DATE, ORDER_REQUEST, ORDER_STATUS, PRODUCT_QUANTITY)
VALUES(order_no_seq.nextval, 11, 9, '2023-08-07', '문앞에 놔주세요', '미확정', 2);

insert into order_list
(ORDER_NO, MEMBER_NO, PRODUCT_NO, ORDER_DATE, ORDER_REQUEST, ORDER_STATUS, PRODUCT_QUANTITY)
VALUES(order_no_seq.nextval, 11, 6, '2023-05-07', '경비실에 맡겨주세요', '확정', 3);

insert into order_list
(ORDER_NO, MEMBER_NO, PRODUCT_NO, ORDER_DATE, ORDER_REQUEST, ORDER_STATUS, PRODUCT_QUANTITY)
VALUES(order_no_seq.nextval, 12, 2, '2022-02-15', '문앞에 놔주세요', '미확정', 1);

insert into order_list
(ORDER_NO, MEMBER_NO, PRODUCT_NO, ORDER_DATE, ORDER_REQUEST, ORDER_STATUS, PRODUCT_QUANTITY)
VALUES(order_no_seq.nextval, 12, 5, '2023-07-15', '문앞에 놔주세요', '취소', 1);

--------------------------------------------------------------------------------
--order_confirm & cancel

insert into order_confirm
(ORDER_NO, ORDER_CONFIRM_DATE)
VALUES(6, '2021-09-09');

insert into order_confirm
(ORDER_NO, ORDER_CONFIRM_DATE)
VALUES(8, '2023-09-09');

insert into order_cancel
(ORDER_NO, ORDER_CANCEL_DATE)
VALUES(10, '2023-09-09');

------

insert into order_confirm
(ORDER_NO, ORDER_CONFIRM_DATE)
VALUES(11, '2021-09-09');

insert into order_confirm
(ORDER_NO, ORDER_CONFIRM_DATE)
VALUES(13, '2023-09-09');

insert into order_cancel
(ORDER_NO, ORDER_CANCEL_DATE)
VALUES(15, '2023-09-09');

---------

insert into order_confirm
(ORDER_NO, ORDER_CONFIRM_DATE)
VALUES(16, '2021-09-09');

insert into order_confirm
(ORDER_NO, ORDER_CONFIRM_DATE)
VALUES(18, '2023-09-09');

insert into order_cancel
(ORDER_NO, ORDER_CANCEL_DATE)
VALUES(20, '2023-09-09');

---------

insert into order_confirm
(ORDER_NO, ORDER_CONFIRM_DATE)
VALUES(21, '2021-09-09');

insert into order_confirm
(ORDER_NO, ORDER_CONFIRM_DATE)
VALUES(23, '2023-09-09');

insert into order_cancel
(ORDER_NO, ORDER_CANCEL_DATE)
VALUES(25, '2023-09-09');

-----------------------------------------------------------------------------
--insert notice    

insert into notice
(NOTICE_NO, MEMBER_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_CRE_DATE)
VALUES(notice_no_seq.nextval, 1, '게시판 이용수칙에 대해서 안내해 드립니다',
    '잘부탁드립니다.', '2003-04-22');

insert into notice
(NOTICE_NO, MEMBER_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_CRE_DATE)
VALUES(notice_no_seq.nextval, 1, '홈페이지 폭주로 인한 접속 불량에 대해 사과드립니다',
    '죄송합니다.', '2005-01-25');
    
insert into notice
(NOTICE_NO, MEMBER_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_CRE_DATE)
VALUES(notice_no_seq.nextval, 1, '"어린이날 기념" 깜작 이벤트 공지입니다',
    '인기 상품들 할인 이벤트 입니다.', '2006-05-05');
    
insert into notice
(NOTICE_NO, MEMBER_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_CRE_DATE)
VALUES(notice_no_seq.nextval, 1, '새해에도 많은 이용 부탁드립니다',
    '새해 복 많이 받으세요^^', '2007-01-01');
    
insert into notice
(NOTICE_NO, MEMBER_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_CRE_DATE)
VALUES(notice_no_seq.nextval, 1, '서버 업데이트로 인한 점검안내',
    '홈페이지 서비스를 이용하실 수 없습니다.', '2008-03-01'); 
    
insert into notice
(NOTICE_NO, MEMBER_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_CRE_DATE)
VALUES(notice_no_seq.nextval, 1, '여름맞이 깜짝 할인 이벤트 진행예정',
    '많은 참여 부탁드립니다.', '2009-07-30');    
    
insert into notice
(NOTICE_NO, MEMBER_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_CRE_DATE)
VALUES(notice_no_seq.nextval, 1, '서버 업테이트로 인한 점검예정 안내',
    '홈페이지 서비스를 이용하실 수 없습니다.', '2010-09-10');
    
insert into notice
(NOTICE_NO, MEMBER_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_CRE_DATE)
VALUES(notice_no_seq.nextval, 1, '서버 업테이트로 인한 점검예정 안내',
    '홈페이지 서비스를 이용하실 수 없습니다.', '2011-11-10');
    
insert into notice
(NOTICE_NO, MEMBER_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_CRE_DATE)
VALUES(notice_no_seq.nextval, 1, '비매너 사용자 조치사항 안내',
    '경고 1회 후 추방 조치합니다.', '2012-08-20');
    
insert into notice
(NOTICE_NO, MEMBER_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_CRE_DATE)
VALUES(notice_no_seq.nextval, 1, '비매너 사용자 공개 안내',
    '비매너 사용자 목록 입니다.', '2012-09-01'); 
    
insert into notice
(NOTICE_NO, MEMBER_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_CRE_DATE)
VALUES(notice_no_seq.nextval, 1, '서버 업테이트로 인한 점검예정 안내',
    '홈페이지 서비스를 이용하실 수 없습니다.', '2013-03-01');
    
insert into notice
(NOTICE_NO, MEMBER_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_CRE_DATE)
VALUES(notice_no_seq.nextval, 1, '깜작 할인 이벤트 안내',
    '많은 이용 부탁드립니다.', '2014-04-21');      
    
insert into notice
(NOTICE_NO, MEMBER_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_CRE_DATE)
VALUES(notice_no_seq.nextval, 1, '긴급점검 안내',
    '홈페이지 서비스를 이용하실 수 없습니다.', '2015-10-12');
    
insert into notice
(NOTICE_NO, MEMBER_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_CRE_DATE)
VALUES(notice_no_seq.nextval, 1, '비매너 사용자 조치사항 안내',
    '경고 1회 후 추방 조치합니다.', '2015-10-12');
    
insert into notice
(NOTICE_NO, MEMBER_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_CRE_DATE)
VALUES(notice_no_seq.nextval, 1, '비매너 사용자 공개 안내',
    '비매너 사용자 목록 입니다.', '2015-10-20');     
    
insert into notice
(NOTICE_NO, MEMBER_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_CRE_DATE)
VALUES(notice_no_seq.nextval, 1, '서버 업테이트로 인한 점검예정 안내',
    '홈페이지 서비스를 이용하실 수 없습니다.', '2016-06-01'); 
    
insert into notice
(NOTICE_NO, MEMBER_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_CRE_DATE)
VALUES(notice_no_seq.nextval, 1, '여름맞이 깜짝 할인 이벤트 진행예정',
    '많은 참여 부탁드립니다.', '2017-07-30');    
    
insert into notice
(NOTICE_NO, MEMBER_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_CRE_DATE)
VALUES(notice_no_seq.nextval, 1, '홈페이지 폭주로 인한 접속 불량에 대해 사과드립니다',
    '죄송합니다.', '2018-02-16'); 
    
insert into notice
(NOTICE_NO, MEMBER_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_CRE_DATE)
VALUES(notice_no_seq.nextval, 1, '서버 업테이트로 인한 점검예정 안내',
    '홈페이지 서비스를 이용하실 수 없습니다.', '2019-04-01');    
    
insert into notice
(NOTICE_NO, MEMBER_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_CRE_DATE)
VALUES(notice_no_seq.nextval, 1, '깜작 할인 이벤트 안내',
    '많은 이용 부탁드립니다.', '2020-06-10');      

insert into notice
(NOTICE_NO, MEMBER_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_CRE_DATE)
VALUES(notice_no_seq.nextval, 1, '긴급점검 안내',
    '홈페이지 서비스를 이용하실 수 없습니다.', '2021-10-12');

insert into notice
(NOTICE_NO, MEMBER_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_CRE_DATE)
VALUES(notice_no_seq.nextval, 1, '크리스마스 이벤트 진행예정',
    '많은 참여 부탁드립니다.', '2022-12-24');

insert into notice
(NOTICE_NO, MEMBER_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_CRE_DATE)
VALUES(notice_no_seq.nextval, 1, '서버 업테이트로 인한 점검예정 안내',
    '홈페이지 서비스를 이용하실 수 없습니다.', '2023-05-15'); 
    
---------------------------------------------------------------------------------
--notice_reply

insert into notice_reply
(NOTICE_REPLY_NO, MEMBER_NO, NOTICE_NO, NOTICE_REPLY_CONTENT, NOTICE_REPLY_CRE_DATE)
VALUES(notice_reply_no_seq.nextval, 2, 1, '넵^^^', '2023-05-22');

insert into notice_reply
(NOTICE_REPLY_NO, MEMBER_NO, NOTICE_NO, NOTICE_REPLY_CONTENT, NOTICE_REPLY_CRE_DATE)
VALUES(notice_reply_no_seq.nextval, 3, 1, '2빠', '2023-05-23');

insert into notice_reply
(NOTICE_REPLY_NO, MEMBER_NO, NOTICE_NO, NOTICE_REPLY_CONTENT, NOTICE_REPLY_CRE_DATE)
VALUES(notice_reply_no_seq.nextval, 4, 1, '3빠', '2023-05-24');

insert into notice_reply
(NOTICE_REPLY_NO, MEMBER_NO, NOTICE_NO, NOTICE_REPLY_CONTENT, NOTICE_REPLY_CRE_DATE)
VALUES(notice_reply_no_seq.nextval, 5, 1, '저도 잘 부탁드립니다!', '2023-05-25');

insert into notice_reply
(NOTICE_REPLY_NO, MEMBER_NO, NOTICE_NO, NOTICE_REPLY_CONTENT, NOTICE_REPLY_CRE_DATE)
VALUES(notice_reply_no_seq.nextval, 6, 1, '네네!', '2023-05-27');

insert into notice_reply
(NOTICE_REPLY_NO, MEMBER_NO, NOTICE_NO, NOTICE_REPLY_CONTENT, NOTICE_REPLY_CRE_DATE)
VALUES(notice_reply_no_seq.nextval, 7, 1, '2빠', '2023-05-23');

insert into notice_reply
(NOTICE_REPLY_NO, MEMBER_NO, NOTICE_NO, NOTICE_REPLY_CONTENT, NOTICE_REPLY_CRE_DATE)
VALUES(notice_reply_no_seq.nextval, 8, 17, '1빠', '2017-08-01');

insert into notice_reply
(NOTICE_REPLY_NO, MEMBER_NO, NOTICE_NO, NOTICE_REPLY_CONTENT, NOTICE_REPLY_CRE_DATE)
VALUES(notice_reply_no_seq.nextval, 9, 17, '2빠', '2017-08-02');

insert into notice_reply
(NOTICE_REPLY_NO, MEMBER_NO, NOTICE_NO, NOTICE_REPLY_CONTENT, NOTICE_REPLY_CRE_DATE)
VALUES(notice_reply_no_seq.nextval, 10, 17, '이벤트 개꿀이넼ㅋㅋ', '2017-08-03');

insert into notice_reply
(NOTICE_REPLY_NO, MEMBER_NO, NOTICE_NO, NOTICE_REPLY_CONTENT, NOTICE_REPLY_CRE_DATE)
VALUES(notice_reply_no_seq.nextval, 11, 17, '굿', '2017-08-04');

insert into notice_reply
(NOTICE_REPLY_NO, MEMBER_NO, NOTICE_NO, NOTICE_REPLY_CONTENT, NOTICE_REPLY_CRE_DATE)
VALUES(notice_reply_no_seq.nextval, 12, 18, '1빠', '2018-02-17');

insert into notice_reply
(NOTICE_REPLY_NO, MEMBER_NO, NOTICE_NO, NOTICE_REPLY_CONTENT, NOTICE_REPLY_CRE_DATE)
VALUES(notice_reply_no_seq.nextval, 13, 18, '2빠', '2018-02-18');

insert into notice_reply
(NOTICE_REPLY_NO, MEMBER_NO, NOTICE_NO, NOTICE_REPLY_CONTENT, NOTICE_REPLY_CRE_DATE)
VALUES(notice_reply_no_seq.nextval, 14, 20, '1빠', '2020-06-11');

insert into notice_reply
(NOTICE_REPLY_NO, MEMBER_NO, NOTICE_NO, NOTICE_REPLY_CONTENT, NOTICE_REPLY_CRE_DATE)
VALUES(notice_reply_no_seq.nextval, 15, 20, '2빠', '2020-06-12');

insert into notice_reply
(NOTICE_REPLY_NO, MEMBER_NO, NOTICE_NO, NOTICE_REPLY_CONTENT, NOTICE_REPLY_CRE_DATE)
VALUES(notice_reply_no_seq.nextval, 16, 20, '3빠', '2020-06-13');

insert into notice_reply
(NOTICE_REPLY_NO, MEMBER_NO, NOTICE_NO, NOTICE_REPLY_CONTENT, NOTICE_REPLY_CRE_DATE)
VALUES(notice_reply_no_seq.nextval, 17, 21, '1빠', '2021-10-13');

insert into notice_reply
(NOTICE_REPLY_NO, MEMBER_NO, NOTICE_NO, NOTICE_REPLY_CONTENT, NOTICE_REPLY_CRE_DATE)
VALUES(notice_reply_no_seq.nextval, 18, 21, '2빠', '2021-10-14');

insert into notice_reply
(NOTICE_REPLY_NO, MEMBER_NO, NOTICE_NO, NOTICE_REPLY_CONTENT, NOTICE_REPLY_CRE_DATE)
VALUES(notice_reply_no_seq.nextval, 19, 22, '1빠 이벤트 나이스!', '2022-12-25');

insert into notice_reply
(NOTICE_REPLY_NO, MEMBER_NO, NOTICE_NO, NOTICE_REPLY_CONTENT, NOTICE_REPLY_CRE_DATE)
VALUES(notice_reply_no_seq.nextval, 20, 22, '다들 즐거운 크리스마스!!', '2022-12-25');

insert into notice_reply
(NOTICE_REPLY_NO, MEMBER_NO, NOTICE_NO, NOTICE_REPLY_CONTENT, NOTICE_REPLY_CRE_DATE)
VALUES(notice_reply_no_seq.nextval, 21, 22, '이벤트 언제까지인가요?!!', '2022-12-26');

insert into notice_reply
(NOTICE_REPLY_NO, MEMBER_NO, NOTICE_NO, NOTICE_REPLY_CONTENT, NOTICE_REPLY_CRE_DATE)
VALUES(notice_reply_no_seq.nextval, 4, 23, '1빠', '2023-05-16');

insert into notice_reply
(NOTICE_REPLY_NO, MEMBER_NO, NOTICE_NO, NOTICE_REPLY_CONTENT, NOTICE_REPLY_CRE_DATE)
VALUES(notice_reply_no_seq.nextval, 8, 23, '2빠', '2023-05-17');

insert into notice_reply
(NOTICE_REPLY_NO, MEMBER_NO, NOTICE_NO, NOTICE_REPLY_CONTENT, NOTICE_REPLY_CRE_DATE)
VALUES(notice_reply_no_seq.nextval, 10, 23, '3빠', '2023-05-18');

insert into notice_reply
(NOTICE_REPLY_NO, MEMBER_NO, NOTICE_NO, NOTICE_REPLY_CONTENT, NOTICE_REPLY_CRE_DATE)
VALUES(notice_reply_no_seq.nextval, 13, 23, '점검은 매주 하나요?', '2023-05-19');

insert into notice_reply
(NOTICE_REPLY_NO, MEMBER_NO, NOTICE_NO, NOTICE_REPLY_CONTENT, NOTICE_REPLY_CRE_DATE)
VALUES(notice_reply_no_seq.nextval, 16, 23, '매주 하는거는 아닌거 같아요', '2023-05-20');

insert into notice_reply
(NOTICE_REPLY_NO, MEMBER_NO, NOTICE_NO, NOTICE_REPLY_CONTENT, NOTICE_REPLY_CRE_DATE)
VALUES(notice_reply_no_seq.nextval, 13, 23, '네 감사합니다(__)', '2023-05-21');

---------------------------------------------------------------------------------
--review_reply
insert into review_reply
(REVIEW_REPLY_NO, MEMBER_NO, REVIEW_NO, REVIEW_REPLY_CONTENT, REVIEW_REPLY_CRE_DATE)
VALUES(review_reply_no_seq.nextval, 2, 1, '장난감 사고싶다', '2023-06-02');

insert into review_reply
(REVIEW_REPLY_NO, MEMBER_NO, REVIEW_NO, REVIEW_REPLY_CONTENT, REVIEW_REPLY_CRE_DATE)
VALUES(review_reply_no_seq.nextval, 3, 1, '쓸만 한가요?', '2023-06-05');

insert into review_reply
(REVIEW_REPLY_NO, MEMBER_NO, REVIEW_NO, REVIEW_REPLY_CONTENT, REVIEW_REPLY_CRE_DATE)
VALUES(review_reply_no_seq.nextval, 3, 2, '저도 한번 사봐야겠네요', '2023-06-03');

insert into review_reply
(REVIEW_REPLY_NO, MEMBER_NO, REVIEW_NO, REVIEW_REPLY_CONTENT, REVIEW_REPLY_CRE_DATE)
VALUES(review_reply_no_seq.nextval, 4, 3, '저도 한번 사봐야겠네요', '2023-06-04');

insert into review_reply
(REVIEW_REPLY_NO, MEMBER_NO, REVIEW_NO, REVIEW_REPLY_CONTENT, REVIEW_REPLY_CRE_DATE)
VALUES(review_reply_no_seq.nextval, 5, 4, '저도 사보고 후기 남길게요', '2023-06-06');

insert into review_reply
(REVIEW_REPLY_NO, MEMBER_NO, REVIEW_NO, REVIEW_REPLY_CONTENT, REVIEW_REPLY_CRE_DATE)
VALUES(review_reply_no_seq.nextval, 6, 5, '후기가 좋네요ㅎㅎ', '2023-06-06');

insert into review_reply
(REVIEW_REPLY_NO, MEMBER_NO, REVIEW_NO, REVIEW_REPLY_CONTENT, REVIEW_REPLY_CRE_DATE)
VALUES(review_reply_no_seq.nextval, 7, 6, '오 사보고 싶다ㅎㅎ', '2023-06-07');

insert into review_reply
(REVIEW_REPLY_NO, MEMBER_NO, REVIEW_NO, REVIEW_REPLY_CONTENT, REVIEW_REPLY_CRE_DATE)
VALUES(review_reply_no_seq.nextval, 8, 7, '오 좋아보이네요', '2023-07-09');

insert into review_reply
(REVIEW_REPLY_NO, MEMBER_NO, REVIEW_NO, REVIEW_REPLY_CONTENT, REVIEW_REPLY_CRE_DATE)
VALUES(review_reply_no_seq.nextval, 7, 8, '딱봐도 좋아보이네요', '2023-07-10');

insert into review_reply
(REVIEW_REPLY_NO, MEMBER_NO, REVIEW_NO, REVIEW_REPLY_CONTENT, REVIEW_REPLY_CRE_DATE)
VALUES(review_reply_no_seq.nextval, 8, 9, '돈값 하나요?', '2023-07-11');

insert into review_reply
(REVIEW_REPLY_NO, MEMBER_NO, REVIEW_NO, REVIEW_REPLY_CONTENT, REVIEW_REPLY_CRE_DATE)
VALUES(review_reply_no_seq.nextval, 9, 9, '좋아보이긴 하네요?', '2023-07-11');

insert into review_reply
(REVIEW_REPLY_NO, MEMBER_NO, REVIEW_NO, REVIEW_REPLY_CONTENT, REVIEW_REPLY_CRE_DATE)
VALUES(review_reply_no_seq.nextval, 10, 9, '저도 비슷한거 있는데 쓸만해요?', '2023-07-12');

insert into review_reply
(REVIEW_REPLY_NO, MEMBER_NO, REVIEW_NO, REVIEW_REPLY_CONTENT, REVIEW_REPLY_CRE_DATE)
VALUES(review_reply_no_seq.nextval, 11, 10, '저도 이거 먹이는데 좋아요!', '2023-07-11');

insert into review_reply
(REVIEW_REPLY_NO, MEMBER_NO, REVIEW_NO, REVIEW_REPLY_CONTENT, REVIEW_REPLY_CRE_DATE)
VALUES(review_reply_no_seq.nextval, 12, 10, '오 그럼 저도 한번 사봐야겠네요!', '2023-07-12');

insert into review_reply
(REVIEW_REPLY_NO, MEMBER_NO, REVIEW_NO, REVIEW_REPLY_CONTENT, REVIEW_REPLY_CRE_DATE)
VALUES(review_reply_no_seq.nextval, 11, 10, '네 추천합니다!!', '2023-07-13');

insert into review_reply
(REVIEW_REPLY_NO, MEMBER_NO, REVIEW_NO, REVIEW_REPLY_CONTENT, REVIEW_REPLY_CRE_DATE)
VALUES(review_reply_no_seq.nextval, 12, 11, '저도 사용해봤는데 좋던데요?!!', '2023-07-18');

insert into review_reply
(REVIEW_REPLY_NO, MEMBER_NO, REVIEW_NO, REVIEW_REPLY_CONTENT, REVIEW_REPLY_CRE_DATE)
VALUES(review_reply_no_seq.nextval, 13, 11, '케바케 같은데요?!!', '2023-07-18');

insert into review_reply
(REVIEW_REPLY_NO, MEMBER_NO, REVIEW_NO, REVIEW_REPLY_CONTENT, REVIEW_REPLY_CRE_DATE)
VALUES(review_reply_no_seq.nextval, 14, 11, '가격 생각하면 참고 쓸만함!', '2023-07-19');

insert into review_reply
(REVIEW_REPLY_NO, MEMBER_NO, REVIEW_NO, REVIEW_REPLY_CONTENT, REVIEW_REPLY_CRE_DATE)
VALUES(review_reply_no_seq.nextval, 15, 12, '좋아 보이긴 하네요!!', '2023-07-19');

insert into review_reply
(REVIEW_REPLY_NO, MEMBER_NO, REVIEW_NO, REVIEW_REPLY_CONTENT, REVIEW_REPLY_CRE_DATE)
VALUES(review_reply_no_seq.nextval, 16, 12, '한번 써보고 후기 남겨야 겠네요', '2023-07-20');

insert into review_reply
(REVIEW_REPLY_NO, MEMBER_NO, REVIEW_NO, REVIEW_REPLY_CONTENT, REVIEW_REPLY_CRE_DATE)
VALUES(review_reply_no_seq.nextval, 16, 13, '한번 써보고 후기 남겨야 겠네요', '2023-07-20');

insert into review_reply
(REVIEW_REPLY_NO, MEMBER_NO, REVIEW_NO, REVIEW_REPLY_CONTENT, REVIEW_REPLY_CRE_DATE)
VALUES(review_reply_no_seq.nextval, 17, 13, '전 그럼 후기 보고 구매할게요 ㅎㅎㅎ', '2023-07-21');

insert into review_reply
(REVIEW_REPLY_NO, MEMBER_NO, REVIEW_NO, REVIEW_REPLY_CONTENT, REVIEW_REPLY_CRE_DATE)
VALUES(review_reply_no_seq.nextval, 18, 14, '저도 쓸만한거 같은데요 ㅎ', '2023-07-20');

insert into review_reply
(REVIEW_REPLY_NO, MEMBER_NO, REVIEW_NO, REVIEW_REPLY_CONTENT, REVIEW_REPLY_CRE_DATE)
VALUES(review_reply_no_seq.nextval, 19, 14, '저도 괜찮았던거 같아요', '2023-07-21');

insert into review_reply
(REVIEW_REPLY_NO, MEMBER_NO, REVIEW_NO, REVIEW_REPLY_CONTENT, REVIEW_REPLY_CRE_DATE)
VALUES(review_reply_no_seq.nextval, 20, 14, '저도여 ㅎㅎ', '2023-07-22');

insert into review_reply
(REVIEW_REPLY_NO, MEMBER_NO, REVIEW_NO, REVIEW_REPLY_CONTENT, REVIEW_REPLY_CRE_DATE)
VALUES(review_reply_no_seq.nextval, 21, 15, '저도여 잘쓰고있어요', '2023-07-21');

insert into review_reply
(REVIEW_REPLY_NO, MEMBER_NO, REVIEW_NO, REVIEW_REPLY_CONTENT, REVIEW_REPLY_CRE_DATE)
VALUES(review_reply_no_seq.nextval, 22, 15, '저도여 ㅋ', '2023-07-22');

insert into review_reply
(REVIEW_REPLY_NO, MEMBER_NO, REVIEW_NO, REVIEW_REPLY_CONTENT, REVIEW_REPLY_CRE_DATE)
VALUES(review_reply_no_seq.nextval, 2, 15, '구매 한번 해봐야겠네요', '2023-07-22');

insert into review_reply
(REVIEW_REPLY_NO, MEMBER_NO, REVIEW_NO, REVIEW_REPLY_CONTENT, REVIEW_REPLY_CRE_DATE)
VALUES(review_reply_no_seq.nextval, 10, 15, '좋아보이는데 왜 그러지?', '2023-07-23');

insert into review_reply
(REVIEW_REPLY_NO, MEMBER_NO, REVIEW_NO, REVIEW_REPLY_CONTENT, REVIEW_REPLY_CRE_DATE)
VALUES(review_reply_no_seq.nextval, 11, 15, '가격대비 별로인가?', '2023-07-24');

insert into review_reply
(REVIEW_REPLY_NO, MEMBER_NO, REVIEW_NO, REVIEW_REPLY_CONTENT, REVIEW_REPLY_CRE_DATE)
VALUES(review_reply_no_seq.nextval, 12, 15, '한번 써보고 후기 남겨야겠네요 ㅋ', '2023-07-25');

-------------------------------------------------------------------------------
--inquiry

insert into inquiry
(INQUIRY_NO, MEMBER_NO, INQUIRY_TYPE, MEMBER_NAME, INQUIRY_CRE_DATE,
    INQUIRY_TITLE, INQUIRY_CONTENT, INQUIRY_IS_REPLY)
VALUES(inquiry_no_seq.nextval, 2, '회원', '자르반', '2003-09-20',
    '안녕하세요', '인사해주세요', 'Y');

insert into inquiry
(INQUIRY_NO, MEMBER_NO, INQUIRY_TYPE, MEMBER_NAME, INQUIRY_CRE_DATE,
    INQUIRY_TITLE, INQUIRY_CONTENT, INQUIRY_IS_REPLY)
VALUES(inquiry_no_seq.nextval, 3, '상품', '임정빈', '2013-07-03',
    '상품교환하고싶어요', '상품교환어떻게하나요?', 'N');

insert into inquiry
(INQUIRY_NO, MEMBER_NO, INQUIRY_TYPE, MEMBER_NAME, INQUIRY_CRE_DATE,
    INQUIRY_TITLE, INQUIRY_CONTENT, INQUIRY_IS_REPLY)
VALUES(inquiry_no_seq.nextval, 4, '상품', '손진언', '2014-01-13',
    '물건을 받긴했는데 환불하고 싶어요', '환불이나 교환 가능한가요?', 'Y');
    
insert into inquiry
(INQUIRY_NO, MEMBER_NO, INQUIRY_TYPE, MEMBER_NAME, INQUIRY_CRE_DATE,
    INQUIRY_TITLE, INQUIRY_CONTENT, INQUIRY_IS_REPLY)
VALUES(inquiry_no_seq.nextval, 5, '상품', '김찬우', '2014-02-07',
    '구매한 상품이 사진이랑 좀 다른데요?', '이거 사기 아닌가요?', 'Y');    
    
insert into inquiry
(INQUIRY_NO, MEMBER_NO, INQUIRY_TYPE, MEMBER_NAME, INQUIRY_CRE_DATE,
    INQUIRY_TITLE, INQUIRY_CONTENT, INQUIRY_IS_REPLY)
VALUES(inquiry_no_seq.nextval, 6, '회원', '박지운', '2015-05-02',
    '회원 탈퇴 문의 드립니다', '탈퇴는 어디서 하는건가요?', 'Y');
    
insert into inquiry
(INQUIRY_NO, MEMBER_NO, INQUIRY_TYPE, MEMBER_NAME, INQUIRY_CRE_DATE,
    INQUIRY_TITLE, INQUIRY_CONTENT, INQUIRY_IS_REPLY)
VALUES(inquiry_no_seq.nextval, 7, '상품', '임영빈', '2016-09-16',
    '배송 주소가 바꼈습니다 ㅜㅜ', '주소 수정할순 없나요?', 'Y');
    
insert into inquiry
(INQUIRY_NO, MEMBER_NO, INQUIRY_TYPE, MEMBER_NAME, INQUIRY_CRE_DATE,
    INQUIRY_TITLE, INQUIRY_CONTENT, INQUIRY_IS_REPLY)
VALUES(inquiry_no_seq.nextval, 8, '상품', '손진온', '2017-02-20',
    '상품 품질 이게 맞나요?', '취소 하고 싶어요.', 'Y');    
    
insert into inquiry
(INQUIRY_NO, MEMBER_NO, INQUIRY_TYPE, MEMBER_NAME, INQUIRY_CRE_DATE,
    INQUIRY_TITLE, INQUIRY_CONTENT, INQUIRY_IS_REPLY)
VALUES(inquiry_no_seq.nextval, 9, '상품', '이찬우', '2017-05-30',
    '물건 잘 받았습니다. 근데', '하자가 조금 있어서 교환될까요?', 'Y');
    
insert into inquiry
(INQUIRY_NO, MEMBER_NO, INQUIRY_TYPE, MEMBER_NAME, INQUIRY_CRE_DATE,
    INQUIRY_TITLE, INQUIRY_CONTENT, INQUIRY_IS_REPLY)
VALUES(inquiry_no_seq.nextval, 11, '회원', '김정빈', '2018-06-12',
    '회원 정보 수정에 대해서 문의드립니다', '어디서 수정하나요?', 'Y');
    
insert into inquiry
(INQUIRY_NO, MEMBER_NO, INQUIRY_TYPE, MEMBER_NAME, INQUIRY_CRE_DATE,
    INQUIRY_TITLE, INQUIRY_CONTENT, INQUIRY_IS_REPLY)
VALUES(inquiry_no_seq.nextval, 12, '상품', '손신원', '2018-07-20',
    '상품 불량이 왔습니다', '환불처리 해주세요.', 'Y');
    
insert into inquiry
(INQUIRY_NO, MEMBER_NO, INQUIRY_TYPE, MEMBER_NAME, INQUIRY_CRE_DATE,
    INQUIRY_TITLE, INQUIRY_CONTENT, INQUIRY_IS_REPLY)
VALUES(inquiry_no_seq.nextval, 13, '상품', '온찬우', '2019-02-16',
    '상품 잘 받았습니다', '수고하세요.', 'Y');  
    
insert into inquiry
(INQUIRY_NO, MEMBER_NO, INQUIRY_TYPE, MEMBER_NAME, INQUIRY_CRE_DATE,
    INQUIRY_TITLE, INQUIRY_CONTENT, INQUIRY_IS_REPLY)
VALUES(inquiry_no_seq.nextval, 14, '상품', '박미성', '2019-04-20',
    '배송 지연에 대해서 문의 드립니다', '배송은 바로 오는건가야?', 'Y');     

insert into inquiry
(INQUIRY_NO, MEMBER_NO, INQUIRY_TYPE, MEMBER_NAME, INQUIRY_CRE_DATE,
    INQUIRY_TITLE, INQUIRY_CONTENT, INQUIRY_IS_REPLY)
VALUES(inquiry_no_seq.nextval, 15, '상품', '임정민', '2020-03-11',
    '상품 재고 수량은 언제 채워지나요?', '구매하고 싶은 물건이 재고가 없네요', 'Y');

insert into inquiry
(INQUIRY_NO, MEMBER_NO, INQUIRY_TYPE, MEMBER_NAME, INQUIRY_CRE_DATE,
    INQUIRY_TITLE, INQUIRY_CONTENT, INQUIRY_IS_REPLY)
VALUES(inquiry_no_seq.nextval, 16, '회원', '김양원', '2020-05-16',
    '회원가입할때 정보를 잘못적었어요', '정보 수정 어디서 하나요?', 'Y');    

insert into inquiry
(INQUIRY_NO, MEMBER_NO, INQUIRY_TYPE, MEMBER_NAME, INQUIRY_CRE_DATE,
    INQUIRY_TITLE, INQUIRY_CONTENT, INQUIRY_IS_REPLY)
VALUES(inquiry_no_seq.nextval, 17, '상품', '김세윤', '2020-07-05',
    '교환문의 드립니다', '교환좀 해주세요', 'Y');   
    
insert into inquiry
(INQUIRY_NO, MEMBER_NO, INQUIRY_TYPE, MEMBER_NAME, INQUIRY_CRE_DATE,
    INQUIRY_TITLE, INQUIRY_CONTENT, INQUIRY_IS_REPLY)
VALUES(inquiry_no_seq.nextval, 18, '회원', '김희도', '2020-09-16',
    '가입하고 처음 문의드립니다', '포인트가 제대로 적립된건가요?', 'Y');     

insert into inquiry
(INQUIRY_NO, MEMBER_NO, INQUIRY_TYPE, MEMBER_NAME, INQUIRY_CRE_DATE,
    INQUIRY_TITLE, INQUIRY_CONTENT, INQUIRY_IS_REPLY)
VALUES(inquiry_no_seq.nextval, 19, '상품', '김태구', '2021-02-05',
    '상품 문의 드립니다', '상품이 잘못온거 같은데 확인해주세요.', 'N'); 
    
insert into inquiry
(INQUIRY_NO, MEMBER_NO, INQUIRY_TYPE, MEMBER_NAME, INQUIRY_CRE_DATE,
    INQUIRY_TITLE, INQUIRY_CONTENT, INQUIRY_IS_REPLY)
VALUES(inquiry_no_seq.nextval, 20, '상품', '송하위', '2022-08-05',
    '배송관련 궁금한점 문의드립니다', '배송중 물건이 파손되면 환불되나요?.', 'N');
    
insert into inquiry
(INQUIRY_NO, MEMBER_NO, INQUIRY_TYPE, MEMBER_NAME, INQUIRY_CRE_DATE,
    INQUIRY_TITLE, INQUIRY_CONTENT, INQUIRY_IS_REPLY)
VALUES(inquiry_no_seq.nextval, 21, '회원', '감이안', '2023-03-02',
    '회원정보 관련 문의드려요', '제가 개명을해서 이름이 바꼈는데 수정되나요?', 'N');
    
---------------------------------------------------------------------------------
--reply

insert into reply
(INQUIRY_NO, MEMBER_NO, REPLY_CRE_DATE, REPLY_MEMBER_NAME, REPLY_TITLE, REPLY_CONTENT)
VALUES(1, 1, '2003-09-21', '관리자', '안녕하세요', '반갑습니다^^');

insert into reply
(INQUIRY_NO, MEMBER_NO, REPLY_CRE_DATE, REPLY_MEMBER_NAME, REPLY_TITLE, REPLY_CONTENT)
VALUES(3, 1, '2014-01-14', '관리자', '환불 문의 답변입니다', '정확한 사유를 적어주시면 절차에 따라 가능합니다');

insert into reply
(INQUIRY_NO, MEMBER_NO, REPLY_CRE_DATE, REPLY_MEMBER_NAME, REPLY_TITLE, REPLY_CONTENT)
VALUES(4, 1, '2014-02-08', '관리자', '상품 문의 답변입니다', '이미지와 본상품은 다소 차이가 있을수 있습니다');

insert into reply
(INQUIRY_NO, MEMBER_NO, REPLY_CRE_DATE, REPLY_MEMBER_NAME, REPLY_TITLE, REPLY_CONTENT)
VALUES(5, 1, '2015-05-03', '관리자', '회원 문의 답변입니다', '마이댕댕 페이지에서 가능합니다');

insert into reply
(INQUIRY_NO, MEMBER_NO, REPLY_CRE_DATE, REPLY_MEMBER_NAME, REPLY_TITLE, REPLY_CONTENT)
VALUES(6, 1, '2016-09-17', '관리자', '상품 문의 답변입니다', '개인정보 수정은 마이댕댕 페이지에서 가능합니다');

insert into reply
(INQUIRY_NO, MEMBER_NO, REPLY_CRE_DATE, REPLY_MEMBER_NAME, REPLY_TITLE, REPLY_CONTENT)
VALUES(7, 1, '2017-02-21', '관리자', '상품 문의 답변입니다', '구매확정하신 상품은 취소가 불가능합니다');

insert into reply
(INQUIRY_NO, MEMBER_NO, REPLY_CRE_DATE, REPLY_MEMBER_NAME, REPLY_TITLE, REPLY_CONTENT)
VALUES(8, 1, '2017-06-01', '관리자', '상품 문의 답변입니다', '구매확정하신 상품은 취소가 불가능합니다');

insert into reply
(INQUIRY_NO, MEMBER_NO, REPLY_CRE_DATE, REPLY_MEMBER_NAME, REPLY_TITLE, REPLY_CONTENT)
VALUES(9, 1, '2018-06-13', '관리자', '회원 문의 답변입니다', '마이댕댕 페이지에서 가능합니다');

insert into reply
(INQUIRY_NO, MEMBER_NO, REPLY_CRE_DATE, REPLY_MEMBER_NAME, REPLY_TITLE, REPLY_CONTENT)
VALUES(10, 1, '2018-07-21', '관리자', '상품 문의 답변입니다', '구매확정하신 상품은 취소나 환불이 불가능합니다');

insert into reply
(INQUIRY_NO, MEMBER_NO, REPLY_CRE_DATE, REPLY_MEMBER_NAME, REPLY_TITLE, REPLY_CONTENT)
VALUES(11, 1, '2019-02-17', '관리자', '상품 문의 답변입니다', '네 감사합니다 좋은하루 되세요^^');

insert into reply
(INQUIRY_NO, MEMBER_NO, REPLY_CRE_DATE, REPLY_MEMBER_NAME, REPLY_TITLE, REPLY_CONTENT)
VALUES(12, 1, '2019-04-21', '관리자', '상품 문의 답변입니다', '네 배송은 즉시 됩니다.');

insert into reply
(INQUIRY_NO, MEMBER_NO, REPLY_CRE_DATE, REPLY_MEMBER_NAME, REPLY_TITLE, REPLY_CONTENT)
VALUES(13, 1, '2020-03-12', '관리자', '상품 문의 답변입니다', '상품 재고가 들어오는대로 이용 가능합니다. 불편을 드려서 죄송합니다.');

insert into reply
(INQUIRY_NO, MEMBER_NO, REPLY_CRE_DATE, REPLY_MEMBER_NAME, REPLY_TITLE, REPLY_CONTENT)
VALUES(14, 1, '2020-05-17', '관리자', '회원 문의 답변입니다', '마이댕댕 페이지에서 가능합니다');

insert into reply
(INQUIRY_NO, MEMBER_NO, REPLY_CRE_DATE, REPLY_MEMBER_NAME, REPLY_TITLE, REPLY_CONTENT)
VALUES(15, 1, '2020-07-06', '관리자', '상품 문의 답변입니다', '구매확정하신 상품은 취소나 환불이 불가능합니다');

insert into reply
(INQUIRY_NO, MEMBER_NO, REPLY_CRE_DATE, REPLY_MEMBER_NAME, REPLY_TITLE, REPLY_CONTENT)
VALUES(16, 1, '2020-09-17', '관리자', '회원 문의 답변입니다', '네 구매하신 물품에 대하여 포인트는 적립되고 있습니다.');

----------------------------------------------------------------------------------
--member_charge
Insert into DEMO.MEMBER_CHARGE (MEMBER_CHARGE_NO,MEMBER_NO,MEMBER_CHARGE_AMOUNT,MEMBER_CHARGE_DATE) values (member_charge_no_seq.nextval,2,10000,'22-05-30');
Insert into DEMO.MEMBER_CHARGE (MEMBER_CHARGE_NO,MEMBER_NO,MEMBER_CHARGE_AMOUNT,MEMBER_CHARGE_DATE) values (member_charge_no_seq.nextval,2,50000,'22-08-30');
Insert into DEMO.MEMBER_CHARGE (MEMBER_CHARGE_NO,MEMBER_NO,MEMBER_CHARGE_AMOUNT,MEMBER_CHARGE_DATE) values (member_charge_no_seq.nextval,3,10000,'23-04-12');
Insert into DEMO.MEMBER_CHARGE (MEMBER_CHARGE_NO,MEMBER_NO,MEMBER_CHARGE_AMOUNT,MEMBER_CHARGE_DATE) values (member_charge_no_seq.nextval,4,30000,'23-06-30');
Insert into DEMO.MEMBER_CHARGE (MEMBER_CHARGE_NO,MEMBER_NO,MEMBER_CHARGE_AMOUNT,MEMBER_CHARGE_DATE) values (member_charge_no_seq.nextval,4,10000,'22-05-30');
Insert into DEMO.MEMBER_CHARGE (MEMBER_CHARGE_NO,MEMBER_NO,MEMBER_CHARGE_AMOUNT,MEMBER_CHARGE_DATE) values (member_charge_no_seq.nextval,5,10000,'22-08-12');
Insert into DEMO.MEMBER_CHARGE (MEMBER_CHARGE_NO,MEMBER_NO,MEMBER_CHARGE_AMOUNT,MEMBER_CHARGE_DATE) values (member_charge_no_seq.nextval,5,10000,'22-12-13');
Insert into DEMO.MEMBER_CHARGE (MEMBER_CHARGE_NO,MEMBER_NO,MEMBER_CHARGE_AMOUNT,MEMBER_CHARGE_DATE) values (member_charge_no_seq.nextval,2,50000,'23-10-08');
Insert into DEMO.MEMBER_CHARGE (MEMBER_CHARGE_NO,MEMBER_NO,MEMBER_CHARGE_AMOUNT,MEMBER_CHARGE_DATE) values (member_charge_no_seq.nextval,4,30000,'23-10-08');
Insert into DEMO.MEMBER_CHARGE (MEMBER_CHARGE_NO,MEMBER_NO,MEMBER_CHARGE_AMOUNT,MEMBER_CHARGE_DATE) values (member_charge_no_seq.nextval,5,60000,'23-10-08');
Insert into DEMO.MEMBER_CHARGE (MEMBER_CHARGE_NO,MEMBER_NO,MEMBER_CHARGE_AMOUNT,MEMBER_CHARGE_DATE) values (member_charge_no_seq.nextval,5,40000,'23-10-08');
Insert into DEMO.MEMBER_CHARGE (MEMBER_CHARGE_NO,MEMBER_NO,MEMBER_CHARGE_AMOUNT,MEMBER_CHARGE_DATE) values (member_charge_no_seq.nextval,6,85000,'23-10-08');
Insert into DEMO.MEMBER_CHARGE (MEMBER_CHARGE_NO,MEMBER_NO,MEMBER_CHARGE_AMOUNT,MEMBER_CHARGE_DATE) values (member_charge_no_seq.nextval,7,90000,'23-10-08');
Insert into DEMO.MEMBER_CHARGE (MEMBER_CHARGE_NO,MEMBER_NO,MEMBER_CHARGE_AMOUNT,MEMBER_CHARGE_DATE) values (member_charge_no_seq.nextval,8,17000,'23-10-08');
Insert into DEMO.MEMBER_CHARGE (MEMBER_CHARGE_NO,MEMBER_NO,MEMBER_CHARGE_AMOUNT,MEMBER_CHARGE_DATE) values (member_charge_no_seq.nextval,9,80000,'23-10-08');
Insert into DEMO.MEMBER_CHARGE (MEMBER_CHARGE_NO,MEMBER_NO,MEMBER_CHARGE_AMOUNT,MEMBER_CHARGE_DATE) values (member_charge_no_seq.nextval,10,70000,'23-10-08');
Insert into DEMO.MEMBER_CHARGE (MEMBER_CHARGE_NO,MEMBER_NO,MEMBER_CHARGE_AMOUNT,MEMBER_CHARGE_DATE) values (member_charge_no_seq.nextval,11,40000,'23-10-08');
Insert into DEMO.MEMBER_CHARGE (MEMBER_CHARGE_NO,MEMBER_NO,MEMBER_CHARGE_AMOUNT,MEMBER_CHARGE_DATE) values (member_charge_no_seq.nextval,12,40000,'23-10-08');
Insert into DEMO.MEMBER_CHARGE (MEMBER_CHARGE_NO,MEMBER_NO,MEMBER_CHARGE_AMOUNT,MEMBER_CHARGE_DATE) values (member_charge_no_seq.nextval,12,20000,'23-10-08');
Insert into DEMO.MEMBER_CHARGE (MEMBER_CHARGE_NO,MEMBER_NO,MEMBER_CHARGE_AMOUNT,MEMBER_CHARGE_DATE) values (member_charge_no_seq.nextval,13,7777,'23-10-08');
Insert into DEMO.MEMBER_CHARGE (MEMBER_CHARGE_NO,MEMBER_NO,MEMBER_CHARGE_AMOUNT,MEMBER_CHARGE_DATE) values (member_charge_no_seq.nextval,13,18000,'23-10-08');
Insert into DEMO.MEMBER_CHARGE (MEMBER_CHARGE_NO,MEMBER_NO,MEMBER_CHARGE_AMOUNT,MEMBER_CHARGE_DATE) values (member_charge_no_seq.nextval,14,60000,'23-10-08');
Insert into DEMO.MEMBER_CHARGE (MEMBER_CHARGE_NO,MEMBER_NO,MEMBER_CHARGE_AMOUNT,MEMBER_CHARGE_DATE) values (member_charge_no_seq.nextval,15,65000,'23-10-08');
Insert into DEMO.MEMBER_CHARGE (MEMBER_CHARGE_NO,MEMBER_NO,MEMBER_CHARGE_AMOUNT,MEMBER_CHARGE_DATE) values (member_charge_no_seq.nextval,16,38000,'23-10-08');

--------------------------------------------------------------------------------------
--review
insert into review
(REVIEW_NO, MEMBER_NO, PRODUCT_NO, REVIEW_TITLE, REVIEW_CONTENT,
    REVIEW_CRE_DATE, REVIEW_MOD_DATE)
VALUES(review_no_seq.nextval, 11, 6, '잘받았습니다', '강아지가 정말 좋아하는것 같아요',
    '2023-06-01', '2023-06-01');

insert into review
(REVIEW_NO, MEMBER_NO, PRODUCT_NO, REVIEW_TITLE, REVIEW_CONTENT,
    REVIEW_CRE_DATE, REVIEW_MOD_DATE)
VALUES(review_no_seq.nextval, 7, 6, '생각보다 좋네요', '언제 질려할지 모르지만 만족합니다',
    '2023-06-02', '2023-06-02');

insert into review
(REVIEW_NO, MEMBER_NO, PRODUCT_NO, REVIEW_TITLE, REVIEW_CONTENT,
    REVIEW_CRE_DATE, REVIEW_MOD_DATE)
VALUES(review_no_seq.nextval, 3, 3, '가성비 좋은것 같아요', '상품 가격대비 만족합니다',
    '2023-06-03', '2023-06-03');
    
insert into review
(REVIEW_NO, MEMBER_NO, PRODUCT_NO, REVIEW_TITLE, REVIEW_CONTENT,
    REVIEW_CRE_DATE, REVIEW_MOD_DATE)
VALUES(review_no_seq.nextval, 4, 3, '첫구매 해봤습니다', '믿고 구매하셔도 될것 같아요',
    '2023-06-05', '2023-06-05');
    
insert into review
(REVIEW_NO, MEMBER_NO, PRODUCT_NO, REVIEW_TITLE, REVIEW_CONTENT,
    REVIEW_CRE_DATE, REVIEW_MOD_DATE)
VALUES(review_no_seq.nextval, 9, 6, '오늘 받았습니다', '가성비 좋고 만족합니다',
    '2023-06-05', '2023-06-05');
    
insert into review
(REVIEW_NO, MEMBER_NO, PRODUCT_NO, REVIEW_TITLE, REVIEW_CONTENT,
    REVIEW_CRE_DATE, REVIEW_MOD_DATE)
VALUES(review_no_seq.nextval, 2, 3, '강아지 간식으로 추천합니다', '좋은제품 잘 샀습니다^^',
    '2023-06-06', '2023-06-06');

insert into review
(REVIEW_NO, MEMBER_NO, PRODUCT_NO, REVIEW_TITLE, REVIEW_CONTENT,
    REVIEW_CRE_DATE, REVIEW_MOD_DATE)
VALUES(review_no_seq.nextval, 9, 8, '제품 너무 만족합니다', '좋은제품 잘 샀습니다^^',
    '2023-07-08', '2023-07-08');

insert into review
(REVIEW_NO, MEMBER_NO, PRODUCT_NO, REVIEW_TITLE, REVIEW_CONTENT,
    REVIEW_CRE_DATE, REVIEW_MOD_DATE)
VALUES(review_no_seq.nextval, 7, 3, '후기입니다', '믿고 구매하셔도 될것 같아요',
    '2023-07-09', '2023-07-09');

insert into review
(REVIEW_NO, MEMBER_NO, PRODUCT_NO, REVIEW_TITLE, REVIEW_CONTENT,
    REVIEW_CRE_DATE, REVIEW_MOD_DATE)
VALUES(review_no_seq.nextval, 11, 8, '너무 좋습니다', '가격대비 튼튼해요^^',
    '2023-07-10', '2023-07-10');

insert into review
(REVIEW_NO, MEMBER_NO, PRODUCT_NO, REVIEW_TITLE, REVIEW_CONTENT,
    REVIEW_CRE_DATE, REVIEW_MOD_DATE)
VALUES(review_no_seq.nextval, 2, 1, '물건 잘 받았습니다', '좋네요^^',
    '2023-07-10', '2023-07-10');

insert into review
(REVIEW_NO, MEMBER_NO, PRODUCT_NO, REVIEW_TITLE, REVIEW_CONTENT,
    REVIEW_CRE_DATE, REVIEW_MOD_DATE)
VALUES(review_no_seq.nextval, 10, 5, '예상보다 별로네요', '만족도가 낮네요 ㅜㅜ',
    '2023-07-17', '2023-07-17');

insert into review
(REVIEW_NO, MEMBER_NO, PRODUCT_NO, REVIEW_TITLE, REVIEW_CONTENT,
    REVIEW_CRE_DATE, REVIEW_MOD_DATE)
VALUES(review_no_seq.nextval, 12, 5, '만족합니다', '좋아요!!',
    '2023-07-18', '2023-07-18');

insert into review
(REVIEW_NO, MEMBER_NO, PRODUCT_NO, REVIEW_TITLE, REVIEW_CONTENT,
    REVIEW_CRE_DATE, REVIEW_MOD_DATE)
VALUES(review_no_seq.nextval, 5, 5, '좋을줄 알았는데', '비추요!!',
    '2023-07-19', '2023-07-19');

insert into review
(REVIEW_NO, MEMBER_NO, PRODUCT_NO, REVIEW_TITLE, REVIEW_CONTENT,
    REVIEW_CRE_DATE, REVIEW_MOD_DATE)
VALUES(review_no_seq.nextval, 8, 5, '왜 비추가 있는지 모르겠네요', '저는 좋아요!',
    '2023-07-19', '2023-07-19');
    
insert into review
(REVIEW_NO, MEMBER_NO, PRODUCT_NO, REVIEW_TITLE, REVIEW_CONTENT,
    REVIEW_CRE_DATE, REVIEW_MOD_DATE)
VALUES(review_no_seq.nextval, 6, 5, '솔직한 후기요', '그렇저렇 쓸만합니다',
    '2023-07-20', '2023-07-20');
    
------------------------------------------------------------------------
--cart
insert into cart
(PRODUCT_NO, MEMBER_NO, PRODUCT_NAME, PRODUCT_PRICE, PRODUCT_QUANTITY)
VALUES(1, 2, '전경용 kg 루이E 10', 33500, 1);

insert into cart
(PRODUCT_NO, MEMBER_NO, PRODUCT_NAME, PRODUCT_PRICE, PRODUCT_QUANTITY)
VALUES(2, 2, '시저 5종세트', 19900, 1);

insert into cart
(PRODUCT_NO, MEMBER_NO, PRODUCT_NAME, PRODUCT_PRICE, PRODUCT_QUANTITY)
VALUES(3, 3, '베이컨 간식', 9900, 1);

insert into cart
(PRODUCT_NO, MEMBER_NO, PRODUCT_NAME, PRODUCT_PRICE, PRODUCT_QUANTITY)
VALUES(4, 4, '진짜 소고기 강아지 영양식', 14900, 1);

insert into cart
(PRODUCT_NO, MEMBER_NO, PRODUCT_NAME, PRODUCT_PRICE, PRODUCT_QUANTITY)
VALUES(3, 5, '베이컨 간식', 9900, 1);

insert into cart
(PRODUCT_NO, MEMBER_NO, PRODUCT_NAME, PRODUCT_PRICE, PRODUCT_QUANTITY)
VALUES(10, 6, '푹신 수건 장갑', 12900, 1);

insert into cart
(PRODUCT_NO, MEMBER_NO, PRODUCT_NAME, PRODUCT_PRICE, PRODUCT_QUANTITY)
VALUES(13, 7, '밀키츄', 10000, 1);

insert into cart
(PRODUCT_NO, MEMBER_NO, PRODUCT_NAME, PRODUCT_PRICE, PRODUCT_QUANTITY)
VALUES(20, 8, '애견 패딩조끼만 네이비', 30400, 1);

insert into cart
(PRODUCT_NO, MEMBER_NO, PRODUCT_NAME, PRODUCT_PRICE, PRODUCT_QUANTITY)
VALUES(22, 8, '소간 파우더 50g x 10', 51300, 1);

insert into cart
(PRODUCT_NO, MEMBER_NO, PRODUCT_NAME, PRODUCT_PRICE, PRODUCT_QUANTITY)
VALUES(25, 9, '강아지전용 간식 양고기 치즈버거 100g 80EA', 70200, 1);

insert into cart
(PRODUCT_NO, MEMBER_NO, PRODUCT_NAME, PRODUCT_PRICE, PRODUCT_QUANTITY)
VALUES(26, 9, '치석제거 입냄새완화 반려간식 43P 340g', 35400, 1);

insert into cart
(PRODUCT_NO, MEMBER_NO, PRODUCT_NAME, PRODUCT_PRICE, PRODUCT_QUANTITY)
VALUES(27, 10, '중대형견용 14kg 건식사료', 29800, 1);

insert into cart
(PRODUCT_NO, MEMBER_NO, PRODUCT_NAME, PRODUCT_PRICE, PRODUCT_QUANTITY)
VALUES(33, 11, '강아지 처방식 채식사료 민감피부 NVD (2.5kg)', 46300, 1);

insert into cart
(PRODUCT_NO, MEMBER_NO, PRODUCT_NAME, PRODUCT_PRICE, PRODUCT_QUANTITY)
VALUES(35, 12, '고칼슘 고단백 전연령 반려동물 사료 3kg', 41300, 1);

insert into cart
(PRODUCT_NO, MEMBER_NO, PRODUCT_NAME, PRODUCT_PRICE, PRODUCT_QUANTITY)
VALUES(36, 13, '강아지 애견 사료 피부 모질 개선', 15500, 1);

insert into cart
(PRODUCT_NO, MEMBER_NO, PRODUCT_NAME, PRODUCT_PRICE, PRODUCT_QUANTITY)
VALUES(37, 14, '강아지 애견 사료 피부 모질 개선 전연령', 33500, 1);

insert into cart
(PRODUCT_NO, MEMBER_NO, PRODUCT_NAME, PRODUCT_PRICE, PRODUCT_QUANTITY)
VALUES(39, 15, '간 심장 영양제 튼튼하군 250g', 39500, 1);

insert into cart
(PRODUCT_NO, MEMBER_NO, PRODUCT_NAME, PRODUCT_PRICE, PRODUCT_QUANTITY)
VALUES(40, 16, '강아지 관절 골격 영양제 잘달릴걸 250g', 39500, 1);

insert into cart
(PRODUCT_NO, MEMBER_NO, PRODUCT_NAME, PRODUCT_PRICE, PRODUCT_QUANTITY)
VALUES(42, 17, '강아지장난감 삑삑이 노즈워크', 16900, 1);

insert into cart
(PRODUCT_NO, MEMBER_NO, PRODUCT_NAME, PRODUCT_PRICE, PRODUCT_QUANTITY)
VALUES(43, 18, '강아지 간식 장난감공 분리불안해소 노즈워크공', 12300, 1);

commit;