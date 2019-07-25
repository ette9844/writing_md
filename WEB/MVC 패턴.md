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

[사진]
이런식으로 작성한 html이 _jspService의 out.write()의 인자로 작성되기 때문에 의미 없는 띄어쓰기나 들여쓰기는 지양하는 것이 좋다. 

최적화된 띄어쓰기 / 들여쓰기를 할 것.



### 웹서버 영역 
* .html, .htm, .js, .css, .txt, .jpg ...
* 파일을 찾아 파일 내용을 응답
* 서버 영역이 처리할 수 없는 확장자는 엔진 영역으로 위임

### 엔진 영역
* jsp 엔진
* servlet 엔진:
web.xml 파일의 url pattern에 해당하는 servlet class 찾기
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE5NTAzNzA4NTBdfQ==
-->