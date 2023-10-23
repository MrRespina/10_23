-- 데이터 조작어 / DML(Data Manipulation Language)
-- DB에 들어있는 데이터를 조회하거나 검색하기 위한 명렁어 . CRUD(select, insert, update ,delete)

-- 데이터 정의어 / DDL(Data Definition Language)
-- 테이블과 같은 구조를 정의하는 데 사용되는 명령어, 데이터 구조와 관련되어있음.(DBA)
-- create, alter, drop, truncate, rename

-- 데이터 제어어 / DCL(Data Control Language)
-- 데이터베이스에 접근하고 객체들을 사용하도록 권한을 주거나 회수함.
-- grant, revoke, rollback, commit 등

-- table
-- row,schima
-- column,data,attribute

-- 여러줄 실행 : alt + x , 한줄 실행 : alt s

create table coffee(
	name char,
	price number
);

select * from coffee;

drop table coffee cascade constraint purge;

-- SQL 이라는 언어로 DB를 제어.
--	DB 메이커가 달라도 SQL은 거의 비슷함.
--	대/소문자 구분 안함.(공식적으로 대문자 사용.)
--	catAge같은 낙타체 통하지 않음 > cat_age 같은 뱀체 사용
--	입력받는 attribute들은 대소문자 구분.
--	java : 창의성, 절대적 분량 많음
--	sql : 정해진대로, CRUD만

-- create table [name] ([field1] 자료형,[field2] 자료형,...);

CREATE TABLE OCT23_COFFEE(c_name VARCHAR2(10 char),c_price NUMBER(5),c_kcal NUMBER(6,3),c_start date);

SELECT * FROM OCT23_COFFEE;

DROP TABLE OCT23_COFFEE cascade constraint purge;

-- 자료형(OracleDB)
--	글자
--		char(숫자) : 무조건 괄호 안의 숫자 용량으로 저장
--		varchar2보다 일을 덜 하기 때문에 빠르다. 글자수가 정해져 있다면 활용. (성별,주민번호 등.)
--		varchar2(숫자 char) :
--		정해진 용량만큼 데이터를 넣지 않으면 알아서 용량을 조절해서 저장함.
--		느리다는 단점이 있지만 사람이 체감하기 힘듬.

--	숫자
--		number(용량)
--		number(5) > 정수 다섯자리까지. (0~99999)
--		number(6,3) > 실수(총 여섯자리 사용 가능하고, 소수점 3자릿수까지)

--	날짜
--		date

--	옵션
--		기본적으로 어떤 필드에 값을 안 넣는 것이 가능 . > 별로

--		제약조건(constraint)
--			데이터 무결성을 보장하기 위한 용도로 사용.
--			데이터 무결성 : DB에 저장된 데이터의 일관성, 정확성을 지키는 것.
--				도메인 무결성 / 개체 무결성 / 참조 무결성

--	도메인 무결성(Domain Constraint)
--	데이터타입(type),null(null,not null),default,check 등을 지정하여 사용 가능함.

--		1. not null : 반드시 값을 넣게 함.(null을 허용하지 않음.)

--		제약 조건 명을 따로 부여하지 않음 > (Oracle이 자동부여)
CREATE TABLE ex1(col1 varchar2(10 char) not null);

--		제약 조건을 부여(col1_notnull 이라는 제약 조건을 부여)
CREATE TABLE ex2(col1 varchar2(10 char) constraint col1_notnull not null);

--		2. UNIQUE : 해당 열에 들어가는 값이 테이블 전체에서 유일해야 함, NOT NULL과 함께 사용 가능.
CREATE TABLE ex3(col1 varchar2(10 char) UNIQUE,col2 varchar2(10 char) UNIQUE NOT NULL,col3 varchar2(10 char) constraint col3_unique unique(col3));

--		3. RPIMARY KEY(기본 키) : NULL을 허용하지 않고 중복된 데이터가 없도록 함.
--			PK = not null + unique
--			데이터의 특정 조건 검색이나 수정 등의 작업에 필요한 기본 키 구분
--			1개의 테이블에는 1개의 기본기가 필수로 있는게 일반적
--			primary key가 테이블에 없으면 안되고, 두개 이상은 비 추천
CREATE TABLE ex4(col1 varchar2(10 char) primary key,col2 number(4) not null);

--		여러 컬럼을 묶을 땐 constraint 키워드 사용 , primary key는 하나인 경우가 좋다.
CREATE TABLE ex5(col1 varchar2(10 char),col2 number(3),constraint pk_ex5 primary key(col1, col2));

--		4. FOREIGN KEY(외래 키)
--			다른 테이블의 특정 컬럼을 조회해서 동일한 데이터가 있는 경우에 입력 허용
--			참조하는 테이블은 PK로 지정된 컬럼만을 FK로 지정할 수 있다.
--			외래 키 설정을 위해서는 참조받는 컬럼이 먼저 생성되어야 함.
--			외래 키를 심을 테이블이 이후에 생성되어야 한다.

CREATE TALBE 테이블명(

	컬럼명 자료형 옵션,
	constraint pk명 foreign key(컬럼명)
	references 대상 테이블명(대상 테이블의 기본키 컬럼 명)
	on delete set null || on delete cascade
	-- 참조받는 테이블을 지웠을 시
	-- 이 테이블에 대해서 NULL값을 줄지(set null)
	-- 아니면 같이 지울지에 대한 옵션(cascade)
);


CREATE TABLE OCT23_COFFEE(
	c_name varchar2(10 char) primary key,
	c_price number(5) not null,
	c_kcal number(5,2) not null,
	c_start date not null
);

--	만약에 내가 생각한 스키마 중에 pk를 줄만한 컬럼이 없다?
--	자동으로 번호를 줘서 pk를 사용
--	>> autoincrement << oracle에는 없음.

INSERT INTO OCT23_COFFEE VALUES('아메리카노',2500,10.7,sysdate);
INSERT INTO OCT23_COFFEE VALUES('카페라떼',3200,12.7,sysdate);

SELECT * FROM OCT23_COFFEE;