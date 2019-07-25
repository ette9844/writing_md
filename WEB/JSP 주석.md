```html
<div>
  <h3>JSP 구성요소</h3>
  <ul>
    <li>html요소</li>
      <!-- html 주석 : out.write의 인자가 된다-->
    </li>
    <li>JSP 요소
      <%--jsp 주석 : jsp.java파일이 만들어 질때 제외됨. out.write의 인자 x--%>
      <%--보안상 jsp 주석을 사용하는 것을 권장. : 페이지 소스 보기에 jsp 주석이 표기되지 않음--%>
    </li>
  </ul>
</div>
```
* html 요소
* JSP 요소

## JSP 구성 요소

1. scripting 요소
2. directive 요소
3. action tag 요소
### Scriptlet
**<% %>**

서버 쪽에서 실행 될 java 구문
= `_jspService()`내부에 저장 될 java 구문
= 요청시마다 처리 될 java 구문

```java
<li>scriptlet: _jspService()내부에 저장될 자바구문: 요청시마다 처리될 구문
<% int num = 1;
   System.out.println(num);
   out.print(num);
%><br>
<% out.print(request.getParameter("opt");
%><br>
<% out.print(new java.util.Date());
%></li>
```

>`int num`: _jspService()내부에 선언되는 지역 변수
>`out.print(num)`: _jsp.java 파일 내부의 out 변수등 _jsp.java 파일 내에 선언되어 있는 변수를 사용할 수 있다.
> `out.print(request.getParameter("opt")`: _jsp.java 파일 내부의 request, response등 _jspService의 매개변수를 사용할 수 있다.
> `out.print(new java.util.Date())`: java의 다양한 library도 사용할 수 있다.

**※ 처리 순서 주의**
`<% %>`
`<script></script>`


### Expression

**<%= %>**

서버 쪽에서 실행 될 java 구문
= `_jspService()`내부에 저장 될 java 구문
= 요청시마다 처리 될 java 구문

**out.print메서드가 자동 호출 됨**

```java
<li>expression
<%=num%>, 
<%=request.getParameter("opt")%>, 
<%=new java.util.Date()%>
</li>
```
>`<%=num%>`: _jsp.java 에서 out.print(num); 으로 변환 됨.


### Declaration

**<%! %>**

_jspService() 외부에 저장될 자바구문, 멤버 필드나 메서드

scriptlet
```java
<% int cnt = 0; %>
참여인원 <%=++cnt %>명
```
>참여인원이 계속 한명.
>요청이 들어올 때마다 _jspService내 **지역변수** cnt가 0으로 초기화 되기 때문.

declaration
```java
<%!
int cnt; // 인스턴스 변수
void m() { out.println(cnt); }
%>
cnt = <%=cnt %>
```
>



### Page Directive

**<%@ %>**

페이지 지시자.
_jsp.java 파일이 만들어질 때 필요한 정보를 설정한다.
페이지 지시자는 가독성을 위해 jsp 페이지의 가장 윗줄에 적는 것이 관례.

### page directive 주요 설정
**(1) contentType**
```java
<%-- 응답 형식 지정 --%>
<%@page contentType="text/html;charset=UTF-8" %>
```

**(2) import**
```java
<%-- import --%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
```
```java
response.setContentType("text/html; charset=UTF-8");
```
**(3) buffer**
```java
<%-- 버퍼 크기 지정 --%>
<%@page buffer="1000kb"%>
<%@page buffer="none"%>
```
>none으로 지정하면 버퍼에 모아서 전송하지 않고 바로바로 전송.

**(4) errorPage, isErrorPage**
JSP페이지에서 try-catch로 예외처리하는 대신 error page 속성 설정을 통해 예외처리 전용 페이지에서 처리하도록 한다.
```java
<%@page errorPage="err.jsp" %>
<%
	FileInputStream fis = null;
    String fileName = "a.txt";
  	fis = new FileInputStream(fileName);
%>
```
```java
err.jsp
<%@page isErrorPage="true"%>
```
>`errorPage`: 현재 페이지에서 예외가 발생하면 err.jsp로 **forward**한다.
>`isErrorPage`: 에러 페이지 선언. 에러 페이지에서는 exception 변수를 선언할 수 있다.



## Include

<%@include %>

**미세 팁:** 
eclipse에서 jsp오류가 없는데도 빨간 줄이 안없어질 경우에는 편집기에 열려있는 jsp 파일을 닫았다가 다시 열어준다.
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTY5ODc5ODA3MCwyMDI0OTkxMjEzLC0xOD
EwNjM2NTM5LC01NzgxNTgxOTUsLTkxMjExNzQ5NSw0OTc3MjUx
NzQsLTExMDgyMjgxNTQsNTE5MTU5NTc2LC0yODk5OTk3MTYsMT
k1NDk1MzU4OSwtMjA1MDQwMjUwMSwxODAwMTkzMzg2XX0=
-->