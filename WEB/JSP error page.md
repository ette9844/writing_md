에러 페이지로 forwarding
<%@ page errorPage = "err.jsp"%>

예외처리 전용 페이지 지정
<%@page isErrorPage = "true"%>

<%=exception.getMessage()%>
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTkyNTg3NTkxN119
-->