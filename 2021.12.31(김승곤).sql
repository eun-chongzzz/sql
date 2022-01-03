 -- employees를 사용 시크마로 지정해주세요.
 use employees;
 
 -- employees 내부의 employees 테이블을 조회해주세요.
 -- SQL구문은 명령구문은 무조건 대문자, 테이블명이나 호칭등은
 -- 소문자로 작성하는 것이 관례입니다.
 -- 무조건 지키지 않아도 실행은 가능하지만, 가독성을 위해 되도록이면 지켜주세요.
SELECT * FROM employees;

-- 원래 테이블 조회할때는 스키마명.테이블명으로 모두 표기해야합니다.
SELECT * FROM employees.employees;

-- 스키마명.테이블명으로 조회시 use중이지않은 스키마의 테이블도 조회할 수 있습니다.
SELECT * FROM ict_practic.users;

-- 컬럼을 전체가 아닌 임의로 가져올때는 컬럼명을 ,로 구분합니다.
-- 이 경우 모든 컬럼이 아닌 일부 컬럼만 조회할 수도 있으며
-- 심지어 한 개의 컬럼만 조회하는 등 개수조절도 가능합니다.
SELECT gender, first_name, last_name FROM employees;

-- CMD환경에서는 좌측 스키마처럼 스키마 목록을 보여주는 창이 없으므로
-- 아래 명령어를 이용해 SCHEMA 목록을 확인할 수 있습니다.
SHOW databases;

-- 현재 DB정보를 조회하기 위해서는
SHOW TABLE STATUS;

-- 특정 테이블의 컬럼 정보를 조회하고 싶다면 아래 명령어를 씁니다.
-- DESCRIBE 테이블면; 혹은 DESC 테이블명;
DESCRIBE employees;
DESC employees;

-- ict_practice를 디폴드 스키마로 잡아주세요.
use ict_practice;

-- 테이블을 생성합니다.
-- 테이블 생성시 적힌 제약조건과 컬럼명을 활용해 만들어주세요.
-- userTbl 테이블
-- user_id 문자열(8) PRIMARY KEY
-- user_name 문자열(10) not null
-- birthYear 정수(4) not null
-- addr 문자열(4) not null
-- phon_number 문자열(11)
-- height 정수(3)
-- red_date DATE

-- PRIMARY KEY(주요 키)
-- 각 테이블을 대표할 수 있는 대표데이터를 저장하는 컬럼에 붙이는 제약조건입니다.
-- 모든 테이블은 무조건 하나의 PRIMARY KEY를 갖는다.
-- PRIMARY KEY는 자동으로 중복을 방지하고, NULL도 들어올수 없으므로 NOT NULL도 겸한다.

CREATE TABLE userTbl(
	user_id varchar(8) primary key,
	user_name varchar(10) not null,
	birth_year int(4) not null,
	addr varchar(4) not null,
	phone_number varchar(11),
	height int(3),
	reg_date date
    );


-- buyTbl 테이블
-- order_number INT AUTO_INCREMENT PRIMARY KEY
-- user_id 문자열(8) not null
-- prod_name 문자열(6) not null
-- group_name 문자열(4)
-- price 정수(7) not null
-- amount 정수(3) not null
-- FOREIGN KEY(user_id) REFERENCES userTbl(user_id)

-- AUTO_INCREMENT(자동증가)
-- INT(정수)자료형이 붙은 컬럼에만 붙일 수 있고, 이게 붙은 컬럼은 자동으로 1씩 증가하는 숫자를 배정받습니다.
-- 시작은 1입니다.
-- INSERT INTO 구문이 실행될 때 마다 해당 컬럼에 들어갈 숫자를 자동으로 배정해줍니다.
-- 한 번 쓰인 숫자는 다시는 사용되지 않습니다.
 
-- FOREIGN KEY(외래 키)
-- 쇼핑몰의 구매자는 반드시 회원이어야 합니다.
-- 특정 테이블에 존재하는 값만 해당 컬럼에 들여올 수 있도록 거는 제약조건입니다.
-- FOREIGN KEY를 거는 컬럼의 자료형과 크기는 참조하는 쪽과 원본 모두 같아야합니다.
-- 참조컬럼에 있는 값만(userTbl의 user_id에 존재하는 값만) buyTbl의 user_id에 올 수 있습니다.

CREATE TABLE buyTbl(
order_number INT AUTO_INCREMENT PRIMARY KEY,
user_id varchar(8) NOT null,
prod_name varchar(6) not null,
group_name varchar(4) not null,
price int(7) not null,
amount int(3) not null,
FOREIGN KEY(user_id) REFERENCES userTbl(user_id)
);

-- 회원부터 집어 넣었음.
INSERT INTO userTbl VALUES('KDH', '김대현', 1994, '인천', 01012341234, 172, '2020-3-5');
INSERT INTO userTbl VALUES('SHM', '손흥민', 1993, '영국', 01000000000, 180, '2021-3-15');
INSERT INTO userTbl VALUES('EM', '일론머스크', 1970, '화성', 01017777234, 170, '2020-1-5');
SELECT * FROM userTbl;

-- 가입한 회원이 물건을 산 이력이 남도록 하겠습니다.
INSERT INTO buyTbl VALUES (null, 'KDH', '기계식키보드', '주변기기', 200000, 1);
-- order_number는 값을 null로 주면 AUTO_INCREMENT에 의해 자동으로 1씩 증가된 숫자를 배정받음.
INSERT INTO buyTbl VALUES(null, 'KDH', '듀얼모니터', '전자기기', 20000, 1);
-- 없는 회원 아이디로 INSERT를 시도해보겠습니다.
INSERT INTO buyTbl VALUES(null, 'SHM', '유니폼', '의류', 30000, 1);
INSERT INTO buyTbl VALUES(null, 'EM', '도지코인', '가상화폐', 5000, 100000);
SELECT * FROM buyTbl;












