## JSTL

Jsp Standard Tag Library

EL에서 불가능한 반복문, 조건문, 변수 처리를 하기 위한 EL기반의 태그 라이브러리

### 1. 적용법
[JSTL 다운로드 링크1](https://mvnrepository.com/artifact/javax.servlet/jstl)
[JSTL 다운로드 링크2](http://www.java2s.com/Code/Jar/j/Downloadjstl12jar.htm)

1. 링크에서 jstl 1.2 jar파일을 다운받는다.
2. 압축을 풀고 프로젝트의 WebContent>WEB_INF>lib 폴더 아래에 붙여넣는다.
3. tag lib 지시자를 통해 외부 library를 사용하겠다고 선언한다.

### tag lib
```java
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
```
>prefix에는 tld 파일의 `<short-name>`태그 내용을 작성
>uri에는 tld 파일의 `<uri>` 태그 내용을 작성


해당 uri를 만족하는 tld 파일을 찾아가는 태그

**tld 파일 경로:** 
```
JavaResources\Libraries\Web App\Library\jstl1.2\META_INF\c.tld
```
tld 파일 내부에는 jstl 태그의 사용법이 적혀있다.

### 2. 변수 선언
```html
ex) jsp 파일 내부
<c:set var="num" value="1"/>
c:set으로 선언한 num 변수: ${num}
```
```html
ex) set태그에 대한 tld 파일 내부
<tag>
    <description>
        Sets the result of an expression evaluation in a 'scope'
    </description>
    <name>set</name> <!--태그이름-->
    <!--태그를 호출했을 시 실제로 불러지는 class-->
    <tag-class>org.apache.taglibs.standard.tag.rt.core.SetTag</tag-class> 
    <body-content>JSP</body-content>
    <attribute> <!--속성들-->
        <description>
		...
        </description>
        <name>var</name>
        <required>false</required> <!--필수 속성이 아님-->
        <rtexprvalue>false</rtexprvalue>
    </attribute>
```
결과값:  1


### 3. 조건문
#### if
```html
<c:if test="${param.foo == 'hello'}">환영합니다</c:if> 
```
>test속성값에는 조건문을 EL표기법으로 써줘야 함.
>else태그는 없다.  
>그러나 switch 대신 사용할 수 있는 choose태그가 존재한다.

#### choose
```html
<c:choose>
  <c:when test="${param.foo == 'hello'}">환영합니다</c:when>
  <c:when test="${param.foo == 'bye'}">안녕히가세요</c:when>
  <c:otherwise>${param.foo}</c:otherwise>
</c:choose>
```
>java의 switch-case-case-default 구문과 유사

### 4. 반복문

<!--stackedit_data:
eyJoaXN0b3J5IjpbLTM1NjQ1MTg3MiwxNTEyMjc4MDA3LC0xMj
Y4ODgzMzg2LDg5NTk2NzI3NSw3NTg3MDI2NzEsLTEyNzk5OTg0
NDYsOTA1NDMyMTddfQ==
-->