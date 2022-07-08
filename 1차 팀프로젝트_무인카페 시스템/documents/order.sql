-- 장바구니
CREATE TABLE cartlist (
	cartlist_no INT NOT NULL,
	pro_no INT NULL,
	pro_price INT NULL,
	pro_acc INT NULL,
	quan INT NULL,
	op01_name VARCHAR(10) NULL,
	op01_quan INT NULL,
	op01_price INT NULL,
	op02_name VARCHAR(10) NULL,
	op02_quan INT NULL,
	op02_price INT NULL,
	op03_name VARCHAR(10) NULL,
	op03_quan INT NULL,
	op03_price INT NULL,
	sumPrice INT NULL
);

-- 장바구니
ALTER TABLE cartlist
	ADD CONSTRAINT PK_cartlist -- 장바구니 기본키
	PRIMARY KEY (
	cartlist_no -- 장바구니번호
	);

-- 주문목록
CREATE TABLE orderLists (
	od_no INT NOT NULL,
	st_no INT NULL,
	no INT NULL,
	date DATETIME NULL,
	kind VARCHAR(4) NULL,
	total_price INT NULL,
	total_point INT NULL,
	get_time DATETIME NULL,
	pay_flag VARCHAR(4) NULL
);

-- 주문목록
ALTER TABLE orderLists
	ADD CONSTRAINT PK_orderLists -- 주문목록 기본키
	PRIMARY KEY (
	od_no -- 주문번호
	);

-- 결제정보
CREATE TABLE payment (
	pay_no INT NOT NULL,
	od_no INT NULL,
	date DATETIME NULL,
	pay_method VARCHAR(4) NULL,
	pay_amount INT NULL,
	pointpay VARCHAR(4) NULL,
	pay_point INT NULL
);

-- 결제정보
ALTER TABLE payment
	ADD CONSTRAINT PK_payment -- 결제정보 기본키
	PRIMARY KEY (
	pay_no -- 결제번호
	);

-- 주문상세
CREATE TABLE orderDetail (
	oddt_no INT NOT NULL,
	od_no INT NULL,
	cartlist_no INT NULL
);

-- 주문상세
ALTER TABLE orderDetail
	ADD CONSTRAINT PK_orderDetail -- 주문상세 기본키
	PRIMARY KEY (
	oddt_no -- 주문상세번호
	);

-- 즐겨찾는메뉴
CREATE TABLE myfav (
	myfav_no INT NOT NULL,
	no INT NULL,
	cartlist_no INT NULL
);

-- 즐겨찾는메뉴
ALTER TABLE myfav
	ADD CONSTRAINT PK_myfav -- 즐겨찾는메뉴 기본키
	PRIMARY KEY (
	myfav_no -- 즐찾번호
	);

-- 장바구니
ALTER TABLE cartlist
	ADD CONSTRAINT FK_st_product_TO_cartlist -- 상품목록 -> 장바구니
	FOREIGN KEY (
	pro_no,    -- 상품번호
	pro_price, -- 상품가격
	pro_acc    -- 적립률
	)
	REFERENCES st_product ( -- 상품목록
	pro_no,    -- 상품번호
	pro_price, -- 상품가격
	pro_acc    -- 적립률
	);

-- 주문목록
ALTER TABLE orderLists
	ADD CONSTRAINT FK_account_TO_orderLists -- 회원 -> 주문목록
	FOREIGN KEY (
	no -- 주문주체
	)
	REFERENCES account ( -- 회원
	no -- 회원번호
	);

-- 주문목록
ALTER TABLE orderLists
	ADD CONSTRAINT FK_store_TO_orderLists -- 매장 -> 주문목록
	FOREIGN KEY (
	st_no -- 매장번호
	)
	REFERENCES store ( -- 매장
	st_no -- 매장번호
	);

-- 결제정보
ALTER TABLE payment
	ADD CONSTRAINT FK_orderLists_TO_payment -- 주문목록 -> 결제정보
	FOREIGN KEY (
	od_no -- 주문번호
	)
	REFERENCES orderLists ( -- 주문목록
	od_no -- 주문번호
	);

-- 주문상세
ALTER TABLE orderDetail
	ADD CONSTRAINT FK_orderLists_TO_orderDetail -- 주문목록 -> 주문상세
	FOREIGN KEY (
	od_no -- 주문번호
	)
	REFERENCES orderLists ( -- 주문목록
	od_no -- 주문번호
	);

-- 주문상세
ALTER TABLE orderDetail
	ADD CONSTRAINT FK_cartlist_TO_orderDetail -- 장바구니 -> 주문상세
	FOREIGN KEY (
	cartlist_no -- 장바구니번호
	)
	REFERENCES cartlist ( -- 장바구니
	cartlist_no -- 장바구니번호
	);

-- 즐겨찾는메뉴
ALTER TABLE myfav
	ADD CONSTRAINT FK_cartlist_TO_myfav -- 장바구니 -> 즐겨찾는메뉴
	FOREIGN KEY (
	cartlist_no -- 장바구니번호
	)
	REFERENCES cartlist ( -- 장바구니
	cartlist_no -- 장바구니번호
	);

-- 즐겨찾는메뉴
ALTER TABLE myfav
	ADD CONSTRAINT FK_account_TO_myfav -- 회원 -> 즐겨찾는메뉴
	FOREIGN KEY (
	no -- 회원번호
	)
	REFERENCES account ( -- 회원
	no -- 회원번호
	);