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
eyJoaXN0b3J5IjpbNTUxOTkzNDQ1LDQ3OTM0NDk0MSwxNzU3Mj
QxMDgyLC0xNjM5MDY2LDE2Mjc3ODgzMDMsMTkyNjEyOTAwMywt
MTM0ODM4MDk5MiwxOTU1OTUzNjAxLDE1MTk4NjA5MSwyMDY0MT
c4NjgyXX0=
-->