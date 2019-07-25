## JSP 구성 요소

1. scripting 요소
2. directive 요소
3. action tag 요소

## Scripting 요소

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

## Directive 요소

### Page Directive

**<%@ %>**

페이지 지시자.
_jsp.java 파일이 만들어질 때 필요한 정보를 설정한다.
페이지 지시자는 가독성을 위해 jsp 페이지의 가장 윗줄에 적는 것이 관례.

#### page directive 주요 설정
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

**<%@include %>**

### ※ 지시자를 이용한 포함 vs 태그를 이용한 포함

**Include 지시자 <%@include file="menu.html"%>**
* include한 링크의 내용이 out.write의 인자로 포함.

 
**Include 태그 <jsp:include page="menu.html"/>**
* 실행시에 링크를 include 매서드의 인자로 전달하여 결과만 포함.
* <% %> 태그 내에 include 함수를 호출한 것과 같다.
* 동적인 결과를 포함시키고자 할 때 좋다.
* 일반 html 파일에서는 사용할 수 없다.

---

EX)
a.jsp
```java
<%int i = 10;%>
```
b.jsp
```java
<%@include file = "a.jsp"%>
<% int i=99; %>   <%-- error: 중복된 변수 선언 --%>
<%=i%>
```
>b_jsp.java
>```java
>int i=0;
>int i =99; // X
>out.print(i);
>```


c.jsp
```java
<jsp:include page = "a.jsp"/>
<%=i%>    <%-- error: a.jsp 내의 변수 사용 불가 --%>
```
>c_jsp.java
>```java
>org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "a.jsp", out, false);
>```




<!--stackedit_data:
eyJoaXN0b3J5IjpbLTEwMjU0NDU4MzIsNzY5ODU5NDc2XX0=
-->