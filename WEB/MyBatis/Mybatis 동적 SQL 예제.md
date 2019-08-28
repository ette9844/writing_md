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

**(1) DB의 char 타입은 VO 클래스에서 String 타입으로 작성한다.**
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
**(2) HAS-A 관계인 항목을 수정해준다**

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
	private List<OrderDetail> orderDetails; // ★
	
	// 생성자: 매개변수 없는
	// 생성자: 멤버 필드 초기화
	// getter / setter
}
```
```java
public class OrderDetail {
	private int order_no;
	// private OrderInfo order;
	// private String order_prod_no;
	private Product product;
	private int order_quantity;
	
	// 생성자: 매개변수 없는
	// 생성자: 멤버 필드 초기화
	// getter / setter
}
```


[사진]

UML표기에서 `○`는 **선택 참여**를 의미한다.
foreign key 참조 관계에서 부모(참조되는) 쪽에 동그라미 표기가 있을경우에는 foreign key column에 **null이 들어올 수 있다**는 뜻이다. 

**(3) 매개 변수 없는 생성자와 getter, setter를 작성**


## 2. DAO 생성 (뼈대)
```java
public class OrderDAO {

	/**
	 * order_info테이블에 주문기본정보 추가
	 * order_line테이블에 주문상세정보 추가
	 * @param orderInfo 주문기본정보와 주문상세정보들
	 * @throws AddException
	 */
	public void insert(OrderInfo orderInfo) throws AddException {
		
	}
	
	/**
	 * 아이디에 해당하는 주문정보들을 반환한다
	 * 최근 주문정보부터 저장된다. - 내림차순 정렬
	 * @param id 주문자 ID
	 * @return 
	 * @throws NotFoundException 해당 주문정보가 없다면 NotFoundException 발생
	 */
	public List<OrderInfo> selectById(String id) throws NotFoundException {
		return null;
	}
	
	/**
	 * 날짜구간에 해당하는 주문정보들을 반환한다
	 * @param start 검색할 시작 날짜 (yy/MM/dd 포맷 사용)
	 * @param end	검색할 끝    날짜 (yy/MM/dd 포맷 사용)
	 * @return
	 * @throws NotFoundException
	 */
	public List<OrderInfo> selectByDate(String start, String end) throws NotFoundException {
		return null;
	}
}

```

## 3. mybatis-config.xml 수정
```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE configuration
  PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
  "http://mybatis.org/dtd/mybatis-3-config.dtd">
<configuration>
  <typeAliases>
    <typeAlias type="com.my.vo.Customer" alias="Customer"/>
    <typeAlias type="com.my.vo.Post" alias="Post"/>
    <typeAlias type="com.my.vo.Category" alias="Category"/> <!--수정-->
    <typeAlias type="com.my.vo.Product" alias="Product"/> <!--수정-->
    <typeAlias type="com.my.vo.OrderInfo" alias="OrderInfo"/>	<!--수정-->
    <typeAlias type="com.my.vo.OrderDetail" alias="OrderDetail"/> <!--수정-->
  </typeAliases>
  <environments default="development">
    <environment id="development">
      <transactionManager type="JDBC"/>
      <dataSource type="POOLED">
        <property name="driver" value="oracle.jdbc.driver.OracleDriver"/>
        <property name="url" value="jdbc:oracle:thin:@localhost:1521:xe"/>
        <property name="username" value="user"/>
        <property name="password" value="password"/>
      </dataSource>
    </environment>
  </environments>
  <mappers>
    <mapper resource="customerMapper.xml"/>
    <mapper resource="orderMapper.xml"/> <!--수정-->
  </mappers>
</configuration>
```
## 4. mapper.xml 작성
뼈대 + select 문
```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper
  PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
  "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.my.vo.Order">
  <resultMap id="orderResultMap" type="OrderInfo" autoMapping="true">
    <collection property="orderDetails" ofType="OrderDetail" autoMapping="true">
      <id property="order_no" column="order_no"/>
      <association property="product" javaType="Product" autoMapping="true">
        <result property="prod_no" column="order_prod_no"/>
      </association>
    </collection>
  </resultMap>
  <select id="selectById" parameterType="string" resultMap="orderResultMap">
    SELECT info.order_no, info.order_time, 
			   detail.order_prod_no, detail.order_quantity, 
			   p.prod_name, p.prod_price
 	FROM order_info info 
 	JOIN order_detail detail ON info.order_no = detail.order_no
	JOIN product p ON p.prod_no = detail.order_prod_no
	WHERE order_id=#{id}
  </select>
</mapper>
```

>`association` : many의 입장에서 one을 가지고 있을 때의 표현 방법
>`collection` : one의 입장에서 many을 가지고 있을 때의 표현 방법
>`property` : mapping 되는 class가 가지고 있는 맴버 변수 명
>`ofType` : one이 가지고 있는 many의 클래스명
>
>**id**를 설정하면 id별로 하나만 만들어주는 **식별자** 역할을 하기 때문에 복합키를 가진 테이블에서는 두 칼럼 모두 id설정을 해주던가 id태그를 작성하지 않아야 한다.

insert 문 추가
```xml
  <!-- 주문기본 -->
  <insert id="insertOrderInfo" parameterType="string">
    INSERT INTO order_info(order_no, order_id, order_time)
    VALUES (order_seq.NEXTVAL, #{order_id}, SYSTIMESTAMP)
  </insert>
  <!-- 주문상세 -->
  <insert id="insertOrderDetail" parameterType="OrderDetail">
    INSERT INTO order_detail(order_no, order_prod_no, order_quantity)
    VALUES (order_seq.CURRVAL, #{product.prod_no}, #{order_quantity})
  </insert>
```
>각 태그 마다 SQL 구문이 독립적으로 들어가야한다.
한 태그에 두 개 이상의 SQL문 X

+) 시퀀스 생성 sql
```sql
CREATE SEQUENCE order_seq
START WITH 1
nocache;
```


## 5. DAO 작성


## 6. Testing code 작성 / 실행
**JUnit 단위 테스트**를 활용하면 더 좋다.
여기서는 미니프로젝트의 main 함수 호출을 통해 테스팅을 진행 함.

```java
public static void main(String[] args) {
	OrderDAO dao = new OrderDAO();
	String id = "id1";
	
	try {
		dao.selectById(id);
	} catch(NotFoundException e) {
		System.out.println(e.getMessage());	// 출력
	}
	
	OrderInfo info = new OrderInfo();
	Customer c = new Customer();
	c.setId(id);
	info.setCustomer(c);			// 주문자
	List<OrderDetail> orderDetails = new ArrayList<>();
		
	OrderDetail detail = new OrderDetail();
	Product p = new Product();
	p.setProd_no("10001");
	detail.setProduct(p);			// 주문상품번호
	detail.setOrder_quantity(2);	// 주문 수량
	orderDetails.add(detail);
		
	detail = new OrderDetail();
	p = new Product();	// new 키워드로 새 객체 생성을 하지 않으면 이전 객체 덮어쓰기가 되어버림
	p.setProd_no("10003");
	detail.setProduct(p);			// 주문상품번호
	detail.setOrder_quantity(3);	// 주문 수량
	orderDetails.add(detail);
		
	info.setOrderDetails(orderDetails);
	try {
		dao.insert(info);
		System.out.println("주문 추가 성공!");
	} catch (AddException e) {
		e.printStackTrace();
	}
}
```
#### 실행 결과
![실행결과_콘솔](https://github.com/ette9844/writing_md/blob/master/imgs/mybatis_result_2.PNG?raw=true)
![실행결과_sqlplus](https://github.com/ette9844/writing_md/blob/master/imgs/mybatis_result_1.PNG?raw=true)
실제 DB에도 정상적으로 insert된 것을 확인할 수 있다.


### 추가된 값을 select하는 testing
```java
try {
	List<OrderInfo> list = dao.selectById(id);
	for(OrderInfo info: list) {
		int order_no = info.getOrder_no();
		Timestamp order_time = info.getOrder_time();
		System.out.println("주문기본정보: " 
				+ order_no + ", " 
				+ order_time);
		List<OrderDetail> details = info.getOrderDetails();
		for(OrderDetail detail: details) {
			Product product = detail.getProduct();
			String p_no = product.getProd_no();
			String p_name = product.getProd_name();
			int p_price = product.getProd_price();
			int quantity = detail.getOrder_quantity();
			System.out.println("주문상세정보: " 
					+ p_no + ", " 
					+ p_name+", " 
					+ p_price + ", " 
					+ quantity);
		}
	}
	System.out.println("------------------------------");
} catch(NotFoundException e) {
	System.out.println(e.getMessage());	// 출력
}
```
#### 실행결과

![select문 실행결과 -콘솔](https://github.com/ette9844/writing_md/blob/master/imgs/mybatis_result_3.PNG?raw=true)
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTEwMjkxNTQyOSwtMTQ2MDg4MTE1MCwxMT
E1ODg1ODAyLC00NzczOTQwNDYsMTUzMDY2NzM0MywxNjMxNTA5
NTI3LDYwMjk4NDEsMTczNzMyMDczLDk0MzUyMDk4NiwxOTk3OT
U5MzAxLC0yOTM5NTc5MywxMTA2MDY0NjA5LDgwNzE2NDYxMywx
OTUwOTU0NzEyLC00NTgzNTE4NjMsNTk1NDAwNDQzLDEzMjE4Mz
A4NzcsLTE0Mjk2MTY1MzUsNTUxOTkzNDQ1LDQ3OTM0NDk0MV19

-->