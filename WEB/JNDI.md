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

이 연결을 미리 만들어 두는 것을 **Database Connection Pool** 이라고 한다.
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTEzMjMwNTU0NiwtMjAzOTgzMTg3N119
-->