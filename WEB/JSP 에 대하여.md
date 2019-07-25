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



## jsp 엔진이 하는 일

```text
first.jsp 요청
first.jsp 전용 객체 존재여부 파악
if (없을 경우) {
	전용 클래스 (first_jsp.class) 존재여부 파악
	if (없을 경우) {
		전용 자바 파일 생성 (first_jsp.java)
		이를 컴파일 하여 class 생성
	}
	객체 생성
	jspInit() 자동 호출
}
HttpServletRequest, HttpServletResponse 객체 생성
_jspService( request, response ) 자동 호출
```
---
**미세 팁:** 
eclipse에서 jsp오류가 없는데도 빨간 줄이 안없어질 경우에는 편집기에 열려있는 jsp 파일을 닫았다가 다시 열어준다.


#### 참고하면 좋은 게시글
[MVC 패턴]()
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTg0MzYxMzQwMywtMTgzNzM5MDIyNiwxMz
Y5ODEwMzk3LDUwNzQxODM0OSwxNzgyMzg0NzM4LDEwODM4ODky
NTJdfQ==
-->