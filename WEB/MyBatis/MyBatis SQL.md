## 매핑된 SQL 구문
**1)　UPDATE**
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

**2)　INSERT**
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

**3)　DELETE**
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

**4)　SELECT**
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
#### 여러가지 속성이 반환 될때: map
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

#### 여러가지 행이 반환 될 때: selectList
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
<!--stackedit_data:
eyJoaXN0b3J5IjpbMjAyNTA0ODU2NywxMDE3ODU1NzIzLDE4MT
E2NzAwNzMsMTAzNjYzOTQzNSwtMTI0MjExMTcwNCwtMTA3NDk4
NTc5Ml19
-->