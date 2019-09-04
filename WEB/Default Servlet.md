## Default Servlet

Dispatcher Servlet의 패턴 때문에 <img src="이미지 경로> 태그가 안 먹힐 수 있다.

이런 경우에는 DefaultServlet를 Dispatcher Servlet과 분리한다.

DefaultServlet은 요청확장자가 .html, .css, .js, .jpg, ... 인 경우 해당 자원을 찾아 다운로드한다. (기존 img 태그의 기능)

>Default Servlet은 이미 서블릿이 선언되어있기 때문에, servlet-mapping만 해주면 된다.
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTIwOTkzNzQ1NjBdfQ==
-->