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
>prefix에는 tld 파일의 <short-name>태그 ㄴ


해당 uri를 만족하는 tld 파일을 찾아가는 태그
**tld 파일 경로:** 
JavaResources\Libraries\Web App Library\jstl1.2\META_INF\c.tld
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTA0NDIyNzY3MSw5MDU0MzIxN119
-->