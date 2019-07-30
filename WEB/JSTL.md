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
```html
ex) jsp 파일 내부
<c:set var="" value=""></c:set>
```
```html
ex) set태그에 대한 tld 파일 내부
<tag>
    <description>
        Sets the result of an expression evaluation in a 'scope'
    </description>
    <name>set</name> <!--태그이름-->
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
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTEyNzk5OTg0NDYsOTA1NDMyMTddfQ==
-->