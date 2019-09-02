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
<!--stackedit_data:
eyJoaXN0b3J5IjpbODMyODA5OTEzXX0=
-->