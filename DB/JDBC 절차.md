## JDBC 절차

1. JDBC 드라이버 로드 	
Class.forName(~)

2. DB와 연결 					
Connection conn = ~

3. SQL 구문 송신 				
String selectSQL = "SELECT * FROM CUSTOMER";
PreparedStatement pstmt = ~

4. SQL 결과 수신
ResultSet rs =  pstmt.executeQuery(selectSQL);

5. 결과 수신
if(rs.next()) 
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTgxNzQ3MTY1N119
-->