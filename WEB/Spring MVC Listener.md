```java
public class ContextLoaderListener implements ServletContextListener{
	public void contextInitialized(ServletContext sc){
	}
	pubic void contextDestroyed(ServletContext sc){
	}
}
```

1. 비지니스로직용 객체 관리: DAO, SERVICE
2. 백엔드 컨트롤러 객체 관리: Cont

이 둘을 분리하여 관리
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE2MDc5NTAxMTksLTE1MjU0MzMxMTJdfQ
==
-->