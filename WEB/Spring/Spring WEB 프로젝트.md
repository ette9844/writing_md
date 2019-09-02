## Spring WEB project 생성
1. 이클립스에 spring tool suite 플러그인 설치
2. 이클립스 Dynamic Web Project 만들기
3. 필요한 라이브러리들을 maven으로 관리 → maven 프로젝트로 변경
[spring-web-mvc](https://mvnrepository.com/artifact/org.springframework/spring-webmvc) - 5.0.2
[spring-jdbc](https://mvnrepository.com/artifact/org.springframework/spring-jdbc) - 5.0.2
[mybatis](https://mvnrepository.com/artifact/org.mybatis/mybatis) - 3.5.2
[mybatis-spring](https://mvnrepository.com/artifact/org.mybatis/mybatis-spring) - 1.3.2
[jstl](https://mvnrepository.com/artifact/javax.servlet/jstl) - 1.2
[json-simple](https://mvnrepository.com/artifact/com.googlecode.json-simple/json-simple) - 1.1.1
4. web.xml 파일에 dispatcher servlet 추가
```xml
<servlet>
  <servlet-name>디스패쳐서블릿이름</servlet-name>
  <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
</servlet>
<servlet-mapping>
  <servlet-name>디스패쳐서블릿이름</servlet-name>
  <url-pattern>/</url-pattern>
</servlet-mapping>
  ```
 5. 디스패쳐 설정 xml 파일 이름은 `디스패쳐서블릿이름-servlet.xml` 로 설정하면 톰캣 구동시 스프링 컨테이너가 자동 구동된다. 
 6. 디스패쳐 설정 xml은 WEB-INF 폴더에 bean configuration file 형태로 추가하고 namespace는 beans와 mvc, context 등을 체크한다.
 7.  디스패쳐 설정 xml에 아래 구문 추가
 ```xml
<context:annotation-config/>
<context:component-scan base-package="control"/>
<mvc:annotation-driven></mvc:annotation-driven>
```

## 컨트롤러 설정

기존 컨트롤러와 달리 메서드의 스펙이 딱히 없다.
어노테이션으로 mapping만 잘해주면 OK

**return type이 void 일 경우, xml 설정 파일에서 view-resolver를 통해 뷰어와 매핑한다.**

상세 설명은 아래에


**return type이 String 타입일 경우, viewer 이름을 리턴한다.**
```java
@Controller
public class LoginController {
	@RequestMapping("/a")
	public String a() {
		System.out.println("LoginController의 a() 호출됨");
		return "result.jsp";
	}
}
```
>contextPath/a 로 요청할 시, result.jsp 페이지가 출력 됨.

---

### @RequestMapping : 
GET / POST 방식 가리지 않고 처리
```java
@Controller
public class LoginController {
	@RequestMapping("/a")
	public void a() {
		System.out.println("LoginController의 a() 호출됨");
	}
}
```
>@Controller annotation
>@RequestMapping() : /a 링크 요청이 들어왔을 시, 해당 method가 실행 됨


### @GetMapping : 
GET 방식 요청 처리
```java
@Controller
public class LoginController {
	@GetMapping("/a")
	public void a() {
		System.out.println("LoginController의 a() 호출됨");
	}
}
```
>하위 버전에는 없는 기능
>@RequestMapping에 get 속성을 줘서 @GetMapping 어노테이션 처럼 처리할 수 있다.


### @PostMapping : 
POST 방식 요청 처리
```java
@Controller
public class LoginController {
	@PostMapping("/a")
	public void a() {
		System.out.println("LoginController의 a() 호출됨");
	}
}
```
>하위 버전에는 없는 기능
>@RequestMapping에 post 속성을 줘서 @PostMapping 어노테이션 처럼 처리할 수 있다.

---

### 일반 웹프로젝트 매핑
control.DispatcherServlet 에서 dispatcher.properties 파일과 매핑

### 스프링 웹프로젝트 매핑
servlet.DispatcherServlet에서 디스패쳐서블릿이름-servlet.xml 파일과 매핑
```xml
<context:component-scan base-package="control"/>
<mvc:annotation-driven/>
```
>`<context:component-scan>` : control 패키지에서 @Component 계열 어노테이션이 설정 된 클래스 타입의 객체 생성
>`<mvc:annotation-driven>` : 생성된 객체중 @Control 어노테이션 객체 찾기 / @RequestMapping 어노테이션 메서드 찾아 실행

### <mvc: view-resolvers>

```xml
<mvc:view-resolvers>
	<mvc:jsp prefix="/" suffix=".jsp" />
</mvc:view-resolvers>
```
`<mvc:view-resolvers>` : controller 에서 어떤 뷰로 이동할지 설정하는 태그
`<mvc:jsp>` : 
>view-resolver의 하위 요소로 jsp를 등록하는 태그. 
>뷰의 유형이 jsp 임을 알림
>
>기본 prefix (접두어): WEB-INF
>기본 suffix (접미어): jsp
>함수 이름이 a일 경우 경로: WEB-INF/a.jsp
>
>return "/WEB-INF/a.jsp"; 과 같은 효과를 갖는다.
>prefix:/ 일 경우, WebContent 하위 경로에서 jsp를 찾는다.


## 뷰 결정 방법
### controller 용 메서드 이름을 viewer 이름으로 활용하려면 
view-resolver를 등록하라

#### controller.java
```
@GetMapping("/a")		  	Controller					Viewer
public void a() {}		--> LoginController.a()			/a.jsp

@GetMapping("/other1")		
public void b() {}		--> LoginController.b()			/b.jsp

@GetMapping("/other2")		
public void c() {}		--> LoginController.c()			/c.jsp
```

#### mvc1-servlet.xml
```
<mvc:view-resolvers>
	<mvc:jsp prefeix="/" suffic=".jsp"/>
</mvc:view-resolvers>
```


### controller용 메서드 이름을 viewer 이름으로 활용하지 않으려면 
view-resolver 필요없다.

#### controller
```
@GetMapping("/a")		  	Controller				Viewer
public void a() {		--> a()						/first.jsp
	return "/first.jsp";
}

@GetMapping("/other1")
public void b() {		--> b()						/second.jsp
	return "/second.jsp";
}

@GetMapping("/other2")
public void c() {		--> c()						/third.jsp
	return "/third.jsp";
}
```

## 요청 전달 데이터

1. 매개변수 이름과 요청 전달 데이터의 이름을 동일하게 설정
>요청: http://localhost:8080/spring-mvc1/a?id=aaa&pwd=bbb
```java
public String a(String id, String pwd) {
	System.out.println("LoginController의 a() 호출됨");
	System.out.println("전달된 id: " + id + " / 전달된 pwd: " + pwd);
	return "result.jsp";	// view 이름
}
```

2. @RequestParam 어노테이션 사용
>요청: http://localhost:8080/spring-mvc1/a?id=aaa&pwd=bbb
```java
public String a(String id, @RequestParam("pwd") String p) {
	System.out.println("LoginController의 a() 호출됨");
	System.out.println("전달된 id: " + id + " / 전달된 pwd: " + pwd);
	return "result.jsp";	// view 이름
}
```

## 기존 servlet 프로젝트를 스프링 프로젝트로 변경

src\control\CustomerController.java를 스프링 컨테이너용 객체로 바꾸기
1. mvc1-servlet.xml 파일에
```xml
<context:component-scan base-package="control"/>
<context:component-scan base-package="com.my.service"/>
``` 
추가

3. CustomerController.javva에 어노테이션 추가 (@Controller)
```java
@Controller
public class CustomerController {
	@Autowired
	private CustomerService service;
	
	@RequestMapping("/login")
	public String login(String id, String pwd, HttpServletRequest request)
			throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		
		String str = service.login(id, pwd);
		/*--로그인성공시 HttpSession객체의 속성으로 추가 --*/
		JSONParser parser = new JSONParser();
		try {
			Object obj = parser.parse(str);
			JSONObject jsonObj = (JSONObject)obj;
			if((Long)jsonObj.get("status") == 1) {//로그인 성공!
				session.setAttribute("loginInfo", id);
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return "/result.jsp";
	}
	...
}
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbMjA5MTQ1Njc5MCwtNTg0MzcyNTE3LDExOD
EzMTQ5MzEsMTM0NzMzODQzMCwtNjAwNzIwNTY2LC0yMDk4OTUx
ODAzLC04NTAwOTYxNzAsMTM0ODUxOTg3NiwxMzU2NTM3ODQxLD
EwNTAyNjE5ODMsMTk1NDg3MDA2NSw4MzI4MDk5MTNdfQ==
-->