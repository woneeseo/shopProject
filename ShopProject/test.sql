CREATE TABLE member(
	userid VARCHAR2(50) PRIMARY KEY,
	userpw VARCHAR2(50) NOT NULL,
	username VARCHAR2(30) NOT NULL,
	email VARCHAR2(100),
	tel NUMBER(11) NOT NULL,
	birthDate VARCHAR2(20),
	regDate DATE DEFAULT SYSDATE
)

SELECT * FROM MEMBER

SELECT SUM(getPoint) FROM member WHERE userid = 'm002'

DROP table member

ALTER TABLE member ADD useraddress VARCHAR2(100)
ALTER TABLE member ADD getPoint NUMBER(8)

UPDATE MEMBER SET getPoint = 330 WHERE userid = 'm001'

SELECT * FROM member WHERE userid = 'm003'

ALTER TABLE member ADD postcode VARCHAR2(20)

INSERT INTO member (userid, userpw, username, tel) VALUES ('admin', 'admin', '관리자', 1011012222)

CREATE TABLE product(
	productId VARCHAR2(100) PRIMARY KEY,
	productName VARCHAR2(300) NOT NULL,
	price NUMBER(10) NOT NULL,
	stock NUMBER(4) DEFAULT 0,
	productDist VARCHAR2(30),
	productInfo VARCHAR2(100),
	regDate DATE DEFAULT SYSDATE,
	updateDate DATE DEFAULT SYSDATE
)

SELECT * FROM product

INSERT INTO PRODUCT (productId, productName, price) VALUES ('test_product_id5', 'test_product_name', 50000)

ALTER TABLE product ADD fullname VARCHAR2(200)

ALTER TABLE product DROP COLUMN filename
ALTER TABLE product ADD sold_rate NUMBER(10)

SELECT COUNT(productId) FROM PRODUCT

DELETE FROM product WHERE productName LIKE '[쿠키]%' 
SELECT * FROM product ORDER BY sold_rate DESC

CREATE TABLE attach(
	id NUMBER(8) PRIMARY KEY,
	fullname VARCHAR2(200) NOT NULL,
	productId VARCHAR2(100),
	regDate DATE DEFAULT SYSDATE,
	
	CONSTRAINT attach_fk_productId FOREIGN KEY(productId) REFERENCES product(productId)
	ON DELETE CASCADE
)

SELECT * FROM ATTACH

DELETE FROM ATTACH WHERE productId NOT IN ('acc_aggerive_flavor_cookie')

SELECT id, fullname FROM(SELECT *FROM attach ORDER BY id asc)
WHERE ROWNUM= 1 AND productId = 'test_product_id'
/* where조건에서 검색되는 여러 데이터중 단 하나의 데이터만 가져오고 싶을 때 사용 */

SELECT attach.fullname, attach.id, attach.productId, product.price, product.productName, product.stock 
FROM attach, product WHERE attach.productId = product.productId ORDER BY attach.id asc

SELECT * FROM attach ORDER BY id asc

SELECT fullname FROM attach, product WHERE ROWNUM = 1 AND productId = product.productId

CREATE TABLE cart(
	userid VARCHAR2(50),
	productId VARCHAR2(100),
	cartId NUMBER(10) PRIMARY KEY,
	cart_qty NUMBER(4),
	regDate DATE DEFAULT SYSDATE
)

ALTER TABLE cart ADD CONSTRAINT cart_fk_userid FOREIGN KEY (userid) REFERENCES member(userid)
ALTER TABLE cart ADD CONSTRAINT cart_fk_productId FOREIGN KEY (productId) REFERENCES product(productId)

SELECT * from cart

DELETE FROM cart


CREATE TABLE setOrder(
	orderId VARCHAR2(40),
	order_seq_num NUMBER(8),
	productId VARCHAR2(100),
	productName VARCHAR2(300),
	price NUMBER(10),
	order_Qty NUMBER(2),
	productDist VARCHAR2(30),
	productInfo VARCHAR2(100),
	selected_Opt VARCHAR2(100),
	fullname VARCHAR2(200),
	userid VARCHAR2(50),
	username VARCHAR2(30),
	email VARCHAR2(100),
	tel NUMBER(11),
	useraddress VARCHAR2(100),
	postcode VARCHAR2(20),
	orderDate DATE DEFAULT SYSDATE,
	deliver_msg VARCHAR2(300),
	deliver_situ NUMBER(2),
	totalAmount NUMBER(8),
	billingDate DATE DEFAULT SYSDATE,
	cal_info VARCHAR2(20)
)

ALTER TABLE setOrder ADD CONSTRAINT setOrder_fk_userid FOREIGN KEY (userid) REFERENCES member(userid)
ALTER TABLE setOrder ADD CONSTRAINT setOrder_fk_productId FOREIGN KEY (productId) REFERENCES product(productId)
ALTER TABLE setOrder ADD stock NUMBER(4)

SELECT * FROM SETORDER WHERE userid = 'm002'


ALTER TABLE setOrder ADD cal_info VARCHAR2(20)

DELETE from setOrder

CREATE SEQUENCE order_seq_num 
START WITH 4000
INCREMENT BY 1
MAXVALUE 10000000
NOCYCLE

UPDATE setOrder SET deliver_situ = 1 WHERE order_seq_num = 4021

SELECT * FROM (SELECT ROWNUM rnum, productId, productName, price, stock, productDist, productInfo, fullname, regDate, updateDate 
		FROM (SELECT * FROM product ORDER BY regDate DESC)) WHERE rnum <= 8
SELECT * FROM (SELECT ROWNUM rnum, productId, productName, price, stock, productDist, productInfo, fullname, regDate, updateDate 
		FROM (SELECT * FROM product ORDER BY sold_rate DESC)) WHERE rnum <= 8
		
		
CREATE TABLE qna(
	boardId NUMBER(4) PRIMARY KEY,
	userid VARCHAR2(50),
	title VARCHAR2(500),
	regDate DATE DEFAULT SYSDATE,
	content VARCHAR2(1000),
	updateDate DATE DEFAULT SYSDATE,
	viewCnt NUMBER(4),
	productName VARCHAR2(300)
)

ALTER TABLE qna ADD CONSTRAINT qna_fk_productId FOREIGN KEY(productId) REFERENCES product(productId)
ALTER TABLE qna ADD	CONSTRAINT qna_fk_userid FOREIGN KEY(userid) REFERENCES member(userid)
ALTER TABLE qna ADD qna_type NUMBER(4)

ALTER TABLE qna ADD productName VARCHAR2(300)
ALTER TABLE qna ADD replyCnt NUMBER(4)

UPDATE qna SET productName = '[팬츠] 스키니진' WHERE boardId > 10 AND boardId < 30 

SELECT * FROM qna

ALTER TABLE qna DROP COLUMN productId

SELECT * FROM QNA ORDER BY regDate DESC
SELECT ROWNUM rnum, boardId, userid, title, regDate, qna_type, viewCnt FROM (SELECT * FROM qna ORDER BY regDate DESC)
SELECT * FROM (SELECT ROWNUM rnum, boardId, userid, title, regDate, qna_type, viewCnt 
FROM (SELECT * FROM qna ORDER BY regDate DESC)) WHERE qna_type = 3 
DELETE FROM qna

CREATE TABLE reply(
	rep_no NUMBER PRIMARY KEY,
	boardId NUMBER NOT NULL, 
	rep_content VARCHAR2(1000) NOT NULL,
	writer VARCHAR2(30) NOT NULL,
	regDate DATE DEFAULT SYSDATE,
	updateDate DATE DEFAULT SYSDATE,
	
	CONSTRAINT reply_fk_boardId FOREIGN KEY(boardId) REFERENCES qna(boardId)
	ON DELETE CASCADE
)

		SELECT * FROM (SELECT ROWNUM rnum, boardId, title, viewCnt, regDate, userid, productName FROM qna WHERE  productName = '[팬츠] 스키니진' ORDER BY regDate DESC) 
		WHERE  rnum BETWEEN 1 AND 10 ORDER BY rnum DESC