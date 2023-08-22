CREATE TABLE files(
	uname varchar(200), 
	subject varchar(300), 
	content varchar(1000),
	filename varchar(500)
);

-- 입출고 목록: 아이디, 수량, 타입
CREATE TABLE inventory(
	id INT PRIMARY KEY AUTO_INCREMENT,
	product INT,
	quantity INT DEFAULT 0,
	listType VARCHAR(30) -- in 또는 out, force
);

-- 입고 출고 재고
CREATE VIEW instock AS (SELECT product, SUM(quantity) AS quantity, listType FROM inventory GROUP BY product HAVING listType='in');
CREATE VIEW outstock AS (SELECT product, SUM(quantity) AS quantity, listType FROM inventory GROUP BY product HAVING listType='out');
CREATE VIEW stock AS (SELECT product, SUM(quantity) AS quantity, listType FROM inventory GROUP BY product);

-- payment 결제
CREATE TABLE payment(
	id INT PRIMARY KEY AUTO_INCREMENT,
	method VARCHAR(100),
	customer VARCHAR(16),
	product INT,
	price INT DEFAULT 0 NOT NULL,
	quantity INT
);

-- 카테고리 테이블
CREATE TABLE category(
	id INT AUTO_INCREMENT PRIMARY KEY,
	main VARCHAR(300),
	sub VARCHAR(300)
);

-- 배송: 배송번호, 결제 번호, 고객 id, 배송 주소, 고객 전화번호, 배송회사, 배송기사 연락처, 배송상태, 운송장
CREATE TABLE delivery(
	id INT AUTO_INCREMENT PRIMARY KEY,
	payment INT, -- 결제번호
	customer VARCHAR(50),
	address VARCHAR(300),
	customer_tel VARCHAR(13),
	company VARCHAR(100),  -- 배송회사(ADMIN)
	tel VARCHAR(13), -- 배송기사 연락처(admin)
	state INT DEFAULT 0, -- 배송 상태  배송전, 배송중, 도착, 구매결정 0~3
	tracking VARCHAR(100)
);

CREATE TABLE video(
	id INT AUTO_INCREMENT PRIMARY KEY,
	product INT, -- 제품 번호
	title VARCHAR(100) NOT NULL,
	vidSrc VARCHAR(2000)
);

-- 상품: 상품번호, 카테고리, 카테고리번호+상품번호, 상품명, 상품설명, 상품 목차, 상품단가, 상품 이미지, 등록일
-- 내가 한 거: 상품번호, 카테고리 번호, 상품명, 상품내용, 상품이미지, 등록일
CREATE TABLE product(
	id INT AUTO_INCREMENT PRIMARY KEY,
	category int,
	price INT NOT NULL DEFAULT 0,
	title VARCHAR(100) NOT NULL,
	content VARCHAR(5000),
	imgSrc VARCHAR(2000), -- 상품 이미지
	regdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP()
);


-- 신상품 목록
CREATE VIEW new_product AS (SELECT * FROM product ORDER BY regdate DESC LIMIT 5);
-- 베스트 셀러 상품 목록
create view best_product AS (SELECT * FROM product WHERE product.id IN (SELECT payment.product FROM payment groupy BY payment.product ORDER BY SUM(payment.quantity) DESC LIMIT 5));
-- 카테고리별 베스트 셀러


-- Cart: 번호, 아이디, 제품 번호, 제품 수량
CREATE TABLE cart(
	id INT PRIMARY KEY AUTO_INCREMENT,
	customer VARCHAR(50),
	product INT,
	quantity INT
);



-- 배송 중
UPDATE delivery SET company = ?, tel = ?, state = 1, startDate = CURRENT_TIMESTAMP(), endDate = ? WHERE tracking = ?;
-- 배송 완료
UPDATE delivery SET company = ?, tel = ?, state = 2, startDate = CURRENT_TIMESTAMP(), endDate = ? WHERE tracking = ?;
-- 구매 결정
UPDATE delivery SET company = ?, tel = ?, state = 3, startDate = CURRENT_TIMESTAMP(), endDate = ? WHERE tracking = ?;