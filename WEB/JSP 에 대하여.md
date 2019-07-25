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


## MVC 패턴
**Model - View - Controller**

객체 모델링 패턴의 한 종류.
유지보수성이 높다. 
대형 (기업체) 프로젝트에서 사용하기 좋다.


**SERVICE / DAO** : ***비지니스*** 로직 담당 / **Model**

**JSP**: ***프레젠테이션*** 로직 담당 / **View**

 **SERVLET**:  ***컨트롤러*** 로직 담당 / **Controller**
> 요청 받기 `request.getParameter()`
> 비지니스 로직 호출  `service.login()` 


add and remove 하면 tomcat 폴더내 wtpwebapps 폴더에 webContent 하위 항목들이 복사된다.(배포된다)

servlet, dao등의 java class 파일은 에 복사된다.

jsp 파일은 브라우저에서 해당 jsp를 처음 요청할 때 tomcat 폴더 내 work 폴더에 generate 된다.

HttpServlet 
 |  상속
HttpJspBase
 |  상속
first_jsp

jsp 는 특수 servlet으로 볼 수 있다.

first_jsp class의 _jspService 메서드는 servlet의 doGet / doPost와 유사

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
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTM2OTgxMDM5Nyw1MDc0MTgzNDksMTc4Mj
M4NDczOCwxMDgzODg5MjUyXX0=
-->