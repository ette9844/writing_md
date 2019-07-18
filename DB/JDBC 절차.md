## JDBC 절차

1) JDBC 드라이버 로드 	Class.forName(~)
2) DB와 연결 					Connection conn = ~
3) SQL 구문 송신 				PreparedStatement pstmt = ~
											pstmt.executeQuery(selectSQL);
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTIwNzIwODU4NjRdfQ==
-->