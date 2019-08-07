```java
public class ContextLoaderListener implements ServletContextListener{
	public void contextInitialized(ServletContext sc){
		// applicationContext.xml 파일을 찾아 스프링컨테이너에 등록
	}
	pubic void contextDestroyed(ServletContext sc){
	}
}
```

1. 비지니스로직용 객체 관리: DAO, SERVICE
→ applicationContext.xml에서 관리
3. 백엔드 컨트롤러 객체 관리: Controller
→ `servlet-name`-servlet.xml에서 관리


이 둘을 분리하여 관리
<!--stackedit_data:
eyJoaXN0b3J5IjpbMjgxNzAzMjM1LC0xNTI1NDMzMTEyXX0=
-->