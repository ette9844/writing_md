[교재 132p]

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

### LifeScope이 작은 순
PageContext < request < session < application

### ${attrName}
lifeScope이 작은 순으로 해당 attrName 항목을 검사하고 없으면 빈 문자열을 반환.

session은 클라이언트 별로 생성, 강제로 종료하거나 30분간 사용하지 않을 시 종료 됨. -> 로그인 정보 표기에 좋음
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTcwMTA3MDU2NywxNDYwNDczNDkwXX0=
-->