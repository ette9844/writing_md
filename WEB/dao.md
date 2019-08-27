## 기존 DAO 작성의 번거로움 
Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "studybb", "wow130");

			String SQL = "select * from enrol " + "where study_no = ? " + "order by enrol_status";
			stmt = conn.prepareStatement(SQL);
			stmt.setInt(1, study_no);

			rs = stmt.executeQuery();
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTU2NjM3MTU0NF19
-->