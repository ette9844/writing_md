

## spring에서 사용되는 ServletContextListener

#### ContextLoaderListener
```html
<listener>
  <listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
</listener>
```

내부 동작
```java
public class ContextLoaderListener implements ServletContextListener{
	// 톰캣 구동되자마자 contextInitialized 호출
	public void contextInitialized(ServletContext sc){
		// 비지니스 로직 객체 생성
		// applicationContext.xml 파일을 찾아 스프링컨테이너에 등록
	}
	pubic void contextDestroyed(ServletContext sc){
		// 비지니스 로직 객체 삭제
	}
}
```
### * Spring MVC 구조
1. 비지니스로직용 객체 관리: DAO, SERVICE
→ applicationContext.xml에서 관리

2. 백엔드 컨트롤러 객체 관리: Controller
→ `servlet-name`-servlet.xml에서 관리

이 둘을 분리하여 관리
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTM4NzMxNTQ4OSwzMDkwNzk4NCw2NjE1Nz
I0LC0xNTI1NDMzMTEyXX0=
-->