## Servlet

let = booklet : 소책자, 별책부록 에서 따옴

**서버**에서 실행되는 특수 어플리케이션
main() 없이 실행
서블릿 엔진 [컨테이너]가 실행시켜준다.

그 외
**~~Middlet~~** 
모바일에서 실행되는 특수 어플리케이션 (2G)

**~~Applet~~**
웹 브라우저에서 실행되는 특수 어플리케이션

## spec
1) public class
2) extends HttpServlet
3) 요청 방식이 GET인 경우 
`public void doGet(HttpServletRequest, HttpServletResponse)` 를 오버라이딩
4) 요청 방식이 POST인 경우
`public void doPost(HttpServletRequest, HttpServletResponse)`를 오버라이딩
(servlet 엔진이 자동 호출해주는 메서드)

## servlet 소스 작성
프로젝트 내 Java Resource>src 폴더에 Servlet파일로 작성

servlet이 만들어질때 web.xml에 servlet element와  servlet-mapping element가 자동 추가되지만
servlet을 삭제해도 추가된 요소가 자동 삭제되지는 않는다

## servlet 실행하기
localhost:8080/`project_name` `servlet-mapping`

ex) web.xml
```html
<servlet>
    <description></description>
    <display-name>FirstServlet</display-name>
    <servlet-name>FirstServlet</servlet-name>
    <servlet-class>control.FirstServlet</servlet-class>
  </servlet>
  <servlet-mapping>
    <servlet-name>FirstServlet</servlet-name>
    <url-pattern>/first</url-pattern>
  </servlet-mapping>
```
url: 
http://localhost:8080/servlet1/first

>servlet엔진이 url과 같은 url-pattern 요소를 찾고, 해당 mapping의 servlet-name을 찾고, 해당 이름과 동일한 servlet element를 찾아 실행함.



### 웹 컨텍스트 구조
웹컨텍스트 루트 (ex. /servlet11)
&nbsp;&nbsp;&nbsp;&nbsp;└WEB-INF
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;└web.xml [FirstServlet.class 에 해당 url-pattern 매핑]
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;└classes
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;└FirstServlet.

<!--stackedit_data:
eyJoaXN0b3J5IjpbMTk1MTQ0MDk4NywtMTUwNDAzMDA1MywtMj
I1ODUzMTIxLC05NjU3MTY0NjhdfQ==
-->