
PageContext : PageContext
request: HttpServletRequest
session: HttpSession
application: ServletContext

### attribute 가져오기 (EL표기법)
```
${pageScope.attrName}
${requestScope.attrName}
${sessionScope.attrName}
${applicationScope.attrName}
```
기본 표기법
```
<%=pageContext.getAttribute("attrName")%>
<%=request.getAttribute("attrName")%>
<%=session.getAttribute("attrName")%>
<%=application.getAttribute("attrName")%>
```

### 생명주기 짧은 순
PageContext < request < session < application

session은 클라이언트 별로 생성, 강제로 종료하거나 30분간 사용하지 않을 시 종료 됨. -> 로그인 정보 표기에 좋음
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTc0MTU3OTg1MCwxNDYwNDczNDkwXX0=
-->