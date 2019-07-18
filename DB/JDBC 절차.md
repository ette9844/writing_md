## JDBC 절차

1. JDBC 드라이버 로드 	
```java
Class.forName(~)
```
2. DB와 연결 
```java
Connection conn = ~
```
3. SQL 구문 송신 				
```java
String selectSQL = "SELECT * FROM customer WHERE id=?";
PreparedStatement pstmt = ~
```
5. SQL 결과 수신
```java
ResultSet rs =  pstmt.executeQuery(selectSQL);
```
6. 결과 수신
```java
if(rs.next()) {
	if(pwd.equals(rs.getString("pwd")){
		// 로그인 성공
	}
}
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTEyMzgxMTg3MzFdfQ==
-->