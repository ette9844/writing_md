## Category Table
table
```sql
CREATE TABLE Category (
    cate_no 		number(1) 	 CONSTRAINT category_pk PRIMARY KEY,
    cate_parent_no 	number(1),
    cate_name 		varchar2(30) NOT NULL
);
ALTER TABLE category
ADD CONSTRAINT category_parent_no_fk 
FOREIGN KEY(cate_parent_no) 
REFERENCES category(cate_no);
```
data
```sql
cate_no		cate_parent_no		cate_name
1			null				음료
2			null				상품
3			1					에스프레소
4			1					콜드브루

INSERT INTO category VALUES(1, null, '음료');
INSERT INTO category VALUES(2, null, '상품');
INSERT INTO category VALUES(3, 1, '에스프레소');
INSERT INTO category VALUES(4, 1, '콜드브루');
```
>대분류와 소분류 사용
>cate_parent_no == null 인 카테고리가 대분류 카테고리

## Product Table
```sql
CREATE TABLE product (
    prod_no         VARCHAR2(5) CONSTRAINT product_pk PRIMARY KEY,
    prod_cate_no    number(1),
    prod_name       VARCHAR2(50),
    prod_price      number(6)   DEFAULT 0 NOT NULL,
    prod_detail     VARCHAR2(50)
);

ALTER TABLE product
ADD CONSTRAINT product_cate_no_fk 
FOREIGN KEY (prod_cate_no) 
REFERENCES category(cate_no);

ALTER TABLE product
ADD CONSTRAINT product_price_check
CHECK (prod_price >= 0);
```

data
```sql
prod_no		prod_cate_no	prod_name 				prod_price	prod_detail
10001		3				플로랄 스타벅스 더블 샷		3000		스타벅스만의 시그니처 메뉴인 더블샷에 꽃향 가득한 얼 그레이 풍미를 함께 즐길 수 있는 20주년 기념 음료
10002		3				에스프레소 콘 파냐			4000		에스프레소 샷에 풍부한 휘핑크림을 얹은 강렬하고 달콤한 음료
10003		4				나이트로 쇼콜라			4000		초콜릿과 견과류의 풍미, 초콜릿 파우더 토핑, 풀 바디감의 새로운 나이트로 콜드 브루

INSERT INTO product VALUES(10001, 3, '플로랄 스타벅스 더블 샷', 3000, '스타벅스만의 시그니처 메뉴');
INSERT INTO product VALUES(10002, 3, '에스프레소 콘 파냐', 4000, '강렬하고 달콤한 음료');
INSERT INTO product VALUES(10003, 4, '나이트로 쇼콜라', 4000, '초콜릿과 견과류의 풍미');
```

## Order Table
```sql
CREATE TABLE order_info(
    order_no    NUMBER CONSTRAINT order_info_pk PRIMARY KEY,
    order_id    VARCHAR2(15) NOT NULL,
    order_time  TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL
);

CREATE TABLE order_detail(
    order_no        NUMBER,
    order_prod_no   VARCHAR2(5),
    order_quantity  NUMBER(2) NOT NULL,
    CONSTRAINT order_detail_pk PRIMARY KEY(order_no, order_prod_no)
);

ALTER TABLE order_info
ADD CONSTRAINT order_info_id_fk
FOREIGN KEY (order_id) 
REFERENCES customer(id);

ALTER TABLE order_detail
ADD CONSTRAINT order_detail_order_no_fk 
FOREIGN KEY (order_no) 
REFERENCES order_info(order_no);

ALTER TABLE order_detail
ADD CONSTRAINT order_detail_prod_no_fk 
FOREIGN KEY (order_prod_no) 
REFERENCES product(prod_no);

ALTER TABLE order_detail
ADD CONSTRAINT order_detail_check 
CHECK(order_quantity >= 1);
```
>TIMESTAMP: date보다 더욱 세밀한 시간값을 얻을 수 있음
>SYSTIMESTAMP: SYSDATE의 TIMESTAMP 버전

```sql
주문	ORDER_INFO					주문상세 ORDER_DETAIL
order_no	order_id	order_time	order_no	order_prod_no	order_quantity
주문번호	주문자	주문시간			주문번호		주문상품		주문수량
[pk]	[fk]					[pk][fk]	[pk][fk]	[ck>0]
1		id1		8/28/10:23:00	1			10001		2		
								1			10003		3
2		id9		8/28/10:24:20	2			10002		1
3		id1		8/28/11:00:00	3			10002		4
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE0Mjk2MTY1MzUsNTUxOTkzNDQ1LDQ3OT
M0NDk0MSwxNzU3MjQxMDgyLC0xNjM5MDY2LDE2Mjc3ODgzMDMs
MTkyNjEyOTAwMywtMTM0ODM4MDk5MiwxOTU1OTUzNjAxLDE1MT
k4NjA5MSwyMDY0MTc4NjgyXX0=
-->