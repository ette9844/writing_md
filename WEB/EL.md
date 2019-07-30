## Expression Language = EL

html 사이에서 scriptlet 열고 닫고 하면 유지보수가 힘들다.
        
jsp의 getProperty, setProperty 태그의 확장성이 떨어지는 점을 보완하기 위해 사용. (EL외에도 JSTL을 사용하기도 함)


### EL 산술 연산자
<table border="1">
          <thead>
        <tr><td><b>EL Expression</b></td>
        <td><b>Result</b></td>
      </tr></thead>
      <tbody><tr>
        <td>${1}</td>
        <td>1</td>
      </tr>
      <tr>
        <td>${1 + 2}</td>
        <td>3</td>
      </tr>
      <tr>
        <td>${1.2 + 2.3}</td>
        <td>3.5</td>
      </tr>
      <tr>
        <td>${1.2E4 + 1.4}</td>
        <td>12001.4</td>
      </tr>
      <tr>
        <td>${-4 - 2}</td>
        <td>-6</td>
      </tr>
      <tr>
        <td>${21 * 2}</td>
        <td>42</td>
      </tr>
      <tr>
        <td>${3/4}</td>
        <td>0.75</td>
      </tr>
      <tr>
        <td>${3 div 4}</td>
        <td>0.75</td>
      </tr>
      <tr>
        <td>${3/0}</td>
        <td>Infinity</td>
      </tr>
      <tr>
        <td>${10%4}</td>
        <td>2</td>
      </tr>
      <tr>
        <td>${10 mod 4}</td>
        <td>2</td>
      </tr>
    <tr>
      <td>${(1==2) ? 3 : 4}</td>
      <td>4</td>
    </tr>
    </tbody></table>

>정수를 정수로 나눈 결과가 실수가 나올 수 있다.
java언어이지만, 연산 결과는 javaScript와 비슷하다.


※ ${ EL 표현식 }과 $( jQuery의 선택자 )를 헷갈리지 말아야한다.

### EL 비교 연산자
숫자 비교
<table border="1">
          <thead>
        <tr><td><b>EL Expression</b></td>
        <td><b>Result</b></td>
      </tr></thead>
      <tbody><tr>
        <td>${1 &lt; 2}</td>
        <td>true</td>
      </tr>
      <tr>
        <td>${1 lt 2}</td>
        <td>true</td>
      </tr>
      <tr>
        <td>${1 &gt; (4/2)}</td>
        <td>false</td>
      </tr>
      <tr>
        <td>${1 gt (4/2)}</td>
        <td>false</td>
      </tr>
      <tr>
        <td>${4.0 &gt;= 3}</td>
        <td>true</td>
      </tr>
      <tr>
        <td>${4.0 ge 3}</td>
        <td>true</td>
      </tr>
      <tr>
        <td>${4 &lt;= 3}</td>
        <td>false</td>
      </tr>
      <tr>
        <td>${4 le 3}</td>
        <td>false</td>
      </tr>
      <tr>
        <td>${100.0 == 100}</td>
        <td>true</td>
      </tr>
      <tr>
        <td>${100.0 eq 100}</td>
        <td>true</td>
      </tr>
      <tr>
        <td>${(10*10) != 100}</td>
        <td>false</td>
      </tr>
      <tr>
        <td>${(10*10) ne 100}</td>
        <td>false</td>
      </tr>
    </tbody></table>
<br/>

문자 비교
<table border="1">
          <thead>
            <tr><td><b>EL Expression</b></td>
            <td><b>Result</b></td>
          </tr></thead>
          <tbody><tr>
            <td>${'a' &lt; 'b'}</td>
            <td>true</td>
          </tr>
          <tr>
            <td>${'hip' &gt; 'hit'}</td>
            <td>false</td>
          </tr>
          <tr>
            <td>${'4' &gt; 3}</td>
            <td>true</td>
          </tr>
        </tbody></table>

>문자열 비교: equals() 사용하지 않음 == 로 비교


### EL의 .연산자
* ${`Map`.`key`}
ex) ${ param.foo }
* ${`JavaBean`.`property`}
ex) ${ requestScope.c.id } 에서 c: JavaBean, id: property


### EL 내장 객체
**<주요 내장 객체>**
* requestScope: request의 attribute에 관련된 Map 자료구조
`${requestScope.foo}` 는 `<%=request.getAttribute("foo")%>`와 동일

* param: request의 parameter에 관련된 Map 자료구조
`${param.foo}` 는 `<%=request.getParameter("foo")%>`와 동일

### context
JAVA EE
>javax.servlet.ServletContext:  
>웹 어플리케이션에 대한 정보
>javax.servlet.PageContext:
> JSP에 대한 정보

JAVA SE
>	java.lang.Class: 클래스 정보
	java.lang.Object : 객체 정보
	java.io.File : 파일 정보


이렇듯 정보가 담겨있는 API를 메타 혹은 메타 API라고 한다.

_jsp.java 파일에 자동으로 메타 API의 지역 변수가 만들어진다.
```java
final javax.servlet.jsp.PageContext pageContext;
javax.servlet.http.HttpSession session = null;
final javax.servlet.ServletContext application;
final javax.servlet.ServletConfig config;
javax.servlet.jsp.JspWriter out = null;
final java.lang.Object page = this;
javax.servlet.jsp.JspWriter _jspx_out = null;
javax.servlet.jsp.PageContext _jspx_page_context = null;
```

application변수로 웹 어플리케이션에 대한 정보 가져오기
```java
<%=application.getRealPath("a.jpg")%>
```

pageContext변수로 JSP에 대한 정보 가져오기
```java
<%
sop(pageContext.getOut());
sop(pageContext.getRequest());
sop(pageContext.getResponse());
%>
```


<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE0Nzg4MjE3MjEsMTI3NDk0MjM2Niw3MD
Y5MjMwMTYsMTExMzk1MDEyMSw3NDY2NjQ5MCwtNjMyMjkzMzMz
LC05MDgwODYyMjVdfQ==
-->