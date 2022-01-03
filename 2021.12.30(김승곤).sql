/* 1. 데이터베이스 생성 명령
DB생성시 한글을 쓸 수 있도록 -> default character set utf8; */
create database ict_practice default character set utf8;

/* 우측 하단의 schemas 클릭 후, 새로고침 한 다음 ict_practice 우클릭
-> set as default schema를 클릭하세요. 이러면 현재 명령을 받을 DB로 지정됩니다.

/* default schema 지정은 명령어로도 할 수 있습니다.
use 스키마명; 을 사용하면 좌측 schemas에서 우클릭 후 default스키마 지정한 효과를
낼 수도 있습니다.*/
use sys; 
use ict_practice;

/* 테이블 생성 명령
primary key - 칼럼의 주요 키를 뜻하며, 중복데이터를 방지합니다.
테이블 내의 하나의 컬럼은 반드시 primary key 속성을 가져야 합니다.
not null -> 데이터에 null 값이 들어오는것을 방지합니다, */
/* 테이블은 클래스랑 구조가 비슷합니다. 클래스 내부의 멤버변수를 지정하듯이
테이블 요소를 지정해 줄 수 있습니다.*/
/* varchar 는 자바의 String과 호환됩니다.*/
CREATE TABLE users(
	id varchar(20) primary key,
    pw varchar(20) not null,
    user_name varchar(30) not null,
    email varchar(80)
    );
    
/* 데이터 적재하기
INSERT INTO 테이블명 (컬럼1, 컬럼2...) VALUE(S) (컬럼1값, 컬럼2값,...);
만약 모든 컬럼을 대상으로 지정시 컬럼은 생갹하고 VlLUE(S) 이후 값만 지정할 수 있다.
INSERT INTO 테이블명 VALUE(S)(컬럼1값, 컬럼2값, ///); */
INSERT INTO users (id, pw, user_name, email) VALUE
			('abc1234', 'asdf', '김자바', 'asd@asdf.com');

INSERT INTO users VALUES ('qwer123', 'qwer', '쿼리문', 'query@query.com');

-- 한줄 주석은 자바와 달리 -- 내용을 적어 작성할 수 있습니다.
-- 여러분들이 계정 3개를 더 넣어주시되, 1개 계정은 이메일을 생략하고 넣어주세요.
-- 이메일이 없는 경우는 컬럼명을 반드시 표기해야합니다.
INSERT INTO users (id, pw, user_name) VALUES ('sdf12ew', 'serw', '김덕진');
INSERT INTO users VALUES ('werxd', 'sdfsdf', '김대현', null);
INSERT INTO users VALUES ('gdfg123', 'res', '박성준','dsfsdf@naver.com');

/* 데이터 조회하기
SELECT 컬럼1, 컬럼2,... FROM 테이블명;
을 적으면 테이블에 적재된 데이터 조회 가능
SELECT * 테이블명; 으로 조회시 해당 테이블의 전체 컬럼 조회가능 */
SELECT * FROM users;
SELECT id, pw, user_name, email FROM users;

-- 조회구문에 조건을 걸기 위해서 WHERE이라는 구문을 사용합니다.
-- SELECT 조회컬럼 FROM 테이블명 WHERE 컬럼명 = '조건에 맞는 값';
-- 이름이 김자바인 사람만 출력하기
SELECT * FROM users WHERE user_name = '김자바';
-- 여러분들의 기준으로 필터링을 해보세요.
-- 아이디가 XXX인 사람만 출력해보세요.
SELECT * FROM users WHERE pw = 'res';

-- 조건 여러개를 걸 경우 AND, OR 키워드를 쓰면 됩니다.
-- 아이디가 mysqlsql이거나 혹은 유저이름이 김자바인 것들을 얻어오기
SELECT * FROM users WHERE id = 'werxd' OR user_name = '김자바';

/* 데이터 수정하기
UPDATE 테이블명 SET 컬럼명1 = '값1', 컬럼명2= '값2' ...;
주의할점은 WHERE구문 없이 사용하면 일괄적으로 컬럼 내의 모든값이 다 바뀝니다.*/
UPDATE users SET pw = 'pppp';
SET SQL_SAFE_UPDATES = 0; -- 0이면 비활성화, 1로 주면 다시 safety모드 활성화
SELECT * FROM users;

-- WHERE구문을 이용해서 pw컬럼의 값을 모두 다르게 바꿔주세요.
UPDATE users SET pw = 'abdsr' WHERE id = 'abc1234';
UPDATE users SET pw = 'erdr' WHERE id = 'gdfg';
UPDATE users SET pw = 'zzzzz' WHERE id = 'gdfg123';
UPDATE users SET pw = 'xxxxx' WHERE id = 'qwer123';
UPDATE users SET pw = 'ccccc' WHERE id = 'sdfew';
UPDATE users SET pw = 'python', user_name = '오라클유저' WHERE id = 'werxd';
-- 여러분들이 원하는 로우(row)하나에 대해서 이름과 비밀번호를 함께 바꿔주세요.
UPDATE users SET pw='sexy',user_name = '덕진짱' WHERE id = 'sdf12ew';

-- 데이터 삭제
/* DELETE FROM 테이블명; 을 할 경우 테이블 전체 데이터가 싹 다 날아갑니다.
DELETE구문 역시 WHERE과 조합해서 사용해야합니다. */
DELETE FROM users WHERE id = 'gdfg123';
DELETE FROM users WHERE id = 'werxc';
DELETE FROM users WHERE id = 'sdf12ew';

-- 도서관 DB를 한번 만들어보겠습니다.
-- 도서관 테이블 이름은 library이고
-- 내장 데이터는 책이름(book_name) primary key, 문자열(30)
-- 책가격(book_price), not null, int(7)
-- 출판사(book_pub), not null, 문자열(20자)
-- 저자(book_writer), not null, 문자열(10자)
-- 책분량(book_page), not null, int(5)
-- 이렇게 구성되어 있습니다. 생성 후 책을 6권 넣어주세요.

-- 테이플을 잘못 생성한 경우
-- drop table library; 를 이용해 추가 테이블을 삭제할 수 있고
-- 삭제한 후에 수정내역을 반영해 다시 만들어주시면 됩니다.

CREATE TABLE library(
	book_name varchar(30) primary key,
    book_price int(7) not null,
    book_pub varchar(20) not null,
    book_writer varchar(10) not null,
    book_page int(5) not null
    );
    
INSERT INTO library VALUES ('어린왕자', 11000, '달리', '생택쥐페리',300);
INSERT INTO library VALUES ('불편한편의점', 12000, '나무옆의자', '김호연',302);
INSERT INTO library VALUES ('흔한남매9', 16000, '미래의창', '흔한남매',291);
INSERT INTO library VALUES ('해리포터', 13000, '출판사', '조앤롤링',400);
INSERT INTO library VALUES ('덕진이의꿈', 15000, '대현', '김덕진',100);
INSERT INTO library VALUES ('대현이의어린시절', 20000, '부광', '김대현',260);
SELECT*FROM library;