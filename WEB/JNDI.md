## JNDI

Java Naming and Directory Interface

java에서 Naming and Directory Service를 사용할 수 있게 하는 라이브러리.
각 데이터베이스에 대한 서비스를 디렉토리 형태로 등록할 수 있다.

## Standard DB 연결
```java
Connection con = DriverManager.getConnection(url, user, pwd);
```
>사용자가 요청 할때마다 연결을 시작함.
>사용자 데이터베이스와의 연결 시간이 오래걸리는 것으로 느낌.

이 연결을 미리 만들어 두는 것을 **DataBase Connection Pool (DBCP)** 이라고 한다.

DBCP API : javax.sql.DataSource 

## DataSource 를 사용한 DB 연결
JNDI를 이용해서 **이름으로** 찾아와서 database 정보를 가져온다.

##### context configuration
```xml
<Resource name="jdbc/myoracle" auth="Container"
              type="javax.sql.DataSource" driverClassName="oracle.jdbc.OracleDriver"
              url="jdbc:oracle:thin:@127.0.0.1:1521:mysid"
              username="scott" password="tiger" maxTotal="20" maxIdle="5"
              maxWaitMillis="-1"/>
```
>maxIdle: 미리 연결해두는 최대 연결수
>메모리 번지수 대신 이름으로 관리.
>이름 등록은 아래의 web.xml에서 설정.

##### web.xml configuration
```xml
<resource-ref>
  <description>Oracle Datasource example</description>
  <res-ref-name>jdbc/myoracle</res-ref-name>
  <res-type>javax.sql.DataSource</res-type>
  <res-auth>Container</res-auth>
</resource-ref>
```
>res-ref-name: Resource에 대한 이름 등록

##### servlet
```java
Context initContext = new InitialContext();
Context envContext  = (Context)initContext.lookup("java:/comp/env");
DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
Connection conn = ds.getConnection();
//etc.
```
>이름을 통해 dataSource를 찾아온다.

##### config.xml
```xml
<jee:jndi-lookup id="dataSource" jndi-name="jdbc/myoracle" resource-ref="true" />
```
>
<!--stackedit_data:
eyJoaXN0b3J5IjpbODg2NTEzOTY2LC0xNzQwOTQwNTk1LC01Nz
k2NDM3OTAsLTEzOTgxNDUxMzUsLTIwMzk4MzE4NzddfQ==
-->