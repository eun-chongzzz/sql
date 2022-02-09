-- 테이블을 만들어주세요.
-- 테이블 이름 : userinfo
-- name 10글자 회원이름
-- uid 20글자 회원아이디	primary key
-- upw 20글자 회원비밀번호
-- uemail 20글자 회원이메일

CREATE TABLE userinfo(
uname varchar(10) not null,
uid varchar (20) primary key,
upw varchar(20) not null,
uemail varchar(20)
);

-- 유저 4명을 입력해주세요.
-- 2명은 이메일 넣어주시고 2명은 넣지 말아주세요.
INSERT INTO userinfo VALUES ('김자바', 'javaman', '1212', 'java@jave.com');
INSERT INTO userinfo (uname, uid, upw) VALUES ('쟈스피', 'javajsp', '1212');
INSERT INTO userinfo VALUES ('스프링', 'springgood', '3434', 'spring@maven.com');
INSERT INTO userinfo VALUES ('즈파즈파', 'jpaboot', '5656', null);

SELECT * FROM userinfo;

