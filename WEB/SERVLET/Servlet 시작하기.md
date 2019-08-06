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
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;└FirstServlet.class

`http://localhost:8080/servlet11/WEB-INF/classes/FirstServlet`
WEB-INF 폴더에 url로 직접 접근할 수 없기 때문에,
`http://localhost:8080/servlet11/first`
web.xml내의 url-pattern으로 해당 servlet에 접근한다

## Annotation
주석, @Override 표기 등
### @Override
컴파일 타임에 영향을 미치는 annotation의 한 종류
```java
class P { void m(){} }
class C extends P {
	@Override		// override annotation
	void n(){}		
}
```
>n()는 m()의 오타
>@Override 을 작성할 시, 컴파일 하면서 에러를 잡아준다. 

### @WebServlet
`@WebServlet(urlPatterns="/first")`
`@WebServlet(urlPatterns = {"/test", "/test2"}`

서블릿 3.0 버전 부터 사용 가능한 annotation
해당 annotation을 사용하면 web.xml 파일에 따로 등록하지 않아도 서블릿으로 등록된다.

3.0 이후 버전 부터 eclipse에서 servlet 생성시 @WebServlet 어노테이션이 자동으로 추가 됨

하나의 servlet의 urlPattern을 String 배열을 통해 여러개 지정할 수 있다.

```
*@WebServlet 어노테이션 descripton*

@Target(value={TYPE})  
@Retention(value=RUNTIME)  
@Documented
```
>@Target(value={`TYPE`}): 클래스 선언 윗부분에 붙는 annotation
>@Retention(value=`RUNTIME`): 실행시에 일을하는 annotation

#### 그 외 다양한 @WebServlet annotation의 attribute
```java
@WebServlet(urlPatterns = {"/test", "/test2"}, 
			loadOnStartup = 1, 
			initParams = @WebInitParam(name="charset", value="UTF-8"))
```
**loadOnStartup**
```html
<servlet>
  ...
  <load-on-startup>1</load-on-startup>
</servlet>
```
보통 초기화 작업은 상대적으로 시간이 오래 걸리기 때문에, 처음 서블릿을 사용하는 시점보다는 웹 컨테이너를 처음 구동하는 시점에 초기화를 진행하는 것이 좋다.
이를 위한 설정이 loadOnStartup.

**initParams**
```html
<servlet>
  ...
  <init-param>
    <param-name>charset</param-name>
    <param-value>UTF-8</param-value>
  </init-param>
</servlet>
```
서블릿의 초기화 파라미터를 지정할 때 사용 함.

지정된 초기화 파라미터로 맴버 변수 초기화
```java
@WebServlet(~~)
public class testServlet extends HttpServlet {
	private String charset;
    public void init(ServletConfig sc) throws ServletException {
    	super.init(sc);
    	charset = this.getInitParameter(charset);
    }
}

```
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTM1NjY4MjA2NCwxNzQ3Mzc5NDM1XX0=
-->