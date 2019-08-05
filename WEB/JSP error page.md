에러 페이지로 forwarding
<%@ page errorPage = "err.jsp"%>

예외처리 전용 페이지 지정
<%@page isErrorPage = "true"%>

예외처리 전용 페이지인 경우, exception 내장 객체 사용 가능
<%=exception.getMessage()%>
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE5MDk5NTIyODBdfQ==
-->