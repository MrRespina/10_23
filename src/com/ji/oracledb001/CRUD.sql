-- DB
--		(Relational DB - 테이블간의 관계를 중심으로)
--		RDB 계통 : OracleDB, MySql, MariaDB, MSSQL, ...
--		NOSQL 계통 : MongoDB, ElasticSearch, ...

CREATE TABLE oct_snack(
	s_number number(4) primary key,
	s_name varchar2(10 char) not null,
	s_maker varchar2(10 char) not null,
	s_price number(4) not null,
	s_exp date not null
);

DROP TABLE oct_snack cascade constraint purge;


-- CURD(Create Read Update Delete)
--	C(Data 만들기 용) , : insert
INSERT INTO 테이블(필드,필드,...) VALUES(값,값,...)

INSERT INTO oct_snack(s_no,s_name,s_price) VALUES(1,'초코파이',5000);

--	필드 순서 바꿔넣기?
INSERT INTO oct_snack(s_price,s_no,s_name) VALUES(3500,2,'포카칩');



INSERT INTO oct_snack VALUES(oct23_snack_seq.nextval,'초코파이','오리온',3500,sysdate);
INSERT INTO oct_snack VALUES(oct23_snack_seq.nextval,'포카칩','오리온',2000,sysdate);
INSERT INTO oct_snack VALUES(oct23_snack_seq.nextval,'프링글스','해외',2800,sysdate);
INSERT INTO oct_snack VALUES(oct23_snack_seq.nextval,'마이구미','해태',1000,sysdate);
INSERT INTO oct_snack VALUES(oct23_snack_seq.nextval,'초코파이','롯데',4000,sysdate);

SELECT * FROM oct_snack;

-- sequence 생성
CREATE SEQUENCE 이름;

예시)
CREATE SEQUENCE oct23_snack_seq;

-- sequence 삭제(테이블과 무관하기 떄문에 table 지을 때 이것도 같이 삭제해줘야함.)
DROP SEQUENCE 이름;

예시)
DROP SEQUENCE oct23_snack_seq;

-- 기존에 넣은 데이터 지우기 (테이블은 건드리지 않음)
truncate table oct_snack;
