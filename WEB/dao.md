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

<!--stackedit_data:
eyJoaXN0b3J5IjpbMzk2NDAzOTg2XX0=
-->