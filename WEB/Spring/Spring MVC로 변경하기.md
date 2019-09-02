## 기존 servlet 프로젝트를 스프링 MVC 프로젝트로 변경

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
4. CustomerDAO.java에 어노테이션 추가(@Repository)

5. CustomerDAO에서 Mybatis라이브러리 사용하도록 설정
      1) src\mybatis-config.xml, customer-mapper.xml
      2) mvc1-servlet.xml에 DataSource객체와 SqlSessionFactory객체관리
```xml
<bean id="dataSource" class="org.springframework.jdbc.datasource.DriverManagerDataSource">
  <property name="driverClassName" value="oracle.jdbc.driver.OracleDriver"/>
  <property name="url" value="jdbc:oracle:thin:@localhost:1521:xe"/>
  <property name="username" value="c##ora_user"/>
  <property name="password" value="yeo"/>
</bean>
<bean id="sqlSessionFactory"
      class="org.mybatis.spring.SqlSessionFactoryBean">
  <property name="dataSource" ref="dataSource"/>
  <property name="configLocation"  value="classpath:mybatis-config.xml"/>
</bean> 
```
    3) CustomerDAO에서 sqlSessionFactory자동주입
          @Autowired
          private SqlSessionFactory sqlSessionFactory;
          public Customer selectById(String id)~~~{
              SqlSession sqlSession = sqlSessionFactory.openSession();
              Customer c = 
                sqlSession.selectOne("매퍼파일용네임스페이스값.태그용ID값", id);
              if(c==null) throw new NotFoundException("ID에해당고객없음");
              sqlSession.close();
              return c;
          }


<!--stackedit_data:
eyJoaXN0b3J5IjpbLTQyMTEzNjA1LDY2ODU0NDU1N119
-->