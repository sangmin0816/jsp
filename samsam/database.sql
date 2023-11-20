-- member
CREATE TABLE MEMBER(
	id VARCHAR(16) NOT NULL,   -- (아이디)
	pw VARCHAR(300) NOT NULL,   -- (비밀번호)
	NAME VARCHAR(100) NOT NULL,   -- (이름)
	email VARCHAR(100) NOT NULL,   -- (이메일)
	tel VARCHAR(13),   -- (전화번호)
	birth DATE, -- 생년월일
	address VARCHAR(300), -- 주소
	postcode VARCHAR(10),
	regdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,   -- (가입일)
	POINT INT DEFAULT 0,   -- (포인트)
	grade VARCHAR(4) DEFAULT 'F',
	state BOOLEAN DEFAULT TRUE,
	PRIMARY KEY (id)
);

-- qna
CREATE TABLE qna(
	qno INT PRIMARY KEY AUTO_INCREMENT,   -- (문의번호) 자동발생
	title VARCHAR(100) NOT NULL,   -- (문의 제목)
	content VARCHAR(1000) NOT NULL,   -- (문의 내용)
	memId VARCHAR(16),   -- (문의 작성자)
	regdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),   -- (문의 등록일)
	visited INT DEFAULT 0,   -- (조회수)
	lev INT DEFAULT 0, -- 질문(0), 답변(1)
	par INT,	-- 부모 글번호 -> 질문(자신 레코드의 qno), 답변(질문의 글번호)
	secret BOOLEAN DEFAULT 0,	-- 비밀글 유무
	FOREIGN KEY(memId) REFERENCES member(id) ON DELETE CASCADE
);

-- faq
CREATE TABLE faq(
	fno INT PRIMARY KEY AUTO_INCREMENT,   -- (문의번호) 자동발생
	title VARCHAR(100) NOT NULL,   -- (문의 제목)
	content VARCHAR(1000) NOT NULL,   -- (문의 내용)
	regdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP()   -- (문의 등록일)
);

-- 공지 테이블
create table notice(
no INT primary KEY AUTO_INCREMENT, 
title varchar(200) not NULL, 
content varchar(1000),
regdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
visited INTEGER DEFAULT 0
);

create table category(
	categoryNo INT PRIMARY KEY AUTO_INCREMENT,
	categoryName varchar(100) not NULL
);

-- 상품 테이블 생성
create table product(
	proNo INT PRIMARY KEY AUTO_INCREMENT,
	categoryNo VARCHAR(4) NOT NULL,
	price INT DEFAULT 0, -- 상품 가격
	title VARCHAR(100) NOT NULL,
	thumbnail VARCHAR(300), -- 썸네일
	info VARCHAR(500), -- 상품 정보
	content VARCHAR(2000), -- 상품 설명
	regdate timestamp default CURRENT_TIMESTAMP(),
	img VARCHAR(500) default 0, -- 상품 썸네일
   video VARCHAR(500) default 0 -- 상품 썸네일
);
	
-- 입고 테이블 생성
create table instock(
	inNo INT PRIMARY KEY AUTO_INCREMENT, -- 입고 번호
	proNo INT NOT NULL, -- 상품 번호
	amount INT NOT NULL DEFAULT 0, -- 입고 수량
	inPrice INT DEFAULT 0, -- 입고가
	regdate timestamp default CURRENT_TIMESTAMP -- 입고일
);

-- 출고 테이블 생성
create table outstock(
	outNo INT PRIMARY KEY AUTO_INCREMENT, -- 출고 번호
	proNo INT NOT NULL, -- 상품 번호
	amount INT NOT NULL DEFAULT 0, -- 출고량
	outPrice INT DEFAULT 0, -- 출고가
	regdate timestamp default CURRENT_TIMESTAMP -- 출고일
); 

-- 배송 테이블 생성
create table delivery(
	dno INT PRIMARY KEY AUTO_INCREMENT, -- 배송 번호
	payNo INT NOT NULL, -- 결제 번호
	memId VARCHAR(16) NOT NULL, -- 회원 아이디
	NAME VARCHAR(30) NOT NULL, -- 수신인 이름
	tel VARCHAR(13) NOT NULL, -- 수신인 연락처
	address VARCHAR(300) NOT NULL, -- 수신인 배송지
	dcom varchar(100), -- 배송 회사
	dtel varchar(13), -- 배송 기사 전화번호
	state integer default 0, -- 배송 상태(0: 배송 전, 1: 배송 중, 2: 도착, 3: 구매 결정)
	etd timestamp default CURRENT_TIMESTAMP, -- 예상 출발일
	eta DATE, -- 예상 도착일
	dcode varchar(30) -- 화물 코드
);

-- 결제 테이블 생성
create table payment(
	payNo INT PRIMARY KEY AUTO_INCREMENT, -- 결제 번호
	memId VARCHAR(16) not NULL, -- 회원 아이디
	proNo INT not NULL, -- 상품 번호
	payPrice INTEGER NOT NULL, -- 결제 금액
	amount integer default 1, -- 결제 수량
	method varchar(100), -- 결제 수단
	pcom varchar(100), -- 결제 회사(대행사)
	paccount VARCHAR(100), -- 결제 계좌/카드 번호
	dno INT -- 배송 번호
);


-- 카트 테이블 생성
create table cart(
	cartNo INT PRIMARY KEY AUTO_INCREMENT, -- 카트 번호
	memId VARCHAR(16) not NULL, -- 회원 아이디
	proNo integer not NULL, -- 상품 번호
	amount integer NOT NULL -- 제품 수량
);


-- 리뷰 테이블
CREATE TABLE review(
	rno INT PRIMARY KEY AUTO_INCREMENT, -- 리뷰 번호
	memId VARCHAR(16) NOT NULL, -- 회원 아이디
	payNo INT NOT NULL, -- 결제 번호
	star INT DEFAULT 5, -- 별점
	content VARCHAR(1000), -- 리뷰 내용
	regdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	proNo INT NOT NULL   -- 리뷰 대상 상품 번호
);

create table fileboard(
	ano INT primary KEY AUTO_INCREMENT,
	title varchar(300),
	content varchar(1000),
	regdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
	visited INTEGER DEFAULT 0,
	files VARCHAR(500)
);


-- 재고 VIEW 생성
CREATE VIEW instockInventory AS (SELECT proNo, sum(amount) AS amount FROM instock GROUP BY proNo);
CREATE VIEW outstockInventory AS (SELECT proNo, sum(amount) AS amount FROM outstock GROUP BY proNo);
CREATE VIEW inventory AS (SELECT a.proNo, (a.amount-b.amount) AS amount FROM instockInventory a, outstockInventory b  WHERE a.proNo = b.proNo);

-- 전체 이익 통계 뷰 작성
create view profit as (select outNo AS proNo, sum(outPrice*amount) as tot from outstock group by outNo EXCEPT select inNo, sum(inPrice*amount) as tot from instock group by inNo);