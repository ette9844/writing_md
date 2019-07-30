## JSP 구성 요소

1. **scripting 요소**
&nbsp;&nbsp;&nbsp;* *scriptlet*
&nbsp;&nbsp;&nbsp;* *expression*
&nbsp;&nbsp;&nbsp;* *declaration*

2. **directive 요소**
&nbsp;&nbsp;&nbsp;* *page directive*
&nbsp;&nbsp;&nbsp;* *include directive*
&nbsp;&nbsp;&nbsp;* *taglib directive*
3. **action tag 요소**
&nbsp;&nbsp;&nbsp;* *standard action tag*
&nbsp;&nbsp;&nbsp;* *custom action tag*

## Scripting 요소

### Scriptlet
**<% %>**

서버 쪽에서 실행 될 java 구문
= `_jspService()`**내부**에 저장 될 java 구문
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
= `_jspService()`**내부**에 저장 될 java 구문
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

_jspService() **외부**에 저장될 자바구문, 멤버 필드나 메서드

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

**<%@page %>**

페이지 지시자.
_jsp.java 파일이 만들어질 때 필요한 정보를 설정한다.
페이지 지시자는 가독성을 위해 jsp 페이지의 가장 윗줄에 적는 것이 관례.

#### page directive 주요 설정
*(1) contentType*
```java
<%-- 응답 형식 지정 --%>
<%@page contentType="text/html;charset=UTF-8" %>
```

*(2) import*
```java
<%-- import --%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
```
```java
response.setContentType("text/html; charset=UTF-8");
```

*(3) buffer*
```java
<%-- 버퍼 크기 지정 --%>
<%@page buffer="1000kb"%>
<%@page buffer="none"%>
```
>none으로 지정하면 버퍼에 모아서 전송하지 않고 바로바로 전송.

*(4) errorPage, isErrorPage*
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



### Include Directive

**<%@include %>**

include 지시자
include한 링크의 내용이 out.write의 인자로 포함됨

### ※ 지시자를 이용한 포함 vs 태그를 이용한 포함

**Include 지시자 <%@include file="menu.html"%>**
* include한 링크의 내용이 out.write의 인자로 포함.

 
**Include 태그 <jsp:include page="menu.html"/>**

* 동적 포함:
실행시에 링크를 include 매서드의 인자로 전달하여 결과값만 포함.
* <% %> 태그 내에 include 함수를 호출한 것과 같다.
`<% rd.include(~~); %>`
* 동적인 결과를 포함시키고자 할 때 좋다.
* 일반 html 파일에서는 사용할 수 없는 태그

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



## Action Tag 요소


 <li>action tag 요소: html 사이에서 scriptlet 열고 닫고 하면 유지보수가 힘들다.
        <br>scriptlet expression 대신 html과 동일하게 tag를 사용하자는 의도에서 만들어짐.
        <br>*: 의도는 좋았으나, useBean, set/getProperty tag는 확장성이 떨어진다.
          <ol>
            <li>standard action tag</li>
                -include tag: RequestDispatcher의 include()호출과 같은 효과, 다른 페이지 포함
                <jsp:include page="jq/menu.jsp"></jsp:include>
                <hr>
                -forward tag: RequestDispatcher의 forward()호출과 같은 효과, 다른 페이지로 이동
                <%--jsp:forward page="jq/menu.jsp"/--%>
                <br>이 페이지는 MVC 구조를 사용하고있기 때문에, jsp는 forward함수(controller 역할)를 사용하지 않는다.
                <br>jsp는 뷰어의 역할에 충실. jsp가 controller인 경우가 거의 없기 때문에 사용할 일이 별로 없다.
                <hr>
                -*useBean tag: 주석처리 된 태그의 역할을 하는 태그
                <jsp:useBean class="com.my.vo.Customer" id="c" scope="request"/>
                <%--com.my.vo.Customer c = (Customer)request.getAttribute("c");
                  if(c == null){
                  	c = new Customer();
                  	request.setAttribute("c", c);
                  }
                --%>
                <hr>
                -*setProperty / getProperty tag: 주석처리 된 태그의 역할을 하는 태그
                <jsp:setProperty name="c" property="pwd" value="p3"/>
                <%--c.setPwd("p3");--%>
                <jsp:getProperty name="c" property="pwd"/>
                <%--=c.getPwd()--%>
                
                <%--*: 확장성이 떨어짐 => EL, JSTL로 보완 
                <jsp:getProperty name="c" property="post"/><%--아래 코드와 동일한 기능의 tag를 만들 수 없다--%>
                <%--=c.getPost().getZipcode() --%>
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTEwODMyNDgxMzIsLTkzMzgxNzE2NywxND
Q2NDQ0NjI5LDcwNzMwNjUxMSw3ODU1OTE1NTUsNzY5ODU5NDc2
XX0=
-->