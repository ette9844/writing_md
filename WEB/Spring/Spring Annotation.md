## Spring container 설정용 Annotation

@Configuration / @Bean

xml 파일을 대체하는 JAVA 파일을 생성하기 위해 사용하는 annotation

자바 파일보다 xml이 관리하기 더 용이해서 java configuraion 보다는 xml을 더 많이 사용한다. 

### Java Annotation class로 bean 주입하기
예제 xml
```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:jdbc="http://www.springframework.org/schema/jdbc"
	xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd
		http://www.springframework.org/schema/jdbc http://www.springframework.org/schema/jdbc/spring-jdbc-4.3.xsd">
	<bean id="first" class="a.First">
		<property name="msg" value="금요일입니다."/>
	</bean>
</beans>
```

1. 일반 JAVA POJO CLASS 생성
2. 클래스 앞에 @Configuration 어노테이션 붙이기
3. 클래스 내부에 @Bean 어노테이션을 붙인 멤버함수 생성
`public 클래스명 id() {}`
4. 값을 주입해주는 코드 작성
5. `ApplicationContext ctx = new AnnotationConfigApplicationContext(yourbeanclassname.class);` 로 spring container 구동

<br>

만들어진 java annotation class
```java
@Configuration
public class Beans {
	@Bean
	public First first() {
		First f = new First();
		f.setMsg("금요일입니다.");
		return f;
	}
}
```

testing code
```java
public class Test {

	public static void main(String[] args) {
		String path="beans.xml";
		
		// 1: xml 파일 일때의 구동 코드
		// ApplicationContext ctx = new ClassPathXmlApplicationContext(path);
		
		// 2: java annotation 파일 일때의 구동 코드
		ApplicationContext ctx = new AnnotationConfigApplicationContext(Beans.class);
		
		First f = ctx.getBean("first", a.First.class);
		System.out.println(f.getMsg());
	}
}
```

## 자동 주입 Annotation

@Autowired

자동 주입

@Autowired 어노테이션을 사용하기 위해서는 beans.xml의 namespace 탭에서 context를 체크하고
```xml
<context:annotation-config/>
```
어노테이션을 사용할 수 있게 해주는 구문을 추가해준다.
<!--stackedit_data:
eyJoaXN0b3J5IjpbOTQ4NDU3NTA0LC0yNDMyMTc2MTgsNjYwNT
AwNjY3LC0xNTM0NjY0ODczXX0=
-->