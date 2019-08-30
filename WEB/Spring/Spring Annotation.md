## Spring container 설정용 Annotation

@configuration

xml 파일을 대체하는 JAVA 파일을 생성하기 위해 사용하는 annotation

자바 파일보다 xml이 관리하기 더 용이해서 xml을 더 많이 사용한다. 

## 예제
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

<br>

만들어진 java 파일
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
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTIwMjQ4NTgzMzddfQ==
-->