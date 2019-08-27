## 기존 DAO 작성의 번거로움 

```java
Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "username", "password");

String SQL = "select * from enrol " 
			+ "where study_no = ? " 
			+ "order by enrol_status";
stmt = conn.prepareStatement(SQL);
stmt.setInt(1, study_no);

rs = stmt.executeQuery();
stmt.close();
conn.close();
```
DAO에서 했던 절차를 xml에 분리해서 처리하도록 할 것.
이러한 절차를 돕는 라이브러리 중 MyBatis가 있다.

## MyBatis
마이바티스는 개발자가 지정한 SQL, 저장프로시저 그리고 몇가지 고급 **매핑**을 지원하는 퍼시스턴스 프레임워크이다.

**SQL 구문**과 JAVA 문법을 매핑만 하는 라이브러리
=/= 하이버네이트와 달리 SQL구문을 사용해야 함

[사이트 링크](http://www.mybatis.org/mybatis-3/ko/index.html)

[그림]
선택한 행과 똑같은 내용으로 채워진 객체를 만들고, 해당 행의 정보의 지속성/영속성을 유지(persistance)시키는 라이브러리.
> c.setName("aaa"); == UPDATE
> c = null; == DELETE

## JPA
JAVA Persistance API
자바와 디비 사이의 영속성을 유지시켜주는 API.

## Hibernate ( 하이버네이트 )
JAVA Persistance API를 완벽하게 구현해놓은 대표적인 프레임워크.
MyBatis와 달리 SQL구문이 없어도 됨.

## Why MyBatis?
복잡한 JOIN 구문, 뷰, 프로시저, 복잡한 서브쿼리문을 사용해야할 경우 객체 설계가 완벽하지 않을시 Hibernate는 무용지물.

<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE4OTkwNzk0MDRdfQ==
-->