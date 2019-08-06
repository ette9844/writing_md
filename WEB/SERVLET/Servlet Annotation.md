## Annotation
자바 어노테이션은 자바 소스 코드에 추가하여 사용할 수 있는 **메타데이터**의 일종이다. 
보통 **@ 기호**를 앞에 붙여서 사용한다. 
JDK 1.5 버전 이상에서 사용 가능하다.

아래는 servlet작성 시 자주 사용되는 기본적인 어노테이션을 정리하겠다.

## @Override
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

## @WebServlet
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
eyJoaXN0b3J5IjpbMTc2MDAzNjYzNV19
-->