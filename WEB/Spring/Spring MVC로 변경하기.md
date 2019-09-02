## 기존 servlet 프로젝트를 스프링 프로젝트로 변경

src\control\CustomerController.java를 스프링 컨테이너용 객체로 바꾸기
1. mvc1-servlet.xml 파일에
```xml
<context:component-scan base-package="control"/>
<context:component-scan base-package="com.my.service"/>
<context:component-scan base-package="com.my.dao"/>
``` 
추가

2. CustomerController.javva에 어노테이션 추가 (@Controller)
```java
@Controller
public class CustomerController {
	@Autowired
	private CustomerService service;
	
	@RequestMapping("/login")
	public String login(String id, String pwd, HttpServletRequest request) {	
		// TODO 코드 완성 
	}
	...
}
```
3. CustomerService.java 에 어노테이션 추가 (@Service)
```java
@Service
public class CustomerService {
	@Autowired
	private CustomerDAO dao;
	...
}
```
4. CustomerDAO.java 에 어노테이션 추가 (@Repositiory)

5. CustomerDAO 에서 Mybatis 라이브러리 사용하도록 설정
(1)  src\mybatis-config.xml, customer-mapper.xml
(2) mvc1-servlet.xml 에 DataSource 객체와 SqlSessionFactory 객체 관리
(3) CustomerDAO 에서 sqlSessionFactory 자동 주입


<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE4NzU3MDMxNDldfQ==
-->