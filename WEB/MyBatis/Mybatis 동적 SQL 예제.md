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

## 1. vo class 만들기
Java Bean 스펙을 맞춰주며 작성한다.

**1. DB의 char 타입은 VO 클래스에서 String 타입으로 작성한다.**
```java
c1 char(1) --> private char c1;	  (X)
	       --> private String c1; (O)
```
-클래스명에 _(언더바)를 그대로 사용하지 말고 CamelCase로 바꾸어 작성해줄 것.

```java
public class OrderInfo {
	// number -> int
	// VARCHAR2 / VARCHAR / CHAR -> String
	private int order_no;
	private String order_id;
	private Timestamp order_time;
	
	// 생성자: 매개변수 없는
	// 생성자: 멤버 필드 초기화
	// getter / setter
}
```
**2. HAS-A 관계인 항목을 수정해준다**

일반적으로 many에서 one을 HAS-A 관계로 표현하는 경우가 많으나,
무조건 many에서 one을 HAS-A 관계로 표현하지 말고, 실제 output을 추출할때 어느 입장에서 찾아가는 일이 많은지를 고려해 봐야한다. (가장 많이 쓰이는 output의 형태를 생각해 봐야한다)

실제로 이 예제의 카테고리에서 주문 상세에서 주문 정보를 찾아가는 경우보다 주문 정보에서 주문 상세를 찾아가는 경우가 더 많기 때문에, 이 경우에는 주문 정보 입장에서 HAS-A 관계를 작성해주는 것이 더 바람직하다.
```java
public class OrderInfo {
	private int order_no;
	// HAS-A 관계 표현으로 변경
	// private String order_id;
	private Customer customer;
	private Timestamp order_time;
	private List<OrderDetail> orderDetails; // ㅁ
	
	// 생성자: 매개변수 없는
	// 생성자: 멤버 필드 초기화
	// getter / setter
}
```
```java
public class OrderDetail {
	// private int order_no;
	private OrderInfo order;
	// private String order_prod_no;
	private Product product;
	private int order_quantity;
	
	// 생성자: 매개변수 없는
	// 생성자: 멤버 필드 초기화
	// getter / setter
}
```

```java

```

[사진]

UML표기에서 `○`는 **선택 참여**를 의미한다.
foreign key 참조 관계에서 부모(참조되는) 쪽에 동그라미 표기가 있을경우에는 foreign key column에 **null이 들어올 수 있다**는 뜻이다. 

-**매개 변수 없는 생성자와 getter, setter는 꼭 작성해야한다.**

<!--stackedit_data:
eyJoaXN0b3J5IjpbLTExODY4NDU5NDUsODA3MTY0NjEzLDE5NT
A5NTQ3MTIsLTQ1ODM1MTg2Myw1OTU0MDA0NDMsMTMyMTgzMDg3
NywtMTQyOTYxNjUzNSw1NTE5OTM0NDUsNDc5MzQ0OTQxLDE3NT
cyNDEwODIsLTE2MzkwNjYsMTYyNzc4ODMwMywxOTI2MTI5MDAz
LC0xMzQ4MzgwOTkyLDE5NTU5NTM2MDEsMTUxOTg2MDkxLDIwNj
QxNzg2ODJdfQ==
-->