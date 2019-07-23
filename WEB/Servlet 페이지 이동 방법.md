## 페이지 이동 방법 1
```java
response.sendRedirect("http://www.google.com");
```
>결과: 성공
location객체의 href 속성을 주는 것과 같은 동작

## 페이지 이동 방법 2 
```java
String path = "http://www.google.com";
RequestDispatcher rd = request.getRequestDispatcher(path);
rd.forward(request, response);
```
>결과: 실패 / 응답코드 404 
>링크: `/servlet4/http://www.google.com`

같은 webContext의 하위 url로만 이동할 수 있다.


		// http://localhost:8080/servlet4/jq/login.html
		// 주소가 바뀌고 client 사이드에서 login.html을 재요청 하게 됨
		// 새로운 request/response 객체가 만들어짐
//		response.sendRedirect(path);
		
		// http://localhost:8080/servlet4/move
		// 서버 사이드에서 login.html을 요청하고 client로 전송
		// sendRedirect보다 많이 쓰임

		// **서버 사이드에서의 이동 방법 : Forwarding!**
		// RequestDispatcher: 기존 페이지의 request를 다른 페이지에게 전달한다
		RequestDispatcher rd = request.getRequestDispatcher(path);
		// forward: 전달하고 돌아오지 않는다 = 페이지 이동
		rd.forward(request, response);
		// request: 전달하고 다시 돌아온다 = 포함한다
		rd.include(request, response);
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTU2NjIyMjU1OCwtMTA4MTI3NDQ2OSwzNj
QyNzc4MzZdfQ==
-->