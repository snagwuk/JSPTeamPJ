--강좌프로그램					
drop table gcourse;					
drop table Gmember;					
drop table gtrainer;					
drop table gapply;					
drop table gLike;					
drop table gminwon;					
drop table gRent;					
drop table gLocation;					
					
create table Glocation (					
Mcategory varchar(30),					
Scategory varchar(30),					
locationCode varchar(20),					
cost int,					
capacity int					
);					
					
create table gRent(					
no int primary key auto_increment,					
id varchar(25) not null,					
name varchar(10) not null,					
location varchar(250) not null,					
regdate datetime not null,					
R_date varchar(50) not null,					
purpose varchar(250) not null,					
capacity varchar(200) not null,					
status int not null,					
reason varchar(250)					
);					
					
create table gLike (					
num int not null,					
id varchar(25)  );					
					
create table gminwon (					
num int not null primary key,					
subject varchar(50) not null,					
id varchar(25) not null,					
article_date DATETIME,					
read_cnt int,					
content varchar(3000) not null,					
ans_check varchar(1) default '0',					
ans_content varchar(1000) not null,					
ans_date DATETIME					
);					
					
--select * from gcourse;					
create table gcourse(					
			code varchar(10) not null,		
			bigtype varchar(20) not null,		
			Course varchar(100) not null,		
			Course_time varchar(20) not null,		
			Course_Period_start varchar(20) not null,		
			Course_Period_end varchar(20) not null,		
			Course_location varchar(50) not null,		
			Course_person int not null,		
			price int not null,		
			TRAIN_CODE VARCHAR(10) not null		
					
					
			);		
					
--신청한강좌프로그램 테이블					
					
					
					
create table gapply(					
			id varchar(25) not null,		
			name varchar(10) not null,		
			code varchar(10) not null,		
			grade int		
);					
insert into gapply (id,name,code, grade) values ('세희','세희','2002s7',null);					
					
----------회원					
					
create table Gmember(					
id varchar(25) primary key,					
passwd varchar(12) not null,					
name varchar(10) not null,					
birth varchar(8) not null,					
sex int(2) not null,					
phone varchar(15) not null,					
address  varchar(30),					
admin int(2) not null					
);					
					
insert into Gmember values ('admin','a','admin','940823',1,'admin','admin',1);					
					
					
					
					
					
------gtrainer테이블					
--select * from gtrainer;					
create table gtrainer	(				
	TRAIN_CODE VARCHAR(30) primary key not null,				
	NAME VARCHAR(30) not null,				
	EMAIL VARCHAR(30),				
	LICENSE VARCHAR(30),				
	TEL VARCHAR(30)				
);					
					
INSERT INTO `gapply` VALUES ('세희', '세희', '2002s7', NULL);					
INSERT INTO `gapply` VALUES ('1', '1', '2002s7', NULL);					
INSERT INTO `gapply` VALUES ('q', 'q', '2002s7', NULL);					
INSERT INTO `gapply` VALUES ('q', 'q', '2002s7', NULL);					
INSERT INTO `gapply` VALUES ('voszpdlr', '주진희', '2003h3', NULL);					
INSERT INTO `gapply` VALUES ('12', '테스트', '2003h1', NULL);					
INSERT INTO `gapply` VALUES ('12', '테스트', '2003s4', NULL);					
INSERT INTO `gapply` VALUES ('12', '테스트', '2003s7', NULL);					
INSERT INTO `gapply` VALUES ('123', 'dd', '2003s4', NULL);					
INSERT INTO `gapply` VALUES ('1', '주진희', '2001h1', NULL);					
INSERT INTO `gapply` VALUES ('1', '주진희', '2001h2', NULL);					
INSERT INTO `gapply` VALUES ('1', '주진희', '2001h3', NULL);					
INSERT INTO `gapply` VALUES ('1', '주진희', '2001p1', NULL);					
INSERT INTO `gapply` VALUES ('1', '주진희', '2002p3', NULL);					
INSERT INTO `gapply` VALUES ('1', '주진희', '2002s3', NULL);					
INSERT INTO `gapply` VALUES ('voszpdlr', '주진희', '2001s2', 3);					
INSERT INTO `gapply` VALUES ('voszpdlr', '주진희', '2002s7', 5);					
INSERT INTO `gapply` VALUES ('voszpdlr', '주진희', '2003s2', NULL);					
INSERT INTO `gapply` VALUES ('12123', '테스트', '2003s2', NULL);					
INSERT INTO `gapply` VALUES ('12123', '테스트', '2002s1', NULL);					
INSERT INTO `gapply` VALUES ('12123', '테스트', '2001h2', NULL);					
INSERT INTO `gapply` VALUES ('voszpdlr', '주진희', '2003s7', NULL);					
INSERT INTO `gapply` VALUES ('voszpdlr', '주진희', '2003s5', NULL);					
INSERT INTO `gapply` VALUES ('voszpdlr', '주진희', '2003s6', NULL);					
INSERT INTO `gapply` VALUES ('voszpdlr', '주진희', '2003s4', NULL);					
INSERT INTO `gapply` VALUES ('voszpdlr', '주진희', '2003s3', NULL);					
INSERT INTO `gapply` VALUES ('voszpdlr', '주진희', '2003s1', NULL);					
INSERT INTO `gapply` VALUES ('voszpdlr', '주진희', '2001h1', 3);					
INSERT INTO `gapply` VALUES ('voszpdlr', '주진희', '2001s3', 3);					
INSERT INTO `gapply` VALUES ('voszpdlr', '주진희', '2001s7', 4);					
INSERT INTO `gapply` VALUES ('voszpdlr', '주진희', '2001s6', 2);					
INSERT INTO `gapply` VALUES ('voszpdlr', '주진희', '2002h3', 3);					
INSERT INTO `gapply` VALUES ('voszpdlr', '주진희', '2001s5', 1);					
INSERT INTO `gapply` VALUES ('test', '시시싯', '2001h1', 1);					
INSERT INTO `gapply` VALUES ('test', '시시싯', '2001h2', 1);					
INSERT INTO `gapply` VALUES ('test', '시시싯', '2001h3', 2);					
INSERT INTO `gapply` VALUES ('test', '시시싯', '2001p1', 4);					
INSERT INTO `gapply` VALUES ('test', '시시싯', '2001p2', 2);					
INSERT INTO `gapply` VALUES ('test', '시시싯', '2001p3', 4);					
INSERT INTO `gapply` VALUES ('test', '시시싯', '2002p2', 5);					
INSERT INTO `gapply` VALUES ('test', '시시싯', '2002h1', 4);					
INSERT INTO `gapply` VALUES ('test', '시시싯', '2002p1', 2);					
INSERT INTO `gapply` VALUES ('test', '시시싯', '2002s2', 3);					
INSERT INTO `gapply` VALUES ('test', '시시싯', '2003p1', NULL);					
INSERT INTO `gapply` VALUES ('test', '시시싯', '2001s1', 1);					
INSERT INTO `gapply` VALUES ('test', '시시싯', '2003s3', NULL);					
INSERT INTO `gapply` VALUES ('americano', '아메리카노', '2001h1', 4);					
INSERT INTO `gapply` VALUES ('americano', '아메리카노', '2001h2', 4);					
INSERT INTO `gapply` VALUES ('americano', '아메리카노', '2001h3', 4);					
INSERT INTO `gapply` VALUES ('americano', '아메리카노', '2001p1', 4);					
INSERT INTO `gapply` VALUES ('americano', '아메리카노', '2001p2', 2);					
INSERT INTO `gapply` VALUES ('americano', '아메리카노', '2001p3', 4);					
INSERT INTO `gapply` VALUES ('americano', '아메리카노', '2002h1', 4);					
INSERT INTO `gapply` VALUES ('americano', '아메리카노', '2002h2', 5);					
INSERT INTO `gapply` VALUES ('americano', '아메리카노', '2002h3', 1);					
INSERT INTO `gapply` VALUES ('americano', '아메리카노', '2002s2', 1);					
INSERT INTO `gapply` VALUES ('americano', '아메리카노', '2003p3', NULL);					
INSERT INTO `gapply` VALUES ('americano', '아메리카노', '2003h2', NULL);					
INSERT INTO `gapply` VALUES ('americano', '아메리카노', '2003s6', NULL);					
INSERT INTO `gapply` VALUES ('avala', '아바라', '2001h1', 4);					
INSERT INTO `gapply` VALUES ('avala', '아바라', '2001h2', 5);					
INSERT INTO `gapply` VALUES ('avala', '아바라', '2001h3', 5);					
INSERT INTO `gapply` VALUES ('avala', '아바라', '2001p1', 5);					
INSERT INTO `gapply` VALUES ('avala', '아바라', '2001s6', 5);					
INSERT INTO `gapply` VALUES ('avala', '아바라', '2002h2', 2);					
INSERT INTO `gapply` VALUES ('avala', '아바라', '2002p2', 3);					
INSERT INTO `gapply` VALUES ('avala', '아바라', '2002s4', 4);					
INSERT INTO `gapply` VALUES ('avala', '아바라', '2003p1', NULL);					
INSERT INTO `gapply` VALUES ('avala', '아바라', '2003s4', NULL);					
INSERT INTO `gapply` VALUES ('avala', '아바라', '2003s7', NULL);					
INSERT INTO `gapply` VALUES ('avala', '아바라', '2001s4', 1);					
INSERT INTO `gapply` VALUES ('avala', '아바라', '2002s2', 1);					
INSERT INTO `gapply` VALUES ('g', 'g', '2003h2', NULL);					
INSERT INTO `gapply` VALUES ('g', 'g', '2001h1', 5);					
INSERT INTO `gapply` VALUES ('5', '5', '2003s7', NULL);					
INSERT INTO `gapply` VALUES ('ssangyong', '쌍용', '2003s7', NULL);					
INSERT INTO `gapply` VALUES ('asd', 'asd', '2003s7', NULL);					
INSERT INTO `gapply` VALUES ('q', 'q', '2002s7', NULL);					
INSERT INTO `gapply` VALUES ('q', 'q', '2002s7', NULL);					
INSERT INTO `gapply` VALUES ('q', 'q', '2002s7', NULL);					
INSERT INTO `gapply` VALUES ('voszpdlr', '주진희', '2003h3', NULL);					
INSERT INTO `gapply` VALUES ('12', '테스트', '2003h1', NULL);					
INSERT INTO `gapply` VALUES ('12', '테스트', '2003s4', NULL);					
INSERT INTO `gapply` VALUES ('12', '테스트', '2003s7', NULL);					
INSERT INTO `gapply` VALUES ('123', 'dd', '2003s4', NULL);					
INSERT INTO `gapply` VALUES ('1', '주진희', '2001h1', 1);					
INSERT INTO `gapply` VALUES ('1', '주진희', '2001h2', 1);					
INSERT INTO `gapply` VALUES ('1', '주진희', '2001h3', 1);					
INSERT INTO `gapply` VALUES ('1', '주진희', '2001p1', NULL);					
INSERT INTO `gapply` VALUES ('1', '주진희', '2002p3', 1);					
INSERT INTO `gapply` VALUES ('1', '주진희', '2002s3', NULL);					
INSERT INTO `gapply` VALUES ('voszpdlr', '주진희', '2001s2', 3);					
INSERT INTO `gapply` VALUES ('voszpdlr', '주진희', '2002s7', 5);					
INSERT INTO `gapply` VALUES ('voszpdlr', '주진희', '2003s2', NULL);					
INSERT INTO `gapply` VALUES ('12123', '테스트', '2003s2', NULL);					
INSERT INTO `gapply` VALUES ('12123', '테스트', '2002s1', NULL);					
INSERT INTO `gapply` VALUES ('12123', '테스트', '2001h2', NULL);					
INSERT INTO `gapply` VALUES ('voszpdlr', '주진희', '2003s7', NULL);					
INSERT INTO `gapply` VALUES ('voszpdlr', '주진희', '2003s5', NULL);					
INSERT INTO `gapply` VALUES ('voszpdlr', '주진희', '2003s6', NULL);					
INSERT INTO `gapply` VALUES ('voszpdlr', '주진희', '2003s4', NULL);					
INSERT INTO `gapply` VALUES ('voszpdlr', '주진희', '2003s3', NULL);					
INSERT INTO `gapply` VALUES ('voszpdlr', '주진희', '2003s1', NULL);					
INSERT INTO `gapply` VALUES ('voszpdlr', '주진희', '2001h1', 3);					
INSERT INTO `gapply` VALUES ('voszpdlr', '주진희', '2001s3', 3);					
INSERT INTO `gapply` VALUES ('voszpdlr', '주진희', '2001s7', 4);					
INSERT INTO `gapply` VALUES ('voszpdlr', '주진희', '2001s6', 2);					
INSERT INTO `gapply` VALUES ('voszpdlr', '주진희', '2002h3', 3);					
INSERT INTO `gapply` VALUES ('voszpdlr', '주진희', '2001s5', 1);					
INSERT INTO `gapply` VALUES ('test', '시시싯', '2001h1', 1);					
INSERT INTO `gapply` VALUES ('test', '시시싯', '2001h2', 1);					
INSERT INTO `gapply` VALUES ('test', '시시싯', '2001h3', 2);					
INSERT INTO `gapply` VALUES ('test', '시시싯', '2001p1', 4);					
INSERT INTO `gapply` VALUES ('test', '시시싯', '2001p2', 2);					
INSERT INTO `gapply` VALUES ('test', '시시싯', '2001p3', 4);					
INSERT INTO `gapply` VALUES ('test', '시시싯', '2002p2', 5);					
INSERT INTO `gapply` VALUES ('test', '시시싯', '2002h1', 4);					
INSERT INTO `gapply` VALUES ('test', '시시싯', '2002p1', 2);					
INSERT INTO `gapply` VALUES ('test', '시시싯', '2002s2', 3);					
INSERT INTO `gapply` VALUES ('test', '시시싯', '2003p1', NULL);					
INSERT INTO `gapply` VALUES ('test', '시시싯', '2001s1', 1);					
INSERT INTO `gapply` VALUES ('test', '시시싯', '2003s3', NULL);					
INSERT INTO `gapply` VALUES ('americano', '아메리카노', '2001h1', 4);					
INSERT INTO `gapply` VALUES ('americano', '아메리카노', '2001h2', 4);					
INSERT INTO `gapply` VALUES ('americano', '아메리카노', '2001h3', 4);					
INSERT INTO `gapply` VALUES ('americano', '아메리카노', '2001p1', 4);					
INSERT INTO `gapply` VALUES ('americano', '아메리카노', '2001p2', 2);					
INSERT INTO `gapply` VALUES ('americano', '아메리카노', '2001p3', 4);					
INSERT INTO `gapply` VALUES ('americano', '아메리카노', '2002h1', 4);					
INSERT INTO `gapply` VALUES ('americano', '아메리카노', '2002h2', 5);					
INSERT INTO `gapply` VALUES ('americano', '아메리카노', '2002h3', 1);					
INSERT INTO `gapply` VALUES ('americano', '아메리카노', '2002s2', 1);					
INSERT INTO `gapply` VALUES ('americano', '아메리카노', '2003p3', NULL);					
INSERT INTO `gapply` VALUES ('americano', '아메리카노', '2003h2', NULL);					
INSERT INTO `gapply` VALUES ('americano', '아메리카노', '2003s6', NULL);					
INSERT INTO `gapply` VALUES ('avala', '아바라', '2001h1', 4);					
INSERT INTO `gapply` VALUES ('avala', '아바라', '2001h2', 5);					
INSERT INTO `gapply` VALUES ('avala', '아바라', '2001h3', 5);					
INSERT INTO `gapply` VALUES ('avala', '아바라', '2001p1', 5);					
INSERT INTO `gapply` VALUES ('avala', '아바라', '2001s6', 5);					
INSERT INTO `gapply` VALUES ('avala', '아바라', '2002h2', 2);					
INSERT INTO `gapply` VALUES ('avala', '아바라', '2002p2', 3);					
INSERT INTO `gapply` VALUES ('avala', '아바라', '2002s4', 4);					
INSERT INTO `gapply` VALUES ('avala', '아바라', '2003p1', NULL);					
INSERT INTO `gapply` VALUES ('avala', '아바라', '2003s4', NULL);					
INSERT INTO `gapply` VALUES ('avala', '아바라', '2003s7', NULL);					
INSERT INTO `gapply` VALUES ('avala', '아바라', '2001s4', 1);					
INSERT INTO `gapply` VALUES ('avala', '아바라', '2002s2', 1);					
INSERT INTO `gapply` VALUES ('g', 'g', '2003h2', NULL);					
INSERT INTO `gapply` VALUES ('g', 'g', '2001h1', 5);					
INSERT INTO `gapply` VALUES ('americano', '아메리카노', '2001h1', 4);					
INSERT INTO `gapply` VALUES ('americano', '아메리카노', '2001h2', 4);					
INSERT INTO `gapply` VALUES ('prog', '정민우', '2003s7', NULL);					
INSERT INTO `gapply` VALUES ('prog', '정민우', '2003p3', NULL);					
INSERT INTO `gapply` VALUES ('cake', '박상욱', '2002h1', 4);					
INSERT INTO `gapply` VALUES ('cake', '박상욱', '2003s7', NULL);					
INSERT INTO `gapply` VALUES ('cake', '박상욱', '2001h3', 2);					
INSERT INTO `gapply` VALUES ('cake', '박상욱', '2001h1', 5);					
INSERT INTO `gapply` VALUES ('cake', '박상욱', '2002s6', 4);					
INSERT INTO `gapply` VALUES ('cake', '박상욱', '2003h1', NULL);					
INSERT INTO `gapply` VALUES ('qkqk', '김은솔', '2002h2', 4);					
INSERT INTO `gapply` VALUES ('qkqk', '김은솔', '2003s7', NULL);					
INSERT INTO `gapply` VALUES ('qkqk', '김은솔', '2001h2', 1);					
INSERT INTO `gapply` VALUES ('qkqk', '김은솔', '2003s3', NULL);					
INSERT INTO `gapply` VALUES ('qkqk', '김은솔', '2002s1', 1);					
INSERT INTO `gapply` VALUES ('qkqk', '김은솔', '2001s2', 2);					
INSERT INTO `gapply` VALUES ('qkqk', '김은솔', '2003s5', NULL);					
INSERT INTO `gapply` VALUES ('qkqk', '김은솔', '2003p1', NULL);					
INSERT INTO `gapply` VALUES ('dkdk', '김명선', '2003h3', NULL);					
INSERT INTO `gapply` VALUES ('dkdk', '김명선', '2001p3', 3);					
INSERT INTO `gapply` VALUES ('dkdk', '김명선', '2001h1', 1);					
INSERT INTO `gapply` VALUES ('dkdk', '김명선', '2001s5', 5);					
INSERT INTO `gapply` VALUES ('dkdk', '김명선', '2003s7', NULL);					
INSERT INTO `gapply` VALUES ('dkdk', '김명선', '2003s3', NULL);					
INSERT INTO `gapply` VALUES ('dkdk', '김명선', '2003h2', NULL);					
INSERT INTO `gapply` VALUES ('member', '윤이랑', '2001s1', 5);					
INSERT INTO `gapply` VALUES ('member', '윤이랑', '2003s5', NULL);					
INSERT INTO `gapply` VALUES ('member', '윤이랑', '2002s2', 1);					
INSERT INTO `gapply` VALUES ('member', '윤이랑', '2002h1', 2);					
INSERT INTO `gapply` VALUES ('member', '윤이랑', '2003s7', NULL);					
INSERT INTO `gapply` VALUES ('member', '윤이랑', '2001s6', 4);					
INSERT INTO `gapply` VALUES ('prog', '정민우', '2001h1', 5);					
INSERT INTO `gapply` VALUES ('prog', '정민우', '2002s7', 4);					
INSERT INTO `gapply` VALUES ('prog', '정민우', '2001s1', 4);					
INSERT INTO `gapply` VALUES ('powerswimmer', '박태환', '2002s7', 4);					
INSERT INTO `gapply` VALUES ('powerswimmer', '박태환', '2001s6', 1);					
INSERT INTO `gapply` VALUES ('powerswimmer', '박태환', '2001s3', 1);					
INSERT INTO `gapply` VALUES ('powerswimmer', '박태환', '2001h1', 5);					
INSERT INTO `gapply` VALUES ('powerswimmer', '박태환', '2002h3', 1);					
INSERT INTO `gapply` VALUES ('powerswimmer', '박태환', '2003s4', NULL);					
INSERT INTO `gapply` VALUES ('powerswimmer', '박태환', '2003h1', NULL);					
INSERT INTO `gapply` VALUES ('prog', '정민우', '2001p2', 2);					
INSERT INTO `gapply` VALUES ('admin', 'admin', '2003s7', NULL);					
INSERT INTO `gapply` VALUES ('choco', '초코', '2001h1', 5);					
INSERT INTO `gapply` VALUES ('choco', '초코', '2001h2', 5);					
INSERT INTO `gapply` VALUES ('choco', '초코', '2001h3', 4);					
INSERT INTO `gapply` VALUES ('choco', '초코', '2001p1', 4);					
INSERT INTO `gapply` VALUES ('choco', '초코', '2001p2', 3);					
INSERT INTO `gapply` VALUES ('choco', '초코', '2001s1', 3);					
INSERT INTO `gapply` VALUES ('choco', '초코', '2002h2', 2);					
INSERT INTO `gapply` VALUES ('choco', '초코', '2002p1', 2);					
INSERT INTO `gapply` VALUES ('choco', '초코', '2002s1', 1);					
INSERT INTO `gapply` VALUES ('choco', '초코', '2002s5', 1);					
INSERT INTO `gapply` VALUES ('choco', '초코', '2003p2', NULL);					
INSERT INTO `gapply` VALUES ('choco', '초코', '2003s2', NULL);					
INSERT INTO `gapply` VALUES ('choco', '초코', '2003s5', NULL);					
INSERT INTO `gapply` VALUES ('choco', '초코', '2003s7', NULL);					
INSERT INTO `gapply` VALUES ('member', '윤이랑', '2001p2', 3);					
INSERT INTO `gapply` VALUES ('ㄹ', 'f', '2003s6', NULL);					
INSERT INTO `gapply` VALUES ('ㄹ', 'f', '2001s5', 3);					
INSERT INTO `gapply` VALUES ('prog', '정민우', '2003s5', NULL);					
INSERT INTO `gapply` VALUES ('prog', '정민우', '2001s3', 1);					
INSERT INTO `gapply` VALUES ('osanlocal', '김수한무', '2001h1', 4);					
INSERT INTO `gapply` VALUES ('osanlocal', '김수한무', '2002p2', 2);					
INSERT INTO `gapply` VALUES ('osanlocal', '김수한무', '2002s4', NULL);					
INSERT INTO `gapply` VALUES ('osanlocal', '김수한무', '2002s1', NULL);					
INSERT INTO `gapply` VALUES ('osanlocal', '김수한무', '2003s7', NULL);					
INSERT INTO `gapply` VALUES ('osanlocal', '김수한무', '2003p3', NULL);					
INSERT INTO `gapply` VALUES ('osanlocal93', '최계미', '2003s7', NULL);					
INSERT INTO `gapply` VALUES ('osanlocal93', '최계미', '2003h3', NULL);					
INSERT INTO `gapply` VALUES ('osanlocal93', '최계미', '2001s3', 1);					
INSERT INTO `gapply` VALUES ('osanlocal93', '최계미', '2001s1', 1);					
INSERT INTO `gapply` VALUES ('osanlocal93', '최계미', '2001h1', NULL);					
INSERT INTO `gapply` VALUES ('osanlocal93', '최계미', '2001p2', NULL);					
INSERT INTO `gapply` VALUES ('solsol', '솔', '2003p3', NULL);					
INSERT INTO `gapply` VALUES ('0', '0', '2003s7', NULL);					
INSERT INTO `gapply` VALUES ('wnfl7052', '최주리', '2003s7', NULL);					
INSERT INTO `gapply` VALUES ('나융', '양나윤', '2003s7', NULL);					
INSERT INTO `gapply` VALUES ('zlzlzlzlzl', '1', '2003s7', NULL);					
INSERT INTO `gapply` VALUES ('psw', '1', '2003s6', NULL);					
INSERT INTO `gapply` VALUES ('oo00oo', '김유리', '2003s7', NULL);					
INSERT INTO `gapply` VALUES ('psw', '1', '2003s7', NULL);					
INSERT INTO `gapply` VALUES ('minjoo', '송', '2003s7', NULL);					
INSERT INTO `gapply` VALUES ('123', 'dd', '2003s7', NULL);					
INSERT INTO `gapply` VALUES ('wnfl7052', '최주리', '2003h1', NULL);					
					
INSERT INTO `gmember` VALUES ('0', '0', '0', '0', 1, '0', '0', 0);					
INSERT INTO `gmember` VALUES ('1', '2', '주진희', '930625', 1, '00', '역삼동 쌍용', 0);					
INSERT INTO `gmember` VALUES ('10', '10', '10', '10', 1, '10', '10', 0);					
INSERT INTO `gmember` VALUES ('112', '112', '112', '111111', 1, '1212', '1212', 0);					
INSERT INTO `gmember` VALUES ('12', '23', '테스트', '121212', 1, '11', 'a', 0);					
INSERT INTO `gmember` VALUES ('12123', '12', '테스트', '121212', 2, '11', '1', 0);					
INSERT INTO `gmember` VALUES ('123', '123', 'dd', '123123', 1, '44', '4', 0);					
INSERT INTO `gmember` VALUES ('13', '13', '13', '13', 1, '13', '13', 0);					
INSERT INTO `gmember` VALUES ('15', '15', '15', '15', 1, '15', '15', 0);					
INSERT INTO `gmember` VALUES ('16', '16', '16', '16', 1, '16', '16', 0);					
INSERT INTO `gmember` VALUES ('5', '5', '5', '5', 1, '6', '5', 0);					
INSERT INTO `gmember` VALUES ('7', '7', '7', '7', 1, '휴대폰', '7', 0);					
INSERT INTO `gmember` VALUES ('abcde', 'abcde', 'abcde', 'abcde', 1, 'abcde', 'abcde', 0);					
INSERT INTO `gmember` VALUES ('admin', 'a', 'admin', '940823', 1, 'admin', 'admin', 1);					
INSERT INTO `gmember` VALUES ('americano', 'z', '아메리카노', '456456', 2, '00', 'ㅋ', 0);					
INSERT INTO `gmember` VALUES ('asd', 'asd', 'asd', 'asd', 1, 'asd', 'asd', 0);					
INSERT INTO `gmember` VALUES ('avala', 'z', '아바라', '456456', 1, '12', 'ㅁ', 0);					
INSERT INTO `gmember` VALUES ('bbb', '12', '123', '921215', 1, '12', '112', 0);					
INSERT INTO `gmember` VALUES ('cake', 'z', '박상욱', '780202', 1, '01077884455', '강남구 역삼동', 0);					
INSERT INTO `gmember` VALUES ('choco', 'z', '초코', '123123', 1, '11', '역삼동 쌍용', 0);					
INSERT INTO `gmember` VALUES ('dkanrjsk', 'z', '주진희', '930625', 2, '01011111111', '역삼동 쌍용', 0);					
INSERT INTO `gmember` VALUES ('dkdk', 'z', '김명선', '780202', 2, '01034548748', '강남구 역삼동', 0);					
INSERT INTO `gmember` VALUES ('g', 'g', 'g', 'g', 1, 'g', 'g', 0);					
INSERT INTO `gmember` VALUES ('member', 'z', '윤이랑', '991111', 2, '01032133213', '강남구 역삼동', 0);					
INSERT INTO `gmember` VALUES ('minjoo', '11', '송', '920630', 2, '01011111111', '송', 0);					
INSERT INTO `gmember` VALUES ('oo00oo', 'aa11', '김유리', '931102', 1, '01044446666', '인천', 0);					
INSERT INTO `gmember` VALUES ('osanlocal', '123123', '김수한무', '930312', 1, '010-0000-0000', '제주도 애월리', 0);					
INSERT INTO `gmember` VALUES ('osanlocal93', 'qweasd', '최계미', '930312', 1, '010-0000-0000', '제주도 애월리', 0);					
INSERT INTO `gmember` VALUES ('powerswimmer', 'z', '박태환', '770110', 1, '01045454545', '강남구 역삼동', 0);					
INSERT INTO `gmember` VALUES ('prog', 'qweasd', '정민우', '930312', 1, '010101010101', '010101010', 0);					
INSERT INTO `gmember` VALUES ('psw', '123', '1', '11', 1, '1', '1', 0);					
INSERT INTO `gmember` VALUES ('qkqk', 'z', '김은솔', '990221', 2, '01045451212', '강남구 역삼동', 0);					
INSERT INTO `gmember` VALUES ('solsol', '1111', '솔', '910826', 2, '01000000000', '테헤란로132', 0);					
INSERT INTO `gmember` VALUES ('ssangyong', '1234', '쌍용', '200221', 2, '01011111111', '강남구 역삼동', 0);					
INSERT INTO `gmember` VALUES ('test', 'z', '시시싯', '123456', 1, '00', '2', 0);					
INSERT INTO `gmember` VALUES ('voszpdlr', 'zz', '주진희', '930625', 2, '01011111111', '강남구 역삼동', 0);					
INSERT INTO `gmember` VALUES ('wnfl7052', 'dkssudgktpdy', '최주리', '940218', 2, '010-1234-4567', '테헤란로', 0);					
INSERT INTO `gmember` VALUES ('zlzlzlzlzl', '1', '1', '1', 1, '111', '111', 0);					
INSERT INTO `gmember` VALUES ('ㄹ', 'f', 'f', 'f', 1, 'f', 'f', 0);					
INSERT INTO `gmember` VALUES ('ㅇㄹㅇㄹㅇㄹ', '123', 'dfd', 'ssssss', 2, 'ss', 's', 0);					
INSERT INTO `gmember` VALUES ('나융', '1111', '양나윤', '941030', 2, '01092470732', '서울', 0);					
					
INSERT INTO `gminwon` VALUES (1, '수영장 재개장했으면 합니다.', 'voszpdlr', '2020-02-20 20:33:06', 7, '바이러스 전염성에 우려스러운분들 수강금액 돌려주려 주시고..합반내지 자유수영이라도.. 했으면 합니다.', '1', '안녕하세요 우리공사 체육시설을 이용해 주시는 고객님께 진심으로 감사드립니다.\r\n\r\n고객님께서 의견주신 사항에 대하여 답변 드리겠습니다.\r\n\r\n \r\n\r\n우리공사에서는 그동안 이용자의 안전을 위해 전 시설 방역소독과 손세정제 비치, 발열 체크 후 시설이용 등의 예방활동을 통하여 시설을 정상운영하였으나, 인근 구리시에서 확진자가 발생함에 따라 남양주시는 도시공사 전 시설과 공공생활체육시설, 공공(작은) 도서관, 주민자치센터를 휴관하며, 각종 행사도 취소하였습니다.\r\n\r\n \r\n\r\n질병관리본부에 따르면 신종 코로나바이러스의 전파경로는 비말(침방울) 및 호흡기 분비물(콧물, 가래 등)과의 접촉으로 전염되며, 감염된 사람의 비말이 공기중으로 날아가 다른사람의 호흡기로 들어가거나, 손에 묻은 바이러스가 눈·코·입 등을 만질 때 점막을 통해 침투하여 전염되는 것을 안내하고 있습니다.\r\n\r\n \r\n\r\n이에 우리공사는 면역력이 약한 어린이, 노약자, 임산부 등 다양한 연령층이 이용하는 시설로 부득이하게 휴관을 결정하게 된 점 깊은 이해와 양해를 부탁드립니다.\r\n\r\n \r\n\r\n신종 코로나바이러스 감염증 확산 대비에 총력을 기울여 빠른 시일 내 시민들이 안심하고 생활할 수 있도록 최선을 다하겠습니다. \r\n\r\n추가로 문의사항이 있으신 경우 우리공사 안전보건 총괄부서(운영총괄팀 031-560-1231)로 연락주시면 \r\n\r\n안내드리도록 하겠습니다. 감사합니다. \r\n', '2020-02-20 20:34:16');					
INSERT INTO `gminwon` VALUES (2, '휴관 기간에 수조를 다 비우고 청소 후 물을 새로 받으면 좋지 않을까요?', 'voszpdlr', '2020-02-20 20:36:29', 1, '일년에 한 번,\r\n\r\n수영장에 물을 새로 받으려면 며칠이 걸린다고 하셨는데, \r\n\r\n이번 기회에 수조 다 비우고,\r\n\r\n깨끗하게 청소 하고,\r\n\r\n방역하고,\r\n\r\n\r\n\r\n\r\n새 물을 가득 채워 주세요.\r\n\r\n\r\n\r\n\r\n바이러스로 인해 불안 했던 사람들의 마음도 편안해지고,\r\n\r\n\r\n\r\n\r\n이런 기회가 아니면 언제 또 하겠습니까?\r\n\r\n\r\n\r\n\r\n추가로,\r\n\r\n옷장, 옷장 손잡이, \r\n\r\n키,\r\n\r\n신발장,\r\n\r\n손 닿는 모든 곳도 모두 소독 해주세요.\r\n\r\n\r\n\r\n\r\n다시 개장 한 뒤에도,\r\n\r\n수시로 꼼꼼하게 소독 하고, 하는 모습을 보여주면,\r\n\r\n사람들의 마음을 편안하게 해줄 것 같습니다.\r\n\r\n\r\n\r\n\r\n드라이기나,\r\n\r\n손 닿는 모든 곳에 손 소독제를 구석 구석 비치 해놓으면,\r\n\r\n소독제 바르고 드라이기등을 만지므로 자동 소독이 된다고 생각합니다.\r\n\r\n\r\n\r\n\r\n전화사절.\r\n', '', '', '2020-02-20 20:36:29');					
INSERT INTO `gminwon` VALUES (3, '재개장 후 해당 센터에 현재 수강 등록되어있는 회원만 자유 수영을 진행해주세요', 'voszpdlr', '2020-02-20 20:36:57', 5, '수영장 재 개장 하고 나면, \r\n\r\n여러 지역에서 자유 수영을 올 건데,\r\n\r\n관리도 안되고,\r\n\r\n추적도 안될텐데요,\r\n\r\n\r\n\r\n\r\n한시적으로,\r\n\r\n현재 센터 등록된 회원만 자유 수영이 가능해야 하지 않을까 생각합니다.\r\n\r\n\r\n\r\n\r\n관리도 되고, 추적도 되고, 불안감도 없어질거라 생각합니다.\r\n\r\n\r\n\r\n\r\n전화사절.\r\n', '', '', '2020-02-20 20:36:57');					
INSERT INTO `gminwon` VALUES (4, '신종 코로나 바이러스 17번째 환자 발생에대해서', 'voszpdlr', '2020-02-20 20:37:17', 1, '드디어 구리 남양주 지역에도 문제가 발생되었습니다.\r\n\r\n17번째 신종코로나 바이러스 확진자가 구리에서 발생하였습니다...\r\n\r\n1월18일 부터 24일 까지 싱가포르 업무관련세미너 참석했다가 신종 sv 감염된사람과  밀접접촉으로 \r\n\r\n1월26일 19ㅅ시 발열증상등으로 구리한양대 응급실에 택시타고가서 방문진료를 받았어나 중국이아닌 싱가포르 여서 귀가 조치 후\r\n\r\n최종확진자로 판정되었다고 합니다.\r\n\r\n\r\n\r\n\r\n밀접접촉자가 3주동안 얼마나 많을지 상상이 안됩니다.\r\n\r\n빨리 휴관조치를하고 예방이 최우선이라 생각합니다...\r\n\r\n\r\n\r\n\r\n구리는 남양주 옆이어서 구리수영장가는 사람이 남양주도 자주옵니다...\r\n\r\n자유수영을 구리수영장에서 하는사람도있고....\r\n\r\n다시한번 빠른 판단으로 조속 휴관조치가 있길 바랍니다...\r\n', '', '', '2020-02-20 20:37:17');					
INSERT INTO `gminwon` VALUES (5, '남양주도시공사 관리하에 있는 체육문화시설 휴관 요청', 'voszpdlr', '2020-02-20 20:37:34', 1, '현재 대한민국을 비롯하여 전세계가 코로나바이러스의 심각성을 인지하고 있습니다.\r\n\r\n\r\n\r\n\r\n하지만 남양주 도시공사는 그 심각성을 인지하지 못하는 것 같습니다. \r\n\r\n\r\n\r\n\r\n특히 남양주 도시공사 관할아래 있는 체육문화센터의 경우는 자칫 잘못하면 바이러스를 퍼트리기 좋은 상황임에도 불구하고\r\n\r\n\r\n\r\n\r\n그 어떤 대책을 마련하지 않고 있어서 답답합니다.\r\n\r\n\r\n\r\n\r\n지난주 방문해본 진접체육문화센터의 경우 적극적으로 열을 체크하거나 손소독에 대한 언급조차 없었습니다.\r\n\r\n\r\n\r\n\r\n정문이 아닌 후문으로 가면 더욱 관리를 하지 않았습니다.\r\n\r\n\r\n\r\n\r\n현재 정부대응이 심각단계로 넘어가기 직전인데 남양주 도시공사도 빠른 대응을 해주면 좋겠습니다.\r\n\r\n\r\n\r\n\r\n특히 수영장의 경우는 물속에서 활동하다보니 눈과 입으로 바이러스 점파가 빠르게 될 수 있기에 더욱 위험합니다.\r\n\r\n\r\n\r\n\r\n현재 인근도서관에서도 휴관을 진행중입니다. 수영장 수업이라도 먼저 휴관해주시기 바랍니다.\r\n', '', '', '2020-02-20 20:37:34');					
INSERT INTO `gminwon` VALUES (6, '코로나 바이러스로 인한 휴관 요청합니다.', 'voszpdlr', '2020-02-20 20:38:24', 4, '그 동안 인근지역에서 코로나 바이러스 확진자가 발견되지 않아서 이용했었습니다.\r\n\r\n하지만, 오늘 바로 옆동네 구리시민이 확진자로 나왔고, 95번 버스를 이용하고 귀가한게 확인되었습니다. 95번버스는 구리시를 지나 남양주시로 들어오며, 차고지가 남양주시에 있습니다.\r\n\r\n이에 누구와 이용했을지, 그 버스 이용자가 커뮤니티센터에 다닐지, 아무도 모르는 것이기에 휴관함이 맞다고 생각됩니다. 검토바랍니다.\r\n', '', '', '2020-02-20 20:38:24');					
INSERT INTO `gminwon` VALUES (7, '구리시 우한폐렴 확정자 발생에 대한 휴장 건의', 'voszpdlr', '2020-02-20 20:38:43', 3, '수영장 이용 회원입니다.\r\n\r\n\r\n\r\n\r\n인접 지역인 구리시에서 확정자 발생했습니다.\r\n\r\n\r\n\r\n\r\n체감으로 느껴지는 불안감은 심각해졌는데도 센터 입장시 온도체크만으로는 (그것도 이상증상 있는것 같은 희망자에 한해서만 시행하고 있음)\r\n\r\n\r\n\r\n\r\n철저한 대비라고 생각되지않습니다.\r\n\r\n\r\n\r\n\r\n2월 휴장 건의합니다.  수강은 환불이 아닌, 연기해주시는 방식으로 요청바랍니다.\r\n\r\n\r\n\r\n\r\n화도읍에 사는 주민들의 걱정과 우려도 다시 한번 깊이 생각해주시기 바랍니다.\r\n', '', '', '2020-02-20 20:38:43');					
INSERT INTO `gminwon` VALUES (8, '신종 코로나 바이러스에 대한 관내 다른 기관과 일관된 대처 촉구', 'americano', '2020-02-21 11:21:22', 3, '관내 다른 다중이용시설은 경계로 격상되면서 개강이 미뤄졌습니다. 어째서 같은 남양주시 소재 공공시설의 대응이 이렇게 현저하게 다를 수 있는지 이해가 되지 않습니다.\r\n\r\n이하는 평생교육학습센터의 안내 문자입니다. 휴강이나 환불수수료 없는 수강철회 및 환불을 원합니다. 이런 상황에서 신규등록을 하는 사람은 극히 적을 것으로 예상되며, 따라서 신규회원의 등록 장벽은 없다고 봅니다.\r\n\r\n', '', '', '2020-02-21 11:21:22');					
INSERT INTO `gminwon` VALUES (9, '수영장 휴장 반대합니다. 증빙서류 없애고 신청자에게 환불 해주세요!', 'americano', '2020-02-21 11:22:00', 2, '자꾸 휴장하자는 글이 올라오는데요, \r\n\r\n\r\n\r\n아무래도,\r\n\r\n중국 다녀오지 않았으니,\r\n\r\n증빙서류 없어서,\r\n\r\n환불 받지 못해서,\r\n\r\n환불 받고 싶어서 그러는 분들이 많은 것 같습니다.\r\n\r\n\r\n\r\n증빙서류 없애고,\r\n\r\n신청하는 사람에 한해서,\r\n\r\n재등록 가능 하도록 2주간 환불 해주면 될 것 같습니다.\r\n\r\n\r\n\r\n그리고,\r\n\r\n당분간은 센터에 등록된 회원 이외에는,\r\n\r\n자유 수영을 금지 해서 관리 하는 것이 좋을 것 같습니다.\r\n\r\n\r\n\r\n이렇게 휴장 하자는 글이 많아지면,\r\n\r\n휴장 하지 않고 계속 수영을 하려는 사람들이 거의 대부분임에도 불구하고,\r\n\r\n도시 공사에서 휴장쪽으로 돌아설 것 같아서,\r\n\r\n\r\n\r\n반대의 글을 남깁니다.\r\n\r\n\r\n\r\n마지막으로,\r\n\r\n수영장에서는 물과 염소에 항상 담겨 있습니다.\r\n\r\n들어갈 때 씻고 들어가서 씻고, 나올 때 씻고.\r\n\r\n\r\n\r\n그래서,\r\n\r\n수영장 보다는 헬스장, 배드민턴, 테니스, 탁구, 요가등이 더 감염우려가 훨씬 크다고 봅니다.\r\n\r\n온 몸에 다 묻히고 다 돌아 다닙니다.\r\n\r\n\r\n\r\n전화사절', '', '', '2020-02-21 11:22:00');					
INSERT INTO `gminwon` VALUES (10, '초등학교 학생과 부모가 같이 수영을 할 수 있는 성인 프로그램이 있으면 좋겠습니다.', 'americano', '2020-02-21 11:27:47', 2, '안녕하세요~ 업무에 고생이 많으십니다.\r\n\r\n\r\n\r\n초등학생 자녀들이 수영수업을 할 때 부모들도 그냥 대기만 할게 아니라 같이 수영을 할 수 있도록 성인 프로그램을 만들어 주시면 좋겠습니다.\r\n\r\n\r\n\r\n서울의 다른 수영센터에서도 이런 방식으로 운영을 하고 있는데 호응이 좋은 걸로 알고 있네요.\r\n\r\n\r\n\r\n시간은 오후 4시 정도면 적당할거 같구요.\r\n\r\n\r\n\r\n감사합니다. ^^', '', '', '2020-02-21 11:27:47');					
INSERT INTO `gminwon` VALUES (11, '자유수영 오리발 레인 추가요청 건의합니다.', 'cake', '2020-02-21 11:33:19', 3, '자유수영시 오리발 레인 추가요청이 과거부터 있었던 것으로 알고 있는데\r\n\r\n매번 일반레인을 축소 운영에 따른 일반수영 회원들의 불편을 이유로\r\n\r\n오리발 레인 추가가 안되고 있습니다.\r\n\r\n\r\n\r\n센터에서 말씀하시는 급수에 따라 2개소씩 배정이 안되면\r\n\r\n적어도 한개 레인정도는 먼저 운영을 할 수 있다고 생각합니다.\r\n\r\n\r\n\r\n강습때만 가능한 오리발 수영을 자유수영 때도 가능하도록 하여\r\n\r\n개인적으로 영법 연습도 하고, 자세 교정, 페이스 조절도 해보고 싶은데 말이죠..\r\n\r\n\r\n\r\n다시 한번 오리발 레인 추가 요청을 건의합니다.', '', '', '2020-02-21 11:33:19');					
INSERT INTO `gminwon` VALUES (12, '점점 물속의 부유물질들이 많이 보입니다.', 'cake', '2020-02-21 11:33:46', 6, '수영장 물에 관한 질의 내용입니다.\r\n\r\n\r\n\r\n요근래에 수영장 물의 탁도나 물속에 떠다니는 부유물질들이 많이 보입니다.\r\n\r\n\r\n\r\n겨울철의 수영장 수질 관리는 어느 수영장이나 매년 문제가 되곤 합니다.\r\n\r\n\r\n\r\n겨울 감기철입니다. \r\n\r\n\r\n\r\n좀더 세심한 주의 관리 및  수질관리에 노력해 주시면 감사하겠습니다.', '', '', '2020-02-21 11:33:46');					
INSERT INTO `gminwon` VALUES (13, '탈의실', 'qkqk', '2020-02-21 11:40:03', 1, '이번에 수영장 공사후 느낀점은 정말 샤워장만 넓어졌구나 입니다..앞에 남자분이 여자 샤워장은 좋아졌다하셨는데 전혀입니다..탈의실은 너무 좁아 두사람이 서서 할수 있는 공간이 아닙니다 설상가상 같은 시간대 사람들을 한쪽 통로에 몰아서 번호가 배치 됩니다..탈의실 공간이 좁아 으면  같은시간대 들어오면 분산해서 번호가 부여되어야 할텐데 어떻게 프로그램이 되었는지 그 좁은 통로에 8명정도가 같이 있으니 옷 입다가 옆에 사람 치는건 물론이고 그중엔 아예 자기 자리에서 아무것도 할 수없어서  조금이나마 있는 공간 찾아 옷들고 찾아 다닙니다..이게 무슨 탈의실입니까!\r\n\r\n좁아진 탈의실 어쩔수 없다하더라도 번호 부여하는 프로그램도 뭔가 잘 못된것 같습니다..확인해보시고 개선 부탁드립니다', '', '', '2020-02-21 11:40:03');					
INSERT INTO `gminwon` VALUES (14, '수영장 수질 개선 요청건', 'qkqk', '2020-02-21 11:40:32', 4, '오늘도  업체에서 수영장 내에서 수질 검사하는 것을 보았습니다.\r\n\r\n\r\n\r\n그런데 수질 검사를 하면 뭐 합니까 얼마있으면 정말 물이 혼탁해서 시야까지 흐린 적이 여러번 있습니다.\r\n\r\n\r\n\r\n저만 이런 애기를 하는 것이 아닙니다.\r\n\r\n\r\n\r\n에코랜드측에서는  회원님들이 수영장 입장시에 수영복에 비누가 묻어서 그렇다 등등 애기합니다만,  그건 일부분입니다.\r\n\r\n\r\n\r\n지속적인 물교환입니다.   물론 순환물관리를 하고 있다고 하지만 정말 심한날들이 있습니다.\r\n\r\n\r\n\r\n또한 다른 남양주도시공사에서 운영하는 수영장은, 지속적으로 물을 흘러내려서 순환적으로 물을 필터링화하는듯 하는데 유독 에코랜드는 거의 물을 넘치게 하지 않더군요. 물을 아끼는건가요?  물 옆 배수구를 통해서 물이 지속적으로 필터링해야되지 않나요?\r\n\r\n\r\n\r\n물에서 화장품 냄새 , 거품, 등등 이 시기만 되면 너무 심합니다.\r\n\r\n\r\n\r\n수질검사는 수질검사항목 몇개만 하는 것이고 기타 물관리는 안하시나요?\r\n\r\n\r\n물좀 자주 갈아주세요. 특히나 에코랜드는 지역노인분들이 많이 애용하는 운동시설이잖아요. \r\n\r\n\r\n감기시즌입니다. 물좀 잘 관리해주세요.  부탁드립니다. ', '1', '개선하겠습니다.', '2020-02-21 14:03:00');					
INSERT INTO `gminwon` VALUES (15, '헬스장 월회원 등록 종류 다양화 해주세요', 'prog', '2020-02-21 11:43:38', 5, '오산 스포츠센터에서 4년째 헬스장을 이용해 운동을 하고 있습니다.\r\n꾸준히 운동을 하여 체력도 많이 좋아지고 근육도 많이 증가 하였습니다.\r\n\r\n운동을 꾸준히 하다보니 다른 스포츠 활동에도 관심이 생겨 다양한 스포츠를 즐기고 싶습니다.\r\n그러다보니 헬스를 월회원으로 등록하여도 일주일에 세번정도 밖에 이용을 못하게 됩니다.\r\n그렇다고 운동시간이 저녁이라 일일 입장권을 발행받아 운동할수도 없습니다.\r\n\r\n헬스도 요가나 수영처럼 월, 수, 금 또는 화, 목, 토 처럼 요일을 지정하여 이용하는 월회뭔 등록을 할수 있도록 개선해 주시기 바랍니다.\r\n나아가 월, 수, 금 헬스 화, 목, 토 자유 수영 과 같이 다른 종목의 스포츠를 이용할수 있는 월회원 등록을 할수 있도록 개선하는 것도 생각해 볼수 있을것 같습니다\r\n\r\n헬스도 요가나 수영처럼 월, 수, 금 또는 화, 목, 토 처럼 요일을 지정하여 이용하는 월회뭔 등록을 할수 있도록 개선해 주시기 바랍니다.\r\n나아가 월, 수, 금 헬스 화, 목, 토 자유 수영 과 같이 다른 종목의 스포츠를 이용할수 있는 월회원 등록을 할수 있도록 개선하는 것도 생각해 볼수 있을것 같습니다.\r\n  \r\n오산 스프츠센터를 이용하는 회원들이 다양한 스포츠로 즐겁게 운동하면서 건강을 챙길수 있을것 같습니다.', '1', '안녕하십니까, 회원님\r\n\r\n우선 오산스포츠센터를 이용하시며 불편사항 겪으시게 된 점에 대하여\r\n\r\n양해 말씀을 드리며 헬스장 월 회원 요일지정에 대해 답변을 드리겠습니다.\r\n \r\n현재 헬스장은 월 400여명에 회원님과 일일입장 고객(약180명) 분들이 이용하고 계십니다.\r\n \r\n한정된 공간에서 다수의 이용객이 이용하다보니 모든 고객님들이 원하는 월정기권을 운영하기는 어렵습니다.\r\n \r\n하지만 이용하시는 모든 이용객님들의 위해 3명의 유능한 강사 분들이 교대근무와 지도룰 통한\r\n \r\n다양성을 제공하고자 노력하고 있으며, 2020년 리모델링 시 노후 된 장비 교체 및 일부 장비가 증설 될\r\n\r\n예정임을 알려드리오며 앞으로도 이용하시는 이용객님들의 위해 최선을 하다는\r\n \r\n오산스포츠센터가 되도록 노력하겠습니다.\r\n\r\n더 궁금하신 사항은 공단 홈페이지(www.osansports.or.kr)\r\n \r\n감사합니다\r\n', '2020-02-21 11:45:22');					
INSERT INTO `gminwon` VALUES (16, '강사분들 로테이션', 'dkdk', '2020-02-21 11:45:59', 8, '1월에 강사분들 로테이션이 있다고 들었습니다\r\n\r\n\r\n\r\n10월에 월수금 10시 11시반에 새로운반이 신설 되면서\r\n\r\n레인 조정과 강사분들 조정이 있었는데\r\n\r\n1월에 다시 강사분들 로테이션을 한다면 \r\n\r\n또 강사분이 바뀌게 되겠지요?\r\n\r\n\r\n\r\n현재 월수금 10시 11시 강습은 초급 중급 상급의 \r\n\r\n선생님 배치가 같은 걸로 알고있습니다\r\n\r\n선생님을 선택해서 시간 조정을 할수도 없는 상황인데\r\n\r\n로테이션까지 그대로 똑같이 하게된다면 \r\n\r\n많은 분들이 불만이 생길거라 생각됩니다\r\n\r\n\r\n\r\n저번에 직원분께 여쭤봤을때 분명 재고하겠다고 말씀해주셨는데 굳이 강사분들이 바뀐지 3개월 밖에 안된 상황에 또 로테이션을 해야만 하는건지 궁금합니다.\r\n\r\n\r\n\r\n꼭 해야만 한다면 10시 11시 강사분들 배치를 좀 다르게 해서 강사분 선택해서 강습을 들을 수 있도록 해주시면 좋겠습니다', '1', 'dfwerfwerwerwer', '2020-02-21 15:57:54');					
INSERT INTO `gminwon` VALUES (18, '자유수영 30명제한을 50명으로 증원', 'powerswimmer', '2020-02-21 11:59:56', 63, '자유수영 입장 인원수 증원을 부탁드립니다.\r\n\r\n30명 제한을 두었는데 입장하고 나면 더 수용해도 될것 같은데요\r\n\r\n규모에 비해 너무적은 수용인원을  적용하여 많은 불편을 느낌니다.\r\n\r\n\r\n50명선은 수용해도 좋을듯 합니다.\r\n\r\n 그러면 운동하는데 많은 도움이 될것 같은데요\r\n\r\n\r\n좋은시설에 더 많은 주민이 이용을 했으면 하는 바램입니다.', '1', '감사!!', '2020-02-21 12:31:59');					
INSERT INTO `gminwon` VALUES (19, '민원입니다.', 'member', '2020-02-21 13:23:07', 10, '민원입니다.', '1', '감사합니다', '2020-02-21 13:54:42');					
INSERT INTO `gminwon` VALUES (20, '마스크주세요', 'solsol', '2020-02-21 15:36:56', 8, '마스크 지원좀요', '1', '안녕하세요 솔 님! \r\n쌍용문화센터 관리자 박상욱입니다. 현재 코로나19 발생의 영향으로 마스크 공급이 지연되고있습니다. 마스크입고 시 등록된 회원 핸드폰번호로 문자보내드리겠습니다. 감사합니다. ', '2020-02-21 15:40:15');					
INSERT INTO `gminwon` VALUES (21, '집에 보내주세요', 'solsol', '2020-02-21 16:05:07', 3, '이쯤되면 집에 갈때도 됐습니다.', '1', '안녕하세요~\r\nsqld준비하셔야합니다.\r\n앞으로 자주이용해 주세요 -구몬', '2020-02-21 16:05:42');					
INSERT INTO `gminwon` VALUES (22, '창문 지속적으로 열어 주세요', 'oo00oo', '2020-02-21 16:05:29', 3, '더워요', '', '', '2020-02-21 16:05:29');					
INSERT INTO `gminwon` VALUES (23, '왜 수영을 개나리에서 하는거죠? 개나리 맘에안들어요', 'solsol', '2020-02-21 16:06:30', 5, '시설이 너무 안좋아요 변경 좀해주세요', '1', '안녕하세요 솔솔님~\r\n솔솔님 의견을 반영해 개편해보겠습니다.\r\n따끔한 충고  감사드립니다.', '2020-02-21 16:07:34');					
INSERT INTO `gminwon` VALUES (24, '답변해주나요?', 'wnfl7052', '2020-02-21 16:08:02', 5, '정말 답변가능한가요?', '', '', '2020-02-21 16:08:02');					
INSERT INTO `gminwon` VALUES (25, '까꿍', '123', '2020-02-21 16:08:41', 3, '까꿍', '', '', '2020-02-21 16:08:41');					
INSERT INTO `gminwon` VALUES (26, '안녕하세요~ 쌍용문화센터~', '나융', '2020-02-21 16:08:45', 4, '테니스 수업은 없나요?', '1', 'qweqweqwe', '2020-02-21 16:09:11');					
					
INSERT INTO `grent` VALUES (1, 'asd', 'google', 'asd', '2020-02-21 11:13:45', '2020-02-21', 'asd', 'asd', 0, '');					
INSERT INTO `grent` VALUES (2, 'americano', '오나라', '테니스코트', '2020-02-21 11:25:42', '2020-02-29', '테니스 연습', '2', 0, '');					
INSERT INTO `grent` VALUES (3, 'americano', '오나라', '일반수영장-2', '2020-02-21 11:27:02', '2020-03-07', '동호회 회원들과 수영', '15', 0, '');					
INSERT INTO `grent` VALUES (4, 'cake', '박상욱', '축구장-2', '2020-02-21 11:32:53', '2020-03-18', '모임 단체 축구', '20', 0, '');					
INSERT INTO `grent` VALUES (5, 'qkqk', '김은솔', '운동장(대운동장)', '2020-02-21 12:11:31', '2020-02-24', '사내 운동회', '100', 2, '우한 사태로 3월 12일까지 휴관이기 때문에 대관이 불가합니다.');					
INSERT INTO `grent` VALUES (6, 'dkdk', '김명선', '강습장1', '2020-02-21 11:44:51', '2020-02-27', '개인적인 요가 강습', '12', 0, '');					
INSERT INTO `grent` VALUES (7, 'member', '윤이랑', '대운동장', '2020-02-21 12:46:49', '2020-04-23', '사내 운동회', '100', 2, '우한 사태로 3월 12일까지 휴관합니다.');					
INSERT INTO `grent` VALUES (8, 'member', '윤이랑', '일반농구장-2', '2020-02-21 12:46:24', '2020-02-24', '가족 운동회', '6', 1, '');					
INSERT INTO `grent` VALUES (9, 'powerswimmer', '박태환', '일반수영장-1', '2020-02-21 12:10:51', '2020-03-05', '동호회 수영대회', '13', 1, '');					
INSERT INTO `grent` VALUES (10, 'ㄹ', 'qwe', 'qwe', '2020-02-21 14:04:31', '2020-02-20', 'qwe', 'qwe', 1, '');					
INSERT INTO `grent` VALUES (11, 'ㄹ', 'qwe', 'e', '2020-02-21 14:13:08', '2020-02-13', 'r', 'r', 2, '감사합니다');					
INSERT INTO `grent` VALUES (12, '5', '1', '1', '2020-02-21 14:26:39', '2020-02-02', '1', '1', 0, '');					
INSERT INTO `grent` VALUES (13, 'member', '주진희', '대운동장', '2020-02-21 15:26:03', '2020-02-20', 'z', '2', 1, '');					
INSERT INTO `grent` VALUES (14, 'solsol', '김은솔', 's02', '2020-02-21 15:58:10', '2020-02-21', '풋살예정', '30', 1, '');					
INSERT INTO `grent` VALUES (15, '0', 'q', 'qq', '2020-02-21 15:58:26', '2020-02-21', '1', '1', 2, 'asdasd');					
INSERT INTO `grent` VALUES (16, 'zlzlzlzlzl', 'zlzlzl', 'zlzlzlz', '2020-02-21 16:06:48', '2020-02-06', '111', '5', 0, '');					
INSERT INTO `grent` VALUES (17, 'wnfl7052', 'a', '어울림수영장', '2020-02-21 16:07:31', '2022-02-09', '동호회', '100', 0, '');					
INSERT INTO `grent` VALUES (18, 'psw', 'asd', 'qwe', '2020-02-21 16:09:27', '2020-02-06', '2', '1', 2, 'qweqweqwe');					
INSERT INTO `grent` VALUES (19, 'minjoo', '송', '알아서 뭐해', '2020-02-21 16:08:27', '2020-02-13', '알아서 모하게요', '1', 0, '');					
INSERT INTO `grent` VALUES (20, '112', '12121', '12', '2020-02-21 16:11:52', 'YYYY-MM21212-DD', '212', '12121', 0, '');					
INSERT INTO `grent` VALUES (21, '112', 'meme', '쌍용', '2020-02-21 16:12:56', '2020-09-20', '운동', '2', 0, '');					
					
					
INSERT INTO `glike` VALUES (1, '5');					
INSERT INTO `glike` VALUES (2, '211.63.89.85');					
INSERT INTO `glike` VALUES (2, 'voszpdlr');					
INSERT INTO `glike` VALUES (2, '0:0:0:0:0:0:0:1');					
INSERT INTO `glike` VALUES (2, '5');					
INSERT INTO `glike` VALUES (1, 'z');					
INSERT INTO `glike` VALUES (2, 'z');					
INSERT INTO `glike` VALUES (3, '211.63.89.94');					
INSERT INTO `glike` VALUES (1, '211.63.89.94');					
INSERT INTO `glike` VALUES (2, 'zxc');					
INSERT INTO `glike` VALUES (1, 'zxc');					
INSERT INTO `glike` VALUES (2, 'voszpdlr');					
INSERT INTO `glike` VALUES (2, '211.63.89.85');					
INSERT INTO `glike` VALUES (4, '0:0:0:0:0:0:0:1');					
INSERT INTO `glike` VALUES (5, 'voszpdlr');					
INSERT INTO `glike` VALUES (6, 'z');					
INSERT INTO `glike` VALUES (7, 'z');					
INSERT INTO `glike` VALUES (5, '211.63.89.85');					
INSERT INTO `glike` VALUES (5, '211.63.89.29');					
INSERT INTO `glike` VALUES (7, '211.63.89.29');					
INSERT INTO `glike` VALUES (5, 'admin');					
INSERT INTO `glike` VALUES (7, 'admin');					
INSERT INTO `glike` VALUES (4, 'admin');					
INSERT INTO `glike` VALUES (7, 'minwon');					
INSERT INTO `glike` VALUES (1, 'minwon');					
INSERT INTO `glike` VALUES (9, 'minwon');					
INSERT INTO `glike` VALUES (8, 'minwon');					
INSERT INTO `glike` VALUES (10, '211.63.89.85');					
INSERT INTO `glike` VALUES (1, '211.63.89.85');					
INSERT INTO `glike` VALUES (10, 'test2');					
INSERT INTO `glike` VALUES (11, 'test2');					
INSERT INTO `glike` VALUES (11, '211.63.89.29');					
INSERT INTO `glike` VALUES (1, 'admin');					
INSERT INTO `glike` VALUES (7, 'voszpdlr');					
INSERT INTO `glike` VALUES (6, 'voszpdlr');					
INSERT INTO `glike` VALUES (4, 'voszpdlr');					
INSERT INTO `glike` VALUES (3, 'voszpdlr');					
INSERT INTO `glike` VALUES (7, 'americano');					
INSERT INTO `glike` VALUES (6, 'americano');					
INSERT INTO `glike` VALUES (3, 'americano');					
INSERT INTO `glike` VALUES (1, 'americano');					
INSERT INTO `glike` VALUES (3, '211.63.89.29');					
INSERT INTO `glike` VALUES (9, 'americano');					
INSERT INTO `glike` VALUES (12, 'cake');					
INSERT INTO `glike` VALUES (8, 'cake');					
INSERT INTO `glike` VALUES (12, 'qkqk');					
INSERT INTO `glike` VALUES (11, 'qkqk');					
INSERT INTO `glike` VALUES (8, 'qkqk');					
INSERT INTO `glike` VALUES (1, 'qkqk');					
INSERT INTO `glike` VALUES (6, 'qkqk');					
INSERT INTO `glike` VALUES (13, 'qkqk');					
INSERT INTO `glike` VALUES (14, 'qkqk');					
INSERT INTO `glike` VALUES (15, '211.63.89.29');					
INSERT INTO `glike` VALUES (15, 'dkdk');					
INSERT INTO `glike` VALUES (16, 'dkdk');					
INSERT INTO `glike` VALUES (16, 'member');					
INSERT INTO `glike` VALUES (17, 'powerswimmer');					
INSERT INTO `glike` VALUES (14, 'powerswimmer');					
INSERT INTO `glike` VALUES (12, 'powerswimmer');					
INSERT INTO `glike` VALUES (11, 'powerswimmer');					
INSERT INTO `glike` VALUES (18, '7');					
INSERT INTO `glike` VALUES (18, 'admin');					
INSERT INTO `glike` VALUES (12, 'member');					
INSERT INTO `glike` VALUES (16, 'ㄹ');					
INSERT INTO `glike` VALUES (19, '211.63.89.29');					
INSERT INTO `glike` VALUES (12, '211.63.89.29');					
INSERT INTO `glike` VALUES (3, 'admin');					
INSERT INTO `glike` VALUES (20, 'solsol');					
INSERT INTO `glike` VALUES (19, '0');					
INSERT INTO `glike` VALUES (16, 'admin');					
INSERT INTO `glike` VALUES (24, 'wnfl7052');					
INSERT INTO `glike` VALUES (24, 'psw');					
					
INSERT INTO `gcourse` VALUES ('2001s1', '수영', '성인/청소년수영', '06:00~06:50', '2020-01-03', '2020-01-28', '2층 매실', 30, 55000, 'ss0');					
INSERT INTO `gcourse` VALUES ('2001s2', '수영', '실버수영/아쿠아로빅', '06:00~06:50', '2020-01-03', '2020-01-28', '2층 동백', 20, 60000, 'ss1');					
INSERT INTO `gcourse` VALUES ('2001s3', '수영', '성인/청소년 아쿠아로빅', '07:00~07:50', '2020-01-03', '2020-01-28', '2층 장미', 10, 50000, 'ss2');					
INSERT INTO `gcourse` VALUES ('2001s4', '수영', '어린이 수영', '16:00~16:50', '2020-01-03', '2020-01-28', '2층 아카시아', 30, 50000, 'ss3');					
INSERT INTO `gcourse` VALUES ('2001s5', '수영', '유아수영', '17:00~17:50', '2020-01-03', '2020-01-28', '2층 튤립', 20, 50000, 'ss0');					
INSERT INTO `gcourse` VALUES ('2001s6', '수영', '주말수영', '06:00~06:50', '2020-01-03', '2020-01-28', '2층 나팔', 20, 50000, 'ss1');					
INSERT INTO `gcourse` VALUES ('2001s7', '수영', '어울림수영', '06:00~06:50', '2020-01-03', '2020-01-28', '2층 개나리', 25, 50000, 'ss2');					
INSERT INTO `gcourse` VALUES ('2002s1', '수영', '성인/청소년수영', '06:00~06:50', '2020-02-03', '2020-02-28', '2층 매실', 30, 55000, 'ss3');					
INSERT INTO `gcourse` VALUES ('2002s2', '수영', '실버수영/아쿠아로빅', '06:00~06:50', '2020-02-03', '2020-02-28', '2층 동백', 20, 60000, 'ss0');					
INSERT INTO `gcourse` VALUES ('2002s3', '수영', '성인/청소년 아쿠아로빅', '07:00~07:50', '2020-02-03', '2020-02-28', '2층 장미', 10, 50000, 'ss1');					
INSERT INTO `gcourse` VALUES ('2002s4', '수영', '어린이 수영', '16:00~16:50', '2020-02-03', '2020-02-28', '2층 아카시아', 30, 50000, 'ss2');					
INSERT INTO `gcourse` VALUES ('2002s5', '수영', '유아수영', '17:00~17:50', '2020-02-03', '2020-02-28', '2층 튤립', 20, 50000, 'ss3');					
INSERT INTO `gcourse` VALUES ('2002s6', '수영', '주말수영', '06:00~06:50', '2020-02-03', '2020-02-28', '2층 나팔', 20, 50000, 'ss0');					
INSERT INTO `gcourse` VALUES ('2002s7', '수영', '어울림수영', '06:00~06:50', '2020-02-03', '2020-02-28', '2층 개나리', 25, 50000, 'ss1');					
INSERT INTO `gcourse` VALUES ('2003s1', '수영', '성인/청소년수영', '06:00~06:50', '2020-03-03', '2020-03-28', '2층 매실', 30, 55000, 'ss2');					
INSERT INTO `gcourse` VALUES ('2003s2', '수영', '실버수영/아쿠아로빅', '06:00~06:50', '2020-03-03', '2020-03-28', '2층 동백', 20, 60000, 'ss3');					
INSERT INTO `gcourse` VALUES ('2003s3', '수영', '성인/청소년 아쿠아로빅', '07:00~07:50', '2020-03-03', '2020-03-28', '2층 장미', 10, 50000, 'ss0');					
INSERT INTO `gcourse` VALUES ('2003s4', '수영', '어린이 수영', '16:00~16:50', '2020-03-03', '2020-03-28', '2층 아카시아', 30, 50000, 'ss1');					
INSERT INTO `gcourse` VALUES ('2003s5', '수영', '유아수영', '17:00~17:50', '2020-03-03', '2020-03-28', '2층 튤립', 20, 50000, 'ss2');					
INSERT INTO `gcourse` VALUES ('2003s6', '수영', '주말수영', '06:00~06:50', '2020-03-03', '2020-03-28', '2층 나팔', 20, 50000, 'ss3');					
INSERT INTO `gcourse` VALUES ('2003s7', '수영', '어울림수영', '06:00~06:50', '2020-03-03', '2020-03-28', '2층 개나리', 25, 50000, 'ss0');					
INSERT INTO `gcourse` VALUES ('2001h1', '헬스', '평일반', '06:00~06:50', '2020-01-03', '2020-01-28', '3층 링딩동', 35, 30000, 'hs0');					
INSERT INTO `gcourse` VALUES ('2001h2', '헬스', '저녁반', '21:00~21:50', '2020-01-03', '2020-01-28', '3층 링딩동', 35, 30000, 'hs1');					
INSERT INTO `gcourse` VALUES ('2001h3', '헬스', '주말반', '21:00~21:50', '2020-01-03', '2020-01-28', '3층 링딩동', 35, 30000, 'hs2');					
INSERT INTO `gcourse` VALUES ('2002h1', '헬스', '평일반', '06:00~06:50', '2020-02-03', '2020-02-28', '3층 링딩동', 35, 30000, 'hs3');					
INSERT INTO `gcourse` VALUES ('2002h2', '헬스', '저녁반', '21:00~21:50', '2020-02-03', '2020-02-28', '3층 링딩동', 35, 30000, 'hs1');					
INSERT INTO `gcourse` VALUES ('2002h3', '헬스', '주말반', '21:00~21:50', '2020-02-03', '2020-02-28', '3층 링딩동', 35, 30000, 'hs2');					
INSERT INTO `gcourse` VALUES ('2003h1', '헬스', '평일반', '06:00~06:50', '2020-03-03', '2020-03-28', '3층 링딩동', 35, 30000, 'hs3');					
INSERT INTO `gcourse` VALUES ('2003h2', '헬스', '저녁반', '21:00~21:50', '2020-03-03', '2020-03-28', '3층 링딩동', 35, 30000, 'hs0');					
INSERT INTO `gcourse` VALUES ('2003h3', '헬스', '주말반', '21:00~21:50', '2020-03-03', '2020-03-28', '3층 링딩동', 35, 30000, 'hs1');					
INSERT INTO `gcourse` VALUES ('2001p1', '파워스피닝', '평일반', '06:00~06:50', '2020-01-03', '2020-01-28', '1층 붐붐붐', 25, 35000, 'ps0');					
INSERT INTO `gcourse` VALUES ('2001p2', '파워스피닝', '저녁반', '21:00~21:50', '2020-01-03', '2020-01-28', '1층 붐붐붐', 25, 35000, 'ps1');					
INSERT INTO `gcourse` VALUES ('2001p3', '파워스피닝', '주말반', '21:00~21:50', '2020-01-03', '2020-01-28', '1층 붐붐붐', 25, 35000, 'ps2');					
INSERT INTO `gcourse` VALUES ('2002p1', '파워스피닝', '평일반', '06:00~06:50', '2020-02-03', '2020-02-28', '1층 붐붐붐', 25, 35000, 'ps3');					
INSERT INTO `gcourse` VALUES ('2002p2', '파워스피닝', '저녁반', '21:00~21:50', '2020-02-03', '2020-02-28', '1층 붐붐붐', 25, 35000, 'ps0');					
INSERT INTO `gcourse` VALUES ('2002p3', '파워스피닝', '주말반', '21:00~21:50', '2020-02-03', '2020-02-28', '1층 붐붐붐', 25, 35000, 'ps1');					
INSERT INTO `gcourse` VALUES ('2003p1', '파워스피닝', '평일반', '06:00~06:50', '2020-03-03', '2020-03-28', '1층 붐붐붐', 25, 35000, 'ps2');					
INSERT INTO `gcourse` VALUES ('2003p2', '파워스피닝', '저녁반', '21:00~21:50', '2020-03-03', '2020-03-28', '1층 붐붐붐', 25, 35000, 'ps3');					
INSERT INTO `gcourse` VALUES ('2003p3', '파워스피닝', '주말반', '21:00~21:50', '2020-03-03', '2020-03-28', '1층 붐붐붐', 25, 35000, 'ps3');					
					
INSERT INTO `glocation` VALUES ('수영장', '어린이수영장', 'cs01', 200000, 25);					
INSERT INTO `glocation` VALUES ('수영장', '일반수영장-1', 'ns01', 200000, 25);					
INSERT INTO `glocation` VALUES ('수영장', '일반수영장-2', 'ns02', 200000, 25);					
INSERT INTO `glocation` VALUES ('운동장', '대운동장', 'bp01', 300000, 200);					
INSERT INTO `glocation` VALUES ('운동장', '일반운동장', 'np01', 200000, 100);					
INSERT INTO `glocation` VALUES ('운동장', '일반운동장', 'np02', 200000, 100);					
INSERT INTO `glocation` VALUES ('축구장', '축구장-2', 's02', 250000, 50);					
INSERT INTO `glocation` VALUES ('농구장', '일반농구장-1', 'nb01', 150000, 20);					
INSERT INTO `glocation` VALUES ('농구장', '일반농구장-2', 'nb02', 150000, 20);					
INSERT INTO `glocation` VALUES ('실내운동장', '어린이운동장', 'cp01', 100000, 50);					
INSERT INTO `glocation` VALUES ('실내운동장', '일반실내-1', 'np01', 150000, 80);					
INSERT INTO `glocation` VALUES ('실내운동장', '일반실내-1', 'np01', 150000, 80);					
INSERT INTO `glocation` VALUES ('배드민턴장', '배드민턴코드-1', 'bc01', 200000, 15);					
INSERT INTO `glocation` VALUES ('배드민턴장', '배드민턴코드-2', 'bc02', 200000, 15);					
INSERT INTO `glocation` VALUES ('테니스코트', '테니스코드-1', 'tc01', 200000, 15);					
INSERT INTO `glocation` VALUES ('테니스코트', '테니스코드-2', 'tc02', 200000, 15);					
INSERT INTO `glocation` VALUES ('아이스링크장', '아이스링크장-1', 'al01', 400000, 50);					
INSERT INTO `glocation` VALUES ('아이스링크장', '아이스링크장-2', 'al02', 400000, 50);					
INSERT INTO `glocation` VALUES ('강습장', '강습장-1', 'cr01', 100000, 20);					
INSERT INTO `glocation` VALUES ('강습장', '강습장-2', 'cr02', 100000, 20);					
INSERT INTO `glocation` VALUES ('강습장', '강습장-3', 'cr03', 100000, 20);					
INSERT INTO `glocation` VALUES ('강습장', '강습장-4', 'cr04', 100000, 20);					
INSERT INTO `glocation` VALUES ('강습장', '강습장-5', 'cr05', 100000, 20);					
INSERT INTO `glocation` VALUES ('수영장', '대수영장', 'bsp01', 10000000, 100);					
					
INSERT INTO `gtrainer` VALUES ('bh1', '정민우', 'applejung312@gmail.com', '생활체육-1급', '010-01010-0101');					
INSERT INTO `gtrainer` VALUES ('hs0', '김욱선', 'yeeff@gmail.com', '생활스포츠지도사', '010-3525-1114');					
INSERT INTO `gtrainer` VALUES ('hs1', '김진아', 'ccsdg@gmail.com', '', '010-111-1115');					
INSERT INTO `gtrainer` VALUES ('hs2', '김태균', 'jjhf66@gmail.com', '', '010-111-1116');					
INSERT INTO `gtrainer` VALUES ('hs3', '박선미', 'ur646@naver.com', '', '010-111-1117');					
INSERT INTO `gtrainer` VALUES ('ps0', '박지영', 'hkg5333@naver.com', '', '010-111-1118');					
INSERT INTO `gtrainer` VALUES ('ps1', '방미희', '', '', '010-111-1119');					
INSERT INTO `gtrainer` VALUES ('ps2', '방준성', 'kosangjiz@naver.com', '', '010-111-1120');					
INSERT INTO `gtrainer` VALUES ('ps3', '서양덕', '', '', '010-111-1121');					
INSERT INTO `gtrainer` VALUES ('ss0', '강경수', 'kkk@naver.com', '생활스포츠지도사2급', '010-222-2222');					
INSERT INTO `gtrainer` VALUES ('ss1', '고상지', 'kosangjiz@naver.com', '생존수영강사자격증', '010-111-1111');					
INSERT INTO `gtrainer` VALUES ('ss2', '김소희', 'sada221@naver.com', '', '010-111-1112');					
INSERT INTO `gtrainer` VALUES ('ss3', '김수정', 'cxbfdah@naver.com', '', '010-111-1113');					
INSERT INTO `gtrainer` VALUES ('yo0', '양지혜', '', '', '010-111-1122');					
INSERT INTO `gtrainer` VALUES ('yo1', '유선화', '12_snu@naver.com', '필라테스지도자', '010-111-1123');					
INSERT INTO `gtrainer` VALUES ('yo2', '윤미라', '', '', '010-111-1124');					
INSERT INTO `gtrainer` VALUES ('zb0', '이길라', '', '', '010-111-1125');					
INSERT INTO `gtrainer` VALUES ('zb1', '이성미', 'lsm@naver.com', '', '010-111-1126');					
					
INSERT INTO `glocation` VALUES ('수영장', '어린이수영장', 'cs01', 200000, 25);					
INSERT INTO `glocation` VALUES ('수영장', '일반수영장-1', 'ns01', 200000, 25);					
INSERT INTO `glocation` VALUES ('수영장', '일반수영장-2', 'ns02', 200000, 25);					
INSERT INTO `glocation` VALUES ('운동장', '대운동장', 'bp01', 300000, 200);					
INSERT INTO `glocation` VALUES ('운동장', '일반운동장', 'np01', 200000, 100);					
INSERT INTO `glocation` VALUES ('운동장', '일반운동장', 'np02', 200000, 100);					
INSERT INTO `glocation` VALUES ('축구장', '축구장-1', 's01', 250000, 50);					
INSERT INTO `glocation` VALUES ('축구장', '축구장-2', 's02', 250000, 50);					
INSERT INTO `glocation` VALUES ('농구장', '일반농구장-1', 'nb01', 150000, 20);					
INSERT INTO `glocation` VALUES ('농구장', '일반농구장-2', 'nb02', 150000, 20);					
INSERT INTO `glocation` VALUES ('실내운동장', '어린이운동장', 'cp01', 100000, 50);					
INSERT INTO `glocation` VALUES ('실내운동장', '일반실내-1', 'np01', 150000, 80);			 		
INSERT INTO `glocation` VALUES ('실내운동장', '일반실내-1', 'np01', 150000, 80);					
INSERT INTO `glocation` VALUES ('배드민턴장', '배드민턴코드-1', 'bc01', 200000, 15);					
INSERT INTO `glocation` VALUES ('배드민턴장', '배드민턴코드-2', 'bc02', 200000, 15);					
INSERT INTO `glocation` VALUES ('테니스코트', '테니스코드-1', 'tc01', 200000, 15);					
INSERT INTO `glocation` VALUES ('아이스링크장', '아이스링크장-1', 'al01', 400000, 50);					
INSERT INTO `glocation` VALUES ('아이스링크장', '아이스링크장-2', 'al02', 400000, 50);					
INSERT INTO `glocation` VALUES ('강습장', '강습장-1', 'cr01', 100000, 20);					
INSERT INTO `glocation` VALUES ('강습장', '강습장-2', 'cr02', 100000, 20);					
INSERT INTO `glocation` VALUES ('강습장', '강습장-3', 'cr03', 100000, 20);					
INSERT INTO `glocation` VALUES ('강습장', '강습장-4', 'cr04', 100000, 20);					
INSERT INTO `glocation` VALUES ('강습장', '강습장-5', 'cr05', 100000, 20);					
INSERT INTO `glocation` VALUES ('수영장', '전기장판', 'heaven', 1, 1);					