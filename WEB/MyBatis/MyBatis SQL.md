## SQL 문 작성
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
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTEyMzI5MDQ1NzNdfQ==
-->