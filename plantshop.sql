-- cart 테이블 : 장바구니 정보를 저장하는 테이블
-- 8개의 필드로 구성
-- 카트 번호, 구매자 아이디, 상품 아이디, 상품명, 제조사, 구매 수량, 구매 가격, 상품 이미지
-- 카트 아이디 : 데이터 삽입 시 새로 생성
-- 구매자 아이디 : 로그인된 상태에서 세션의 id를 넣어줌.
-- 상품 아이디, 상품명, 상품이미지 : 상품 테이블 에서 옴.
-- 구매 가격, 구매 수량 : 상품테이블로부터 새로 생성
CREATE TABLE cart (
  cartno int NOT NULL,
  uid varchar(16) NOT NULL,
  pid int NOT NULL,
  pname varchar(30) NOT NULL,
  sname varchar(30) NOT NULL,
  quantity int DEFAULT 0,
  price int DEFAULT 0,
  small varchar(20)
);

desc cart;


-- member 테이블 - 고객 정보를 저장하는 테이블
-- 9개의 필드로 구성
-- 유저 아이디, 유저 이름,  비밀번호, 이메일, 
-- 우편번호, 기본주소, 상세주소, 휴대폰, 가입일
CREATE TABLE member2 (
  userid varchar(16) PRIMARY KEY,
  username varchar(12) NOT NULL,
  password varchar(12) NOT NULL,
  email varchar(50),
  zipcode varchar(7),
  address1 varchar(100),
  address2 varchar(100),
  phone varchar(13),
  regdate varchar(50)
);
desc member2;

-- zipcode(주소) 테이블 생성 - 주소정보를 저장
-- 6개의 필드로 구성
-- 기준번호, 우편번호, 시도, 구군, 동, 번지
CREATE TABLE zipcode (
  SEQ int PRIMARY KEY,
  ZIPCODE varchar(7),
  SIDO varchar(4),
  GUGUN varchar(15),
  DONG varchar(52),
  BUNJI varchar(17)
);
desc zipcode;

-- product(상품) 테이블 생성
-- 18개의 필드로 구성
-- 상품 아이디, 상품종류(카테고리), 상품명, 제조사, 상품가격, 할인가격, 상품 등록날짜, 재고량, 상품 설명
-- 상품 작은이미지, 상품 상세이미지 4개, 상품 구매량, 추천여부, 판매여부
CREATE TABLE product (
  id int PRIMARY KEY,
  category varchar(30) NOT NULL,
  wname varchar(30) NOT NULL,
  pname varchar(30) NOT NULL,
  sname varchar(30) NOT NULL,
  price int NOT NULL,
  downprice int DEFAULT 0,
  inputdate varchar(50) NOT NULL,
  stock int DEFAULT 0,
  description text,
  small varchar(20),
  img1 varchar(20),
  img2 varchar(20),
  img3 varchar(20),
  img4 varchar(20),
  salecount int DEFAULT 0,
  mditem enum('y','n') DEFAULT 'n',
  selling enum('y','n') DEFAULT 'y'
);
desc product;


-- 구매 테이블 : 구매자, 구매 상품의 정보가 저장된 테이블
-- 10개의 필드로 구성
-- 구매 아이디, 구매자 아이디, 구매자 이름, 구매날짜, 
-- 수취인 주소, 수취인 전화번호, 결제 방법, 카드 번호, 
-- 구매 상품의 종류수, 합계 금액
CREATE TABLE saleorder (
  id int PRIMARY KEY,
  uid varchar(16) NOT NULL,
  name varchar(30) NOT NULL,
  orderdate varchar(50) NOT NULL,
  address varchar(100) NOT NULL,
  tel varchar(20) NOT NULL,
  pay varchar(20) NOT NULL,
  cardno varchar(20),
  productcount int DEFAULT 0,
  total int DEFAULT 0
); 
desc saleorder;

-- 구매 상품 테이블 : 구매 테이블의 주문에대한 상세정보가 저장
-- 6개의 필드로 구성
-- 구매 테이블의 id, 개별상품 임의번호, 상품아이디
-- 상품이름, 주문수량, 상품가격
CREATE TABLE item (
  orderid int NOT NULL,
  itemno int NOT NULL,
  productid int NOT NULL,
  pname varchar(30) NOT NULL,
  quantity int DEFAULT '0',
  price int DEFAULT '0'
);
desc item;


-- Q&A 테이블 : 고객센터의 Q&A 정보가 저장
-- 11개의 필드로 구성
-- 기준 번호, 질문자 이름, 설정할 비밀번호, 질문자 이메일,
-- 제목, 내용, 작성날짜, 참조되는 기준번호,
-- 조회수, 댓글처리 칼럼, 댓글 들여쓰기 칼럼
CREATE TABLE freeboard (
  id int PRIMARY KEY,
  name varchar(10) NOT NULL,
  password varchar(10) NOT NULL,
  email varchar(50) NOT NULL,
  subject varchar(50) NOT NULL,
  content text NOT NULL,
  inputdate varchar(50) NOT NULL,
  masterid int DEFAULT 0,
  readcount int DEFAULT 0,
  replynum int DEFAULT 0,
  step int DEFAULT 0
);
desc freeboard;


-- 상품 리뷰 테이블 : 각 상품에 대해서 리뷰 정보가 저장
-- 6개의 필드로 구성
-- 기준번호, 작성자이름, 작성날짜
-- 제목, 내용, 상품아이디 : 어느상품에 대한 리뷰인지 판단
CREATE TABLE review (
  id int PRIMARY KEY AUTO_INCREMENT,
  name varchar(10) NOT NULL,
  inputdate varchar(50) NOT NULL,
  subject varchar(60) NOT NULL,
  content text,
  pid int
);

desc review;
