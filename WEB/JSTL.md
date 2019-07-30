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
>JavaResources>Libraries>
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTc4NjEzMTY0NCw5MDU0MzIxN119
-->