## 매핑된 SQL 구문
## **1)　UPDATE**
xml
```xml
<update id="updateName" parameterType="java.lang.String">
  UPDATE customer SET name=#{name} WHERE id=#{id}
</update>
  ```
  java
```java
HashMap<String, String> map = new HashMap<>();
map.put("id", "id1");
map.put("name", "바티스2");
session.update("com.my.vo.Customer.updateName", map);
/* commit close문 생략 */;
```
  >`parameterType`: 전달해야될 인자의 자료형을 결정해주는 속성
  >자동으로 설정이 되긴하지만 정확한 자료형을 지정해 주고싶을 때, 사용.

<br>

## **2)　INSERT**
xml
```xml
<insert id="insert" parameterType="com.my.vo.Customer">
INSERT INTO customer(id, pwd, name, addr)
VALUES( #{id}, #{pwd}, #{name}, #{addr} )
</insert>
```
java
```java
Customer c = new Customer();
c.setId("idtest");
c.setPwd("ptest");
c.setName("n테스트");
c.setAddr("상세주소1");
session.insert("com.my.vo.Customer.insert", c);
/* commit close문 생략 */
```
>`#{~~}`: java bean 형태를 만족하는 클래스의 getter method가 자동 호출됨. 
>이 때에는, 클래스의 파라미터 명을 넣어준다.

<br>

## **3)　DELETE**
xml
```xml
<delete id="delete" parameterType="string">
  DELETE customer WHERE id=#{id}
</delete>
```
java
```java
session.delete("com.my.vo.Customer.delete", "idtest");
/* commit close문 생략 */
```
>java.lang.String 대신 string 예약어를 사용할 수 있다.

<br>

## **4)　SELECT**
xml
```xml
<select id="selectById" parameterType="string" 
 					    resultType="Customer">
  SELECT * FROM customer WHERE id=#{id}
</select>
  ```
  >resultType: return type 지정

java
```java
Customer c1 = session.selectOne("com.my.vo.Customer.selectById", "id1");
System.out.println(c1.getName() + ":" + c1.getPwd());
  ```
>selectOne : 검색결과가 한개의 행을 반환할 경우
>selectList : 검색결과가 여러 행을 반환할 경우
>
>java bean 형식 calss의 setter method가 자동 호출됨

---
#### count(*)
xml
```xml
<select id="selectCount" resultType="int">
  SELECT COUNT(*) FROM customer
</select>
```
>`int` : java.lang.Integer의 약자

java
```java
int cnt = session.selectOne("com.my.vo.Customer.selectCount");
System.out.println("총 고객 수 : " + cnt);
```
---
### 여러가지 속성이 반환 될때: map
xml
```xml
  <select id="selectGroup" resultType="map">
    SELECT COUNT(*) c1, COUNT(*)/2 c2 
    FROM customer
  </select>
  ```
  java
  ```java
HashMap map2 = session.selectOne("com.my.vo.Customer.selectGroup");
System.out.println(map2.get("C1") + " : " + map2.get("C2"));
```
>※별칭을 소문자 'c1'으로 줘도 oracle내부에서 대문자로 자동 저장 되기 때문에, 대문자 'C1'으로 가져와야 한다.
※parameterMap 과 resultMap 은 deprecated 됐다.

### 여러가지 행이 반환 될 때: selectList
xml
```xml
<select id="selectAll" resultType="Customer">
  SELECT * FROM customer
</select>
```
java
```java
List<Customer> list = session.selectList("com.my.vo.Customer.selectAll");
System.out.println("총 고객 행수 : " + list.size());
for(Customer c: list) {
	System.out.println(c.getId() + " : " + c.getName());
}
```

table의 column이름과 vo class의 member 변수 이름이 같으면 자동 getter/setter 호출 됨.
다르게 설정했을 경우, 별칭을 설정해준다.
SELECT customer_name name, ....
c.setName(rs.getString("name"))

SELECT customer_


## **5)　JOIN**

**NullPointException!**
```xml
<select id="selectZipcodeById" parameterType="string" resultType="Customer">
  SELECT id, zipcode
  FROM customer c JOIN post p
  ON c.buildingno = p.buildingno
  WHERE id = #{id}
</select>
```
```java
Customer c3 = session.selectOne("com.my.vo.Customer.selectZipcodeById", "etet");

// c3.getPost()에서 NullPointException 발생
System.out.println(c3.getId() + " : " + c3.getPost().getZipcode());
System.out.println(c3.getPost());  // null
```
>Customer는 Post 클래스와 HAS-A 관계.
![has-a관계](https://github.com/ette9844/writing_md/blob/master/imgs/uml%20aggregation.PNG?raw=true)

DTO 관계가 설정 되어있을 경우에는 resultMap 을 사용한다
### resultMap
데이터베이스 결과데이터를 객체에 로드하는 방법을 정의하는 엘리먼트

xml
```xml
<resultMap id="customerResultMap" type="Customer">
  <id property="id" column="id" />
  <result property="name" column="name"/>
  
  <!-- 자바 클래스간의 HAS-A 관계를 표현하는 방식:association -->
  <association property="post" javaType="Post">
    <id property="buildingno" column="buildingno"/>
    <result property="zipcode" column="zipcode"/>
  </association>
</resultMap>

<select id="selectZipcodeById" parameterType="string" 
        resultType="Customer" resultMap="customerResultMap">
  SELECT id, zipcode
  FROM customer c JOIN post p
  ON c.buildingno = p.buildingno
  WHERE id = #{id}
</select>
```

>`<association property="">` : HAS-A 관계 클래스의 클래스 멤버변수 등록
>`<id>` : primary key에 대한 매핑
>`<result>` : 일반 column에 대한 매핑

java
```java
Customer c3 = session.selectOne("com.my.vo.Customer.selectZipcodeById", "etet");
System.out.println(c3.getId() + " : " + c3.getPost().getZipcode());
```
>etet : 30114
>resultMap을 통해 매핑한 이후에는 결과값이 잘 나오는 것을 확인 할 수 있다.

### autoMapping 속성
autoMapping

이 설정을 사용하면 마이바티스는 결과매핑을 자동매핑으로 처리할지 말지를 처리한다. 이 속성은 autoMappingBehavior 라는 전역설정을 덮는다. 디폴트는 unset이다.

※ id는 수동으로 설정해야 함. result만 자동 매핑

```xml
<resultMap id="customerResultMap" type="Customer" autoMapping="true">
  <id property="id" column="id" />
  <association property="post" javaType="Post" autoMapping="true">
    <id property="buildingno" column="buildingno"/>
  </association>
</resultMap>
```

## #{}
컬럼명이나 테이블 위치에 바인드 변수를 사용할 수 없다.
바인드 변수는 값의 위치에만 사용할 수 있다.
```sql
SELECT * FROM customer WHERE id = ?  (O)
SELECT * FROM ? ORDER BY ?			 (X)
```

자바에서는 이를 문자열을 통해 해결할 수 있다.
```java
String opt = "id";
String sql = "SELECT * FROM customer ORDER BY" + opt;
```

마이바티스에서는 이러한 문자열 처리를 해주는 표현식을 지원한다.

### 바인드 변수 처리
```sql
SELECT * FROM customer WHERE id = #{id}
```
### 문자열 처리
```sql
SELECT * FROM customer ORDER BY ${value}
```
parameterType이 **String** 타입일 경우에는 `${value}`를 써주어야 한다.
```xml
<select id="a" parameterType="string">
  SELECT * FROM customer ORDER BY ${value}
</select>
```
>Ex) LIKE '%${value}%'

parameterType이 특정 매칭될 수 있는 vo 타입이라면 원하는 변수명을 적어준다.
```xml
<select id="a" parameterType="Customer">
  SELECT * FROM customer ORDER BY ${id}
</select>
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbNjY4NDUzMjAwLDkyMDYzOTcyMCwyMDc5OD
E4MjAxLDUzMjYxNjYxOSwxNTM4ODE4OTY4LC0xMzkyNTAxOTA1
LDIwMjUwNDg1NjcsMTAxNzg1NTcyMywxODExNjcwMDczLDEwMz
Y2Mzk0MzUsLTEyNDIxMTE3MDQsLTEwNzQ5ODU3OTJdfQ==
-->