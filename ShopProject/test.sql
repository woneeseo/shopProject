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

DROP table member

ALTER TABLE member ADD useraddress VARCHAR2(100)

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

DELETE FROM product

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
