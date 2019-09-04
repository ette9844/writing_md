## Default Servlet

Dispatcher Servlet의 패턴 때문에 <img src="이미지 경로> 태그가 안 먹힐 수 있다.

이런 경우에는 DefaultServlet를 Dispatcher Servlet과 분리한다.

DefaultServlet은 요청확장자가 .html, .css, .js, .jpg, ... 인 경우 해당 자원을 찾아 다운로드한다. (기존 img 태그의 기능)

```xml
<!-- url-pattern으로 인해 이미지 파일이 적용되지 않을 때 -->
<servlet-mapping>
  <servlet-name>default</servlet-name>
  <url-pattern>*.js</url-pattern>
  <url-pattern>*.css</url-pattern>
  <url-pattern>*.jpg</url-pattern>
  <url-pattern>*.gif</url-pattern>
  <url-pattern>*.png</url-pattern>
  <url-pattern>*.ico</url-pattern>
  <url-pattern>*.swf</url-pattern>
</servlet-mapping>
  ```
>Default Servlet은 이미 서블릿이 선언되어있기 때문에, servlet-mapping만 해주면 된다.
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTEwMTExNzg1NjVdfQ==
-->