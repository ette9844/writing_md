# 스프링 MVC 실행 구조

[p250 사진]
[사진]
>view-resolver는 optional 하다. view 이름을 그대로 사용할 경우에는 view-resolver가 사용되지 않는다.
>
>ModelAndView 클래스의 add~메서드를 사용하면 HttpServletRequest에 attribute가 자동 추가된다.


# 컨트롤러 설정

**VIEW가 필요하다**
Spring MVC 구조에서는 return 받은 결과를 viewer로 사용하기 때문에 jsp 경로를 return 해줘야한다

나중에는 responseBody를 사용하여 json 형태로 return 할 수 있다.

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


# 뷰 설정

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
>@RequestParam("~") 을 통해 다른 이름으로 설정할 수 있다.
>@RequestParam(required="true"): (기본값) 패러미터 요청 전달 데이터가 반드시 전달되어야 한다.
>그냥 매개변수에도 @RequestParam(required="true") 가 붙어있기 때문에 사용하지 않는 매개변수를 사용하면 예외가 발생한다.

## ModelAndView
controller 에서 viewer 주소와 넘길 json 값을 같이 return 할 수 있게 하는 자료구조
```java
@Controller
public class PostController {
	@Autowired
	private PostService service;
	static private PostController controller = new PostController();

	@PostMapping("/searchzip")
	public ModelAndView searchZip(String doro) {
		String str = service.search(doro);
	
		ModelAndView mnv = new ModelAndView();
		mnv.addObject("result", str);
		mnv.setViewName("/result.jsp");
		return mnv;
	}
}
```
>return 자료형을 ModelAndView로 변경
>**addObject** : `request.setAttribute("result", str);` 와 동일한 기능 수행
>**setViewName** : `return "/result.jsp";` 와 동일한 기능 수행
<!--stackedit_data:
eyJoaXN0b3J5IjpbNzc1NDA1MjM2LDExMzk5MjIzMDQsLTEyND
A4Nzk5NzIsODk4MzE2Nzc4XX0=
-->