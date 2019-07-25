## JSP 를 사용하는 이유

servlet으로 응답 작업까지 하기에는 내용이 너무 많다.
JSP를 사용하면 훨씬 단순하게 응답 작업을 작성할 수 있다. 

EX) menu.html
```html
<ul>
  <li><a href="#">게시판</a></li>
  <li><a href="#">공지사항</a></li>
  <li><a href="login.html">로그인</a></li>
  <li><a href="join.html">가입</a></li>
  <li><a href="display.html">시군구</a></li>
</ul>
```
해당 메뉴html을 레이아웃 html에 끼워넣고 싶을 경우
1. servlet일 경우
2. 





 **SERVLET**:  ***컨트롤러*** 로직 담당
* 요청 받기 `request.getParameter()`
* 비지니스 로직 호출  `service.login()` 

**SERVICE / DAO** : 비지니스 로직 담당

**JSP**: ***프레젠테이션*** 로직 담당
<!--stackedit_data:
eyJoaXN0b3J5IjpbODg4NDE0MTE3XX0=
-->